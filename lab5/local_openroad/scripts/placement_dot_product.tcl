# Standard-cell placement

set results "local_openroad/results"

set sky130_lib \
  "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd/sky130_fd_sc_hd__tt_025C_1v80.lib"

set sram_lib \
  "sram22_sky130_macros/sram22_64x32m4w8/sram22_64x32m4w8_tt_025C_1v80.lib"

# 1. Load previous floorplan
read_db "$results/dot_product_floorplan.odb"

# 2. Load timing libraries
read_liberty $sky130_lib
read_liberty $sram_lib

# 3. Global placement
puts "===== Global placement ====="
global_placement -density 0.40

# 4. Detailed placement
puts "===== Detailed placement ====="
detailed_placement

# 5. Check placement legality
check_placement -verbose

# 6. Save checkpoint
write_db "$results/dot_product_placed.odb"
write_def "$results/dot_product_placed.def"

puts "===== Placement completed ====="