# Sky130 HD + SRAM22: clock-tree synthesis
# Run after successful 01_pdn_and_place_dot_product.tcl.

set BASE [pwd]
set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"
set SRAM "$BASE/sram22_sky130_macros/sram22_64x32m4w8"
set OUT "$BASE/local_openroad/results"
if {![file exists "$OUT/dot_product_pdn_placed.odb"]} {
    error "Missing PDN checkpoint; run 01_pdn_and_place_dot_product.tcl first."
}

read_db "$OUT/dot_product_pdn_placed.odb"
read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_liberty "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"
create_clock -name clk -period 20.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]
set_wire_rc -signal -layer met2
set_wire_rc -clock -layer met3
estimate_parasitics -placement

puts "===== Build clock tree for standard-cell FFs and SRAM clock pin ====="
clock_tree_synthesis \
    -root_buf sky130_fd_sc_hd__clkbuf_8 \
    -buf_list {sky130_fd_sc_hd__clkbuf_2 sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_8}
repair_clock_nets
# Place newly inserted clock buffers legally.
detailed_placement
check_placement -verbose

set_propagated_clock [all_clocks]
estimate_parasitics -placement
puts "===== Post-CTS timing (placement-estimated parasitics) ====="
report_worst_slack -max
report_worst_slack -min

write_db "$OUT/dot_product_cts.odb"
write_def "$OUT/dot_product_cts.def"
puts "Saved: $OUT/dot_product_cts.odb"
