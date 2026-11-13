# PAR master script

puts "===== STAGE 1: PDN + PLACEMENT ====="
source local_openroad_q4/scripts/pdn_and_place_dot_product.tcl

puts "===== STAGE 2: CLOCK TREE SYNTHESIS ====="
source local_openroad_q4/scripts/cts_dot_product.tcl

puts "===== STAGE 3: GLOBAL + DETAILED ROUTING ====="
source local_openroad_q4/scripts/route_dot_product.tcl

puts "===== P&R FLOW COMPLETED ====="