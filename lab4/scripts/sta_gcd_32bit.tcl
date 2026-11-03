
# EECS151 Lab 4 - 32-bit GCD STA
# ABC timing optimization experiment (5 ns)

set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"

# 1. Load technology and cell geometry
read_lef "$SKY130/sky130hd.tlef"
read_lef "$SKY130/sky130_fd_sc_hd_merged.lef"

# 2. Load SKY130 timing library
read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"

# 3. Load new ABC-optimized netlist
read_verilog build/yosys/gcd_32bit/gcd_coprocessor_abc_5ns.v

# 4. Link design
link_design gcd_coprocessor

# 5. Match design.yml clock constraints
create_clock -name clk -period 5.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]

# 6. Keep any other original I/O and reset constraints here

# 7. Report setup timing
report_checks -path_delay max -group_path_count 5
report_worst_slack -max

# 8. Report hold timing
report_checks -path_delay min -group_path_count 5
report_worst_slack -min
