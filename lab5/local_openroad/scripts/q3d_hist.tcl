
# Q3(d)
# Post-route setup slack histogram

set BASE [pwd]
set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"
set SRAM "$BASE/sram22_sky130_macros/sram22_64x32m4w8"
set RESULTS "$BASE/local_openroad/results"
set REPORTS "$BASE/local_openroad/reports"

file mkdir $REPORTS

# 1. Load optimized routed design
read_db "$RESULTS/dot_product_routed_optimized.odb"

# 2. Load timing libraries
read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_liberty "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"

# 3. Restore timing constraints
create_clock -name clk -period 20.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]
set_propagated_clock [all_clocks]

# 4. Load previously extracted routing parasitics
read_spef "$RESULTS/dot_product_routed_optimized.spef"

# 5. Check worst setup slack
puts "===== Q3(d) Post-Route Timing ====="
report_worst_slack -max -digits 3

# 6. Show setup slack histogram in GUI
gui::select_chart "Endpoint Slack"

# 7. Save histogram image
save_histogram_image \
    "$REPORTS/q3d_setup_slack_histogram.png" \
    -mode setup -width 1200 -height 750

puts "Saved: $REPORTS/q3d_setup_slack_histogram.png"
