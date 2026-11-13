
# EECS 151/251A Lab 5
# Optimized Dot-Product ASIC Routing
# Sky130 HD + SRAM22

set BASE [pwd]
set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"
set SRAM "$BASE/sram22_sky130_macros/sram22_64x32m4w8"
set OUT "$BASE/local_openroad_q4/results"

# ==========================================
# 1. Load optimized post-CTS checkpoint
# ==========================================

set INPUT_DB "$OUT/dot_product_cts_optimized.odb"

if {![file exists $INPUT_DB]} {
    error "Missing optimized CTS checkpoint: $INPUT_DB"
}

puts "===== Load optimized post-CTS design ====="

read_db $INPUT_DB

read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_liberty "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"

create_clock -name clk -period 20.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]
set_propagated_clock [all_clocks]

set_wire_rc -signal -layer met2
set_wire_rc -clock -layer met3

set_routing_layers -signal met1-met5 -clock met3-met5
set_macro_extension 2

# ==========================================
# 2. Global routing
# ==========================================

puts "===== Global routing ====="

global_route \
    -guide_file "$OUT/dot_product_route_optimized.guide" \
    -congestion_report_file "$OUT/dot_product_congestion_optimized.rpt"

estimate_parasitics -global_routing

puts "===== Global-route timing ====="

report_worst_slack -max
report_worst_slack -min

write_db "$OUT/dot_product_global_route_optimized.odb"

# ==========================================
# 3. Detailed routing
# ==========================================

puts "===== Detailed routing ====="

detailed_route \
    -output_drc "$OUT/dot_product_drc_optimized.rpt" \
    -droute_end_iter 20

# ==========================================
# 4. Save optimized routed layout
# ==========================================

puts "===== Save optimized routed design ====="

write_db "$OUT/dot_product_routed_optimized.odb"
write_def "$OUT/dot_product_routed_optimized.def"

puts "Saved: $OUT/dot_product_routed_optimized.odb"
puts "===== Optimized routing completed ====="
