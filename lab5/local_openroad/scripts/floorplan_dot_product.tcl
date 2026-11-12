# Initial OpenROAD floorplan (Sky130 HD + SRAM22)
# This step integrate SRAM22 in floorplanning
# This creates a floorplan ONLY: no standard-cell placement, CTS, PDN or routing yet.

set LAB5 [pwd]
set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"
set SRAM "$LAB5/sram22_sky130_macros/sram22_64x32m4w8"
set NETLIST "$LAB5/local_openroad/results/dot_product_mapped.v"
set RESULTS "$LAB5/local_openroad/results"

foreach path [list \
    "$SKY130/sky130hd.tlef" \
    "$SKY130/sky130_fd_sc_hd_merged.lef" \
    "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib" \
    "$SRAM/sram22_64x32m4w8.lef" \
    "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib" \
    "$NETLIST"] {
    if {![file exists $path]} {
        error "Missing input file: $path\nRun this script from your Lab 5 root."
    }
}
file mkdir $RESULTS

puts "===== 1. Loading Sky130 HD + SRAM22 physical views ====="
read_lef "$SKY130/sky130hd.tlef"
read_lef "$SKY130/sky130_fd_sc_hd_merged.lef"
read_lef "$SRAM/sram22_64x32m4w8.lef"

puts "===== 2. Loading timing models and synthesized netlist ====="
read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_liberty "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"
read_verilog $NETLIST
link_design dot_product

# Lab 5 baseline period. Real setup/hold closure is checked AFTER placement/CTS/route.
create_clock -name clk -period 20.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]

puts "===== 3. Initializing die and core ====="
# Same generous starting die size as the official Lab 5 example.
# Site 'unithd' comes from the Sky130 HD LEF, as in the Lab 4 local flow.
initialize_floorplan \
    -die_area {0 0 1000 1000} \
    -core_area {20 20 980 980} \
    -site unithd
make_tracks

puts "===== 4. Manually placing one SRAM macro ====="
place_inst -name sram \
    -location {80 80} \
    -orientation R90 \
    -status FIRM

# Protect an extra 10 um around the macro from standard-cell placement rows.
cut_rows -halo_width_x 10 -halo_width_y 10

puts "===== 5. Placing top-level pins (not standard cells) ====="
place_pins -hor_layers met3 -ver_layers met2

puts "===== 6. Writing checkpoint ====="
write_db "$RESULTS/dot_product_floorplan.odb"
write_def "$RESULTS/dot_product_floorplan.def"
puts "Floorplan saved: $RESULTS/dot_product_floorplan.odb"
puts "NOTE: SRAM placed; standard cells, power grid, CTS and routing NOT done yet."
