
# =============================================================================
# EECS 151 ASIC Lab 4 - OpenROAD GUI Visualization
# =============================================================================
#
# PURPOSE:
# Visualize the existing GCD coprocessor physical layout.
#
# INPUT:
#   gcd_after_cts.odb
#   gcd_after_cts.sdc
#
# This script does not modify the circuit.
# =============================================================================

# STEP 1 - Load the placed design after CTS.
# This database contains the cell placement, floorplan,
# I/O locations, and the inserted clock buffers.

read_db local_openroad/results/gcd_after_cts.odb

# STEP 2 - Load the standard-cell timing library.

set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"

read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"

# STEP 3 - Restore the clock constraints.

read_sdc local_openroad/results/gcd_after_post_cts_repair.sdc

set_propagated_clock [all_clocks]

# STEP 4 - Estimate wire delays based on physical placement.

set_wire_rc -signal -layer met2
set_wire_rc -clock -layer met3

estimate_parasitics -placement

puts "GCD coprocessor loaded successfully!"
