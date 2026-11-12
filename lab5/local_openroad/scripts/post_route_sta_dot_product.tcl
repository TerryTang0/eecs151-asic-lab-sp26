# Post-route static timing analysis
# resize cells, insert buffers, or change the already routed layout.
# Add RC extraction
# Prerequisite: local_openroad/rcx_patterns.rules, the OpenROAD Flow Scripts
# Sky130 HD RC extraction rules (sky130hd shares the sky130hs rule file).

set BASE [pwd]
set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"
set SRAM "$BASE/sram22_sky130_macros/sram22_64x32m4w8"
set RESULTS "$BASE/local_openroad/results"
set REPORTS "$BASE/local_openroad/reports"
set RCX_RULES "$BASE/local_openroad/rcx_patterns.rules"
set DB "$RESULTS/dot_product_routed.odb"
set SKY130_LIB "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"
set SRAM_LIB "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"

foreach input_file [list $DB $SKY130_LIB $SRAM_LIB $RCX_RULES] {
    if {![file exists $input_file]} {
        error "Missing input file: $input_file\nSee the download command for rcx_patterns.rules. Run from lab5/."
    }
}
file mkdir $REPORTS

puts "===== 1. Restore routed design and timing libraries ====="
read_db $DB
read_liberty $SKY130_LIB
read_liberty $SRAM_LIB

# Match the constraints used in the earlier floorplan, CTS, and route stages.
# Currently this only constrains the clock, not external I/O delays.
create_clock -name clk -period 20.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]
set_propagated_clock [all_clocks]

puts "===== 2. Extract RC parasitics from actual detailed routing ====="
puts "Extraction rules: $RCX_RULES"
set_extraction_rules_file $RCX_RULES
extract_parasitics
set SPEF "$RESULTS/dot_product_routed.spef"
write_spef $SPEF
puts "SPEF saved: $SPEF"

puts "===== 3. Post-route timing summary (20 ns clock, TT corner) ====="
report_worst_slack -max -digits 3
report_worst_slack -min -digits 3
report_tns -digits 3

puts "===== 4. Detailed setup and hold timing paths ====="
set SETUP_RPT "$REPORTS/post_route_setup.rpt"
set HOLD_RPT  "$REPORTS/post_route_hold.rpt"
set UNC_RPT   "$REPORTS/post_route_unconstrained.rpt"

report_checks -path_delay max -group_path_count 20 \
    -format full_clock_expanded \
    -fields {input_pin slew capacitance net} -digits 3 > $SETUP_RPT

report_checks -path_delay min -group_path_count 20 \
    -format full_clock_expanded \
    -fields {input_pin slew capacitance net} -digits 3 > $HOLD_RPT

# Without input/output delays the top-level I/O paths are not fully
# constrained. Save an explicit report to make that limitation visible.
report_checks -unconstrained -group_path_count 20 \
    -format full_clock_expanded -digits 3 > $UNC_RPT

puts "Setup report: $SETUP_RPT"
puts "Hold report: $HOLD_RPT"
puts "Unconstrained-path report: $UNC_RPT"
puts "===== Post-route STA finished ====="
puts "NOTE: This is OpenROAD TT-corner timing with routed RC extraction; it is not foundry signoff STA."
