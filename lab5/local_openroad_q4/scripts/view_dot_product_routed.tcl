# Launch from lab5/ with OpenROAD -gui
set BASE [pwd]
set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"
set SRAM "$BASE/sram22_sky130_macros/sram22_64x32m4w8"
set DB "$BASE/local_openroad_q4/results/dot_product_routed.odb"
if {![file exists $DB]} {error "No routed database yet: $DB"}
read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_liberty "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"
read_db $DB
create_clock -name clk -period 20.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]
set_propagated_clock [all_clocks]
puts "Opened routed dot_product layout"
