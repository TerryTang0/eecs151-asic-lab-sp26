# Post-CTS Timing Optimization
# Sky130 HD + SRAM22
#


set BASE [pwd]
set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"
set SRAM "$BASE/sram22_sky130_macros/sram22_64x32m4w8"
set RESULTS "$BASE/local_openroad/results"
set REPORTS "$BASE/local_openroad/reports"

set INPUT_DB "$RESULTS/dot_product_cts.odb"
set OUTPUT_DB "$RESULTS/dot_product_cts_optimized.odb"

set SKY130_LIB "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"
set SRAM_LIB "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"

foreach f [list $INPUT_DB $SKY130_LIB $SRAM_LIB] {
    if {![file exists $f]} {
        error "Required file not found: $f"
    }
}

file mkdir $REPORTS

# ==========================================
# 1. Load post-CTS design
# ==========================================

puts "===== 1. Load post-CTS design ====="

read_db $INPUT_DB
read_liberty $SKY130_LIB
read_liberty $SRAM_LIB

create_clock -name clk -period 20.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]
set_propagated_clock [all_clocks]

set_wire_rc -signal -layer met2
set_wire_rc -clock -layer met3

estimate_parasitics -placement

# ==========================================
# 2. Timing before optimization
# ==========================================

puts "===== 2. Timing before optimization ====="

report_worst_slack -max -digits 3
report_worst_slack -min -digits 3
report_tns -digits 3

report_checks -path_delay max \
    -group_path_count 5 -digits 3 \
    > "$REPORTS/post_cts_setup_before_opt.rpt"

report_checks -path_delay min \
    -group_path_count 5 -digits 3 \
    > "$REPORTS/post_cts_hold_before_opt.rpt"

# ==========================================
# 3. Repair electrical violations
# ==========================================

puts "===== 3. Repair electrical violations ====="

# Repair max capacitance, max slew, and fanout
repair_design

detailed_placement
estimate_parasitics -placement

# ==========================================
# 4. Setup timing optimization
# ==========================================

puts "===== 4. Setup timing optimization ====="

repair_timing -setup

estimate_parasitics -placement

# ==========================================
# 5. Hold timing optimization
# ==========================================

puts "===== 5. Hold timing optimization ====="

repair_timing -hold

# ==========================================
# 6. Legalize placement
# ==========================================

puts "===== 6. Detailed placement ====="

detailed_placement
check_placement -verbose

# Connect power and ground pins of inserted cells
add_global_connection -net VDD \
    -inst_pattern {.*} \
    -pin_pattern {^(VPWR|VPB|vdd)$} -power

add_global_connection -net VSS \
    -inst_pattern {.*} \
    -pin_pattern {^(VGND|VNB|vss)$} -ground

global_connect

estimate_parasitics -placement

# ==========================================
# 7. Timing After optimization
# ==========================================

puts "===== 7. Timing after optimization ====="

report_worst_slack -max -digits 3
report_worst_slack -min -digits 3
report_tns -digits 3

report_checks -path_delay max \
    -group_path_count 5 -digits 3 \
    > "$REPORTS/post_cts_setup_after_opt.rpt"

report_checks -path_delay min \
    -group_path_count 5 -digits 3 \
    > "$REPORTS/post_cts_hold_after_opt.rpt"

# ==========================================
# 8. Save optimized checkpoint
# ==========================================

puts "===== 8. Save optimized checkpoint ====="

write_db $OUTPUT_DB
write_def "$RESULTS/dot_product_cts_optimized.def"

puts "Saved: $OUTPUT_DB"
puts "===== Post-CTS optimization completed ====="
