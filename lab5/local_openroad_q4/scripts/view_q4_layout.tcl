# Q4(b) - View routed layout and power density

set BASE [pwd]
set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"
set SRAM "$BASE/sram22_sky130_macros/sram22_64x32m4w8"
set RESULTS "$BASE/local_openroad_q4/results"

# 1. Load routed design
read_db "$RESULTS/dot_product_routed_optimized.odb"

# 2. Load timing and power libraries
read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_liberty "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"

# 3. Configure clock
create_clock -name clk -period 20.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]
set_propagated_clock [all_clocks]

# 4. Load routed parasitics
set SPEF "$RESULTS/dot_product_routed_optimized.spef"

if {[file exists $SPEF]} {
    read_spef $SPEF
} else {
    puts "WARNING: SPEF not found: $SPEF"
}

puts "===== Q4(b) layout and timing data loaded ====="
