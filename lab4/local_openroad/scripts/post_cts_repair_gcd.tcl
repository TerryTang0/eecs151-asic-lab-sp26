
# =============================================================================
# EECS 151 ASIC Lab 4 - Post-CTS Timing Repair
# =============================================================================
#
# PURPOSE:
# Repair setup and hold violations after Clock Tree Synthesis (CTS).
#
# INPUT:
#   local_openroad/results/gcd_after_cts.odb
#   local_openroad/results/gcd_after_cts.sdc
#
# OUTPUT:
#   local_openroad/results/gcd_after_post_cts_repair.odb
#   local_openroad/results/gcd_after_post_cts_repair.sdc
#
# IMPORTANT:
# - Uses the existing CTS clock tree.
# - Does not rerun CTS, synthesis, or floorplanning.
# - Uses placement-estimated wire parasitics.
# - Does not perform global or detailed routing.
#
# Run this script from the lab4 directory.
# =============================================================================


# =============================================================================
# STEP 1 - LOAD THE POST-CTS PHYSICAL DESIGN
# =============================================================================
#
# The .odb database contains:
#   - Floorplan and standard-cell locations
#   - Gate-level connectivity
#   - Clock buffers inserted during CTS
#   - Resized cells and inserted signal buffers
#
# Load the same SKY130 HD timing library used in earlier stages.
#
# We do NOT use load_gcd.tcl because it would load the original
# Yosys netlist rather than the physical design after CTS.

set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"

read_db local_openroad/results/gcd_after_cts.odb

read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"


# =============================================================================
# STEP 2 - RESTORE TIMING CONSTRAINTS
# =============================================================================
#
# The .sdc file contains timing constraints from the CTS stage.
#
# Important constraints:
#   Clock period      = 5.0 ns
#   Clock uncertainty = 0.1 ns
#
# Using read_sdc avoids having to manually recreate the clock.
#
# The clock is now propagated through the actual CTS buffer network,
# instead of being treated as an ideal clock.

read_sdc local_openroad/results/gcd_after_cts.sdc

set_propagated_clock [all_clocks]


# =============================================================================
# STEP 3 - CONFIGURE WIRE RC AND ESTIMATE PARASITICS
# =============================================================================
#
# Physical wires have resistance (R) and capacitance (C).
# These properties affect signal propagation delay.
#
# Since we have not routed the design yet, OpenROAD estimates
# the wire delays using the physical placement.
#
# Keep the same reference layers used in previous scripts.

set_wire_rc -signal -layer met2
set_wire_rc -clock -layer met3

estimate_parasitics -placement


# =============================================================================
# STEP 4 - CHECK TIMING BEFORE REPAIR
# =============================================================================
#
# We expect approximately the same results as after CTS:
#
#   Setup WNS: -0.49 ns
#   Hold WNS:  +0.42 ns
#
# WNS = Worst Negative Slack.
# Negative slack means that a timing constraint is violated.
#
# Setup violation:
#   Data arrives too late.
#
# Hold violation:
#   Data arrives too early.
#
# Record both results before making any changes.

puts "\n===== BEFORE POST-CTS REPAIR ====="

puts "\n--- SETUP TIMING ---"
report_worst_slack -max
report_checks -path_delay max -group_path_count 1

puts "\n--- HOLD TIMING ---"
report_worst_slack -min
report_checks -path_delay min -group_path_count 1

report_tns


# =============================================================================
# STEP 5 - REPAIR SETUP TIMING
# =============================================================================
#
# GOAL:
# Reduce the maximum delay of setup-critical data paths.
#
# OpenROAD may:
#   1. Upsize standard cells to increase driving strength.
#   2. Insert or remove signal buffers.
#   3. Clone high-fanout logic.
#   4. Swap logically equivalent cell input pins.
#
# Example:
#
#   Before:
#       FF -> weak gate -> long delay -> FF
#
#   After:
#       FF -> stronger gate -> shorter delay -> FF
#
# NOTE:
# No SystemVerilog RTL is modified.
# The clock tree is not regenerated.
#
# Setup repair is performed BEFORE hold repair.

puts "\n===== STEP 5: SETUP TIMING REPAIR ====="

repair_timing -setup

# Newly inserted or resized cells may overlap other cells.
# Detailed placement moves cells onto legal placement sites.

detailed_placement

# Cell locations may have changed after optimization.
# Update the estimated wire resistance and capacitance.

estimate_parasitics -placement


# =============================================================================
# STEP 6 - CHECK TIMING AFTER SETUP REPAIR
# =============================================================================
#
# Compare this setup slack with the original -0.49 ns.
#
# The result is not guaranteed to be positive.
# Some critical paths cannot be fixed solely by cell sizing
# and buffer insertion.
#
# Also check hold timing, because speeding up a data path
# can potentially introduce a hold violation.

puts "\n===== AFTER SETUP REPAIR ====="

puts "\n--- SETUP TIMING ---"
report_worst_slack -max
report_checks -path_delay max -group_path_count 1

puts "\n--- HOLD TIMING ---"
report_worst_slack -min

report_tns


# =============================================================================
# STEP 7 - REPAIR HOLD TIMING
# =============================================================================
#
# GOAL:
# Fix any data paths that arrive too early.
#
# Unlike setup repair, hold repair generally needs to INCREASE
# the minimum data path delay.
#
# OpenROAD can insert delay buffers into short data paths.
#
# Example:
#
#   Before:
#       FF -> short logic -> FF
#
#   After:
#       FF -> buffer -> short logic -> FF
#
# IMPORTANT:
# - Do not use -allow_setup_violations.
# - We do not want hold repair to intentionally create
#   additional setup violations.
#
# If all hold paths already meet timing, this command may
# simply report that no hold repair is necessary.

puts "\n===== STEP 7: HOLD TIMING REPAIR ====="

repair_timing -hold

# Legalize any cells added by the hold repair.

detailed_placement

# Update estimated wire parasitics after placement changes.

estimate_parasitics -placement


# =============================================================================
# STEP 8 - FINAL POST-CTS TIMING ANALYSIS
# =============================================================================
#
# Check BOTH setup and hold again.
#
# We must not assume that fixing one timing requirement
# automatically preserves the other.
#
# Setup slack >= 0 : Setup timing passes.
# Hold slack  >= 0 : Hold timing passes.
#
# Both must pass to meet timing in this analysis.

puts "\n===== FINAL POST-CTS SETUP TIMING ====="

report_worst_slack -max
report_checks -path_delay max -group_path_count 1

puts "\n===== FINAL POST-CTS HOLD TIMING ====="

report_worst_slack -min
report_checks -path_delay min -group_path_count 1

puts "\n===== FINAL TOTAL NEGATIVE SLACK ====="

report_tns

# Report the physical cell area and utilization after repair.

puts "\n===== FINAL DESIGN AREA ====="

report_design_area


# =============================================================================
# STEP 9 - SAVE THE REPAIRED DESIGN
# =============================================================================
#
# Save the physical database:
#   Includes all CTS cells and post-CTS timing changes.
#
# Save the timing constraints:
#   Can be restored in the next OpenROAD session.
#
# These files become the inputs for our routing stage.

write_db local_openroad/results/gcd_after_post_cts_repair.odb

write_sdc local_openroad/results/gcd_after_post_cts_repair.sdc

puts "\n===== POST-CTS TIMING REPAIR COMPLETED ====="
