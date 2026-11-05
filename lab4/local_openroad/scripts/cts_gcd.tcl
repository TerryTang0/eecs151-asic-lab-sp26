
# =============================================================================
# Lab 4 - Clock Tree Synthesis (CTS)
# =============================================================================
# PURPOSE:
# Continue from the placed and timing-optimized GCD coprocessor
# Build a physical clock distribution network and analyze clock skew
#
# INPUT:
#   gcd_after_setup_repair.odb
#
# OUTPUT:
#   gcd_after_cts.odb
#   gcd_after_cts.sdc
#
# NOTE:
# This is a pre-routing CTS experiment
# Actual signal routing has NOT been completed
# =============================================================================


# =============================================================================
# STEP 1 - LOAD THE PLACED DESIGN
# =============================================================================
# OpenDB stores the physical design, including:
#   - Die and core boundaries
#   - Standard-cell instances and locations
#   - Netlist connectivity
#   - Inserted buffers and resized cells

set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"

read_db local_openroad/results/gcd_after_setup_repair.odb

# Restore the timing library.

read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"


# =============================================================================
# STEP 2 - RESTORE THE CLOCK CONSTRAINTS
# =============================================================================
# Recreate the original 5 ns clock and uncertainty
# Keep these identical to the placement

create_clock -name clk -period 5.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]


# =============================================================================
# STEP 3 - CONFIGURE WIRE RC
# =============================================================================
# Configure wires' R and C, same as the step in PAR

set_wire_rc -signal -layer met2
set_wire_rc -clock -layer met3

estimate_parasitics -placement


# =============================================================================
# STEP 4 - REPORT TIMING BEFORE CTS
# =============================================================================
# Report setup and hold timing before inserting clock buffers

puts "\n===== BEFORE CTS ====="

report_worst_slack -max
report_worst_slack -min


# =============================================================================
# STEP 5 - CLOCK TREE SYNTHESIS
# =============================================================================
# CTS inserts clock buffers to distribute the clock and control skew
#
# Important:
#   Clock insertion delay = Clock travel time to a sink.
#   Clock skew = Difference in arrival times between clock sinks.
#
# repair_clock_inverters:
#   Prepares clock inverter structures for CTS.

puts "\n===== CLOCK TREE SYNTHESIS ====="

repair_clock_inverters

# Build the tree using SKY130 HD clock-buffer cells.
#
# -root_buf:
#   Buffer type used at the clock tree root.
#
# -buf_list:
#   Permitted buffer types used to construct the clock tree.
#
# All buffers come from the same SKY130 HD cell library.

clock_tree_synthesis \
    -root_buf sky130_fd_sc_hd__clkbuf_8 \
    -buf_list {sky130_fd_sc_hd__clkbuf_2 sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_8}

# Repair long clock connections near the clock-tree root.

repair_clock_nets

# Rerun placement with new inserted clock buffers.

detailed_placement


# =============================================================================
# STEP 6 - POST-CTS TIMING ANALYSIS
# =============================================================================
# Before CTS, STA assumed an ideal clock.
#
# After CTS, the clock is propagated through its physical buffers 
# and use estimated wire parasitics to calculate arrival times.

puts "\n===== POST-CTS TIMING ANALYSIS ====="

set_propagated_clock [all_clocks]

# Measure the effects of clock insertion delay and skew.

estimate_parasitics -placement

# Report clock tree structure and inserted buffer information.

report_cts

# Report estimated clock skew between registers.

report_clock_skew

# Check setup time
# data must arrive before the capture deadline.

puts "\n===== POST-CTS SETUP TIMING ====="

report_worst_slack -max
report_checks -path_delay max -group_path_count 1

# Check hold time
# Data must not arrive too early.

puts "\n===== POST-CTS HOLD TIMING ====="

report_worst_slack -min
report_checks -path_delay min -group_path_count 1


# =============================================================================
# STEP 7 - SAVE THE POST-CTS DESIGN
# =============================================================================
# Save the physical database, including the new inserted clock buffers
#
# Save timing constraints separately in sdc file

write_db local_openroad/results/gcd_after_cts.odb

write_sdc local_openroad/results/gcd_after_cts.sdc

puts "\n===== CTS COMPLETED ====="
