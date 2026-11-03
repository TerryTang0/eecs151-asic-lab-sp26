
# =============================================================================
# STEP 1 - IMPORT THE SYNTHESIZED CIRCUIT
# =============================================================================

source local_openroad/scripts/load_gcd.tcl

# =============================================================================
# STEP 2 - FLOORPLANNING
# =============================================================================
# -die_area {0 0 600 600}
# -core_area {10 10 590 590}
# -site unithd (Specifies the legal standard-cell placement site for SKY130 HD)
# OpenROAD automatically creates standard-cell rows in the core

initialize_floorplan \
    -site unithd \
    -die_area {0 0 600 600} \
    -core_area {10 10 590 590}

# Create routing tracks for the metal layers
# Define where wires can be placed in later stages

make_tracks

# =============================================================================
# STEP 3 - CONFIGURE WIRE RESISTANCE AND CAPACITANCE (RC)
# =============================================================================
# Configure R and C for wires

# Use SKY130 metal layers for wire RC estimates
# Uses metal 2 parameters for signal-wire RC estimates.

set_wire_rc -signal -layer met2

#   Uses metal 3 parameters for clock-wire RC estimates.

set_wire_rc -clock -layer met3

# =============================================================================
# STEP 4 - I/O PIN PLACEMENT
# =============================================================================
# Top-level I/O ports placement
# Assign location for the pins and specifies the metal layer for horizontal pin shapes

place_pins -hor_layers met3 -ver_layers met2

# =============================================================================
# STEP 5 - STANDARD-CELL PLACEMENT
# =============================================================================
# First, sets a local placement-density target of 50%

global_placement -density 0.50

# Second, netlist contains several standard-cell instances: gates, mux, flip-flop and other comb logic
# Moves cells onto legal placement sites and removes overlaps

detailed_placement

# =============================================================================
# STEP 6 - BASELINE STATIC TIMING ANALYSIS
# =============================================================================
# 
# Estimates resistance and capacitance from cell and pin placement

estimate_parasitics -placement

# STA timing report
# Check the slack

puts "\n===== BEFORE REPAIR ====="
report_worst_slack -max
report_checks -path_delay max -group_path_count 1

# Save the current design as an OpenDB checkpoint
# THis file contains the physical design states before optimization

write_db local_openroad/results/gcd_before_repair.odb

# =============================================================================
# STEP 7 - ELECTRICAL AND HIGH-FANOUT REPAIR
# =============================================================================
# Limit cell fanout of mux and repair the design

set_max_fanout 16 [current_design]
repair_design -verbose

# Run the detailed placement again
# and recalculate the wire delay

detailed_placement
estimate_parasitics -placement

# Rerun the STA timing report and check the slack

puts "\n===== AFTER REPAIR ====="
report_worst_slack -max
report_checks -path_delay max -group_path_count 1

# Save the physically repaired design before setup optimization

write_db local_openroad/results/gcd_after_repair.odb

# =============================================================================
# STEP 8 - SETUP TIMING OPTIMIZATION
# =============================================================================
# Directly optimize paths that violate setup timing
# repair_timing -setup:
#   Uses the SKY130 standard-cell library to improve critical-path timing
# OpenROAD may upsize cells, insert buffers, clone gates, or swap pins

puts "\n===== AFTER SETUP TIMING OPTIMIZATION ====="

repair_timing -setup

# Rerun the detailed cells placement

detailed_placement
estimate_parasitics -placement

# Timing report and synthesis report on the new placement

report_worst_slack -max
report_checks -path_delay max -group_path_count 1
report_design_area

# Save the final placed and setup-optimized physical design

write_db local_openroad/results/gcd_after_setup_repair.odb

