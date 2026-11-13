# Sky130 HD + SRAM22: tapcells, PDN, (re)placement
# Replaces the earlier placement checkpoint because tapcells belong BEFORE placement.

set BASE [pwd]
set SKY130 "$env(HOME)/Documents/eda-tools/OpenROAD/test/sky130hd"
set SRAM "$BASE/sram22_sky130_macros/sram22_64x32m4w8"
set OUT "$BASE/local_openroad_q4/results"

foreach f [list "$OUT/dot_product_floorplan.odb" \
                 "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib" \
                 "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"] {
    if {![file exists $f]} { error "Required file missing: $f" }
}

puts "===== Load floorplan and timing libraries ====="
read_db "$OUT/dot_product_floorplan.odb"
set sram_inst [[ord::get_db_block] findInst sram]

puts "SRAM orientation = [$sram_inst getOrient]"
if {[$sram_inst getOrient] ne "R90"} {
    error "SRAM must be R90. Regenerate the floorplan first."
}

read_liberty "$SKY130/sky130_fd_sc_hd__tt_025C_1v80.lib"
read_liberty "$SRAM/sram22_64x32m4w8_tt_025C_1v80.lib"
create_clock -name clk -period 20.0 [get_ports clk]
set_clock_uncertainty 0.1 [get_clocks clk]
set_wire_rc -signal -layer met2
set_wire_rc -clock -layer met3

puts "===== Insert physical tie-high and tie-low cells ====="

insert_tiecells sky130_fd_sc_hd__conb_1/HI -prefix TIEHI_
insert_tiecells sky130_fd_sc_hd__conb_1/LO -prefix TIELO_

puts "===== Insert substrate/well tap cells BEFORE standard cell placement ====="
tapcell -distance 14 -tapcell_master sky130_fd_sc_hd__tapvpwrvgnd_1

puts "===== Connect physical supply pins (standard cells + SRAM) ====="
# Sky130 HD standard-cell pins VPWR/VGND + well/bulk pins VPB/VNB
# SRAM22 pins vdd/vss are on met2 and require a separate macro PDN connection.
add_global_connection -net VDD -inst_pattern {.*} -pin_pattern {^(VPWR|VPB|vdd)$} -power
add_global_connection -net VSS -inst_pattern {.*} -pin_pattern {^(VGND|VNB|vss)$} -ground
global_connect

set_voltage_domain -name CORE -power VDD -ground VSS

puts "===== Define Sky130 HD power grid ====="
# Adapted from OpenROAD-flow-scripts/flow/platforms/sky130hd/pdn.tcl.
define_pdn_grid -name stdcell_grid -voltage_domains {CORE} -pins {met5}
add_pdn_stripe -grid stdcell_grid -layer met1 -width 0.48 -pitch 5.44 -offset 0 -followpins
add_pdn_stripe -grid stdcell_grid -layer met4 -width 1.60 -pitch 27.14 -offset 13.57
add_pdn_stripe -grid stdcell_grid -layer met5 -width 1.60 -pitch 27.20 -offset 13.60
add_pdn_connect -grid stdcell_grid -layers {met1 met4}
add_pdn_connect -grid stdcell_grid -layers {met4 met5}

puts "===== Connect rotated SRAM met2 supply pins to met4 grid ====="
define_pdn_grid -name sram_grid -voltage_domains {CORE} -macro \
    -instances {sram} -orient {R90} \
    -halo {2.0 2.0 2.0 2.0} -grid_over_boundary
add_pdn_connect -grid sram_grid -layers {met2 met4}

puts "===== Generate power grid ====="
pdngen -failed_via_report "$OUT/dot_product_pdn_failed_vias.rpt"

puts "===== Verify supply network connectivity ====="
# If the SRAM met2-to-met4 connections are not formed, stop before CTS/route.
check_power_grid -net VDD
check_power_grid -net VSS

puts "===== Place standard cells around fixed SRAM and tapcells ====="
global_placement -density 0.40
detailed_placement
check_placement -verbose

puts "===== Save PDN + placement checkpoint ====="
write_db "$OUT/dot_product_pdn_placed.odb"
write_def "$OUT/dot_product_pdn_placed.def"
puts "Saved: $OUT/dot_product_pdn_placed.odb"
