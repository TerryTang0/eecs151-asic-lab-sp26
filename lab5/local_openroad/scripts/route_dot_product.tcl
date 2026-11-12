# Sky130 HD + SRAM22: global & detailed signal routing
# Run after successful CTS.

set BASE [pwd]
set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"
set SRAM "$BASE/sram22_sky130_macros/sram22_64x32m4w8"
set OUT "$BASE/local_openroad/results"
if {![file exists "$OUT/dot_product_cts.odb"]} {
    error "Missing CTS checkpoint; run 02_cts_dot_product.tcl first."
}

read_db "$OUT/dot_product_cts.odb"
read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_liberty "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"
create_clock -name clk -period 20.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]
set_propagated_clock [all_clocks]
set_wire_rc -signal -layer met2
set_wire_rc -clock -layer met3
set_routing_layers -signal met1-met5 -clock met3-met5
set_macro_extension 2

puts "===== Global routing ====="
global_route -guide_file "$OUT/dot_product_route.guide" \
             -congestion_report_file "$OUT/dot_product_congestion.rpt"
estimate_parasitics -global_routing
puts "===== Global-route timing (estimated parasitics) ====="
report_worst_slack -max
report_worst_slack -min
write_db "$OUT/dot_product_global_route.odb"

puts "===== Detailed routing ====="
detailed_route -output_drc "$OUT/dot_product_drc.rpt" -droute_end_iter 20

puts "===== Final routing checkpoint ====="
write_db "$OUT/dot_product_routed.odb"
write_def "$OUT/dot_product_routed.def"
puts "Saved: $OUT/dot_product_routed.odb"
puts "NOTE: This is routed layout, not DRC/LVS or signoff timing closure."
