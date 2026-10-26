# ==========================================
# GCD Static Timing Analysis using OpenSTA
# EECS 251A - ASIC Lab 3
# Run from the lab3 directory
# ==========================================

# 1. Load SKY130 standard-cell timing library
read_liberty build/sky130/sky130_fd_sc_hd__tt_025C_1v80.lib

# 2. Load the Yosys technology-mapped netlist
read_verilog build/yosys/gcd_sky130_mapped.v

# 3. Identify the top-level design
link_design gcd

# 4. Set the clock period to 20 ns
create_clock -name clk -period 20 [get_ports clk]

# 5. Set setup clock uncertainty to 0.1 ns
set_clock_uncertainty -setup 0.1 [get_clocks clk]

# 6. Show the timing units and worst setup paths
report_units
report_checks -path_delay max -group_path_count 5

# 7. Report worst negative slack and total negative slack
report_wns
report_tns