
# To view placed dot-product design on GUI

set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"
set SRAM "sram22_sky130_macros/sram22_64x32m4w8"

set DB "local_openroad_q4/results/dot_product_placed.odb"

if {![file exists $DB]} {
    error "Placed database not found: $DB"
}

# Load timing libraries
read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_liberty "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"

# Load physical database
read_db $DB

# Restore basic clock constraint for timing tools
create_clock -name clk -period 20.0 [get_ports clk]

puts "Loaded placed dot-product design!"
puts "Instance count: [llength [[ord::get_db_block] getInsts]]"
