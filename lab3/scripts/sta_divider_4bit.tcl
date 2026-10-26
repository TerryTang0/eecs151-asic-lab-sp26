
# EECS 251A Lab 3 - 4-bit Divider STA

# 1. Load SKY130 standard-cell timing library
read_liberty build/sky130/sky130_fd_sc_hd__tt_025C_1v80.lib

# 2. Load synthesized divider
read_verilog build/yosys/divider_4bit/divider_mapped.v
link_design divider

# 3. Create clock (20 ns = 50 MHz)
create_clock -name clk -period 10 [get_ports clk]

# 4. Input and output constraints
set_input_delay 0 -clock clk [all_inputs -no_clocks]
set_output_delay 0 -clock clk [all_outputs]

set_input_transition 0.1 [all_inputs -no_clocks]
set_load 0.01 [all_outputs]

# 5. Check constraints
puts "\n===== CHECK SETUP ====="
check_setup

# 6. Critical path
puts "\n===== CRITICAL PATH ====="
report_checks -path_delay max -group_path_count 5

# 7. Worst setup slack
puts "\n===== WORST SETUP SLACK ====="
report_worst_slack -max

# 8. Minimum clock period
puts "\n===== MINIMUM CLOCK PERIOD ====="
report_clock_min_period

# 9. Hold timing
puts "\n===== HOLD TIMING ====="
report_checks -path_delay min -group_path_count 3
