
# Load 32-bit GCD coprocessor into OpenROAD
# Execute from the lab4 directory

set LAB4 [pwd]
set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"

# Technology and standard-cell physical libraries
read_lef "$SKY130/sky130hd.tlef"
read_lef "$SKY130/sky130_fd_sc_hd_merged.lef"

# Standard-cell timing library
read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"

# Synthesized netlist
read_verilog "$LAB4/build/yosys/gcd_32bit/gcd_coprocessor_mapped.v"

# Connect netlist to standard-cell definitions
link_design gcd_coprocessor

# Use the original design.yml clock settings
create_clock -name clk -period 5.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]

puts "GCD netlist loaded successfully"
report_design_area
