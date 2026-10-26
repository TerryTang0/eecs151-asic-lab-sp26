
#!/bin/bash
set -e

WIDTH=$1

LIB=build/sky130/sky130_fd_sc_hd__tt_025C_1v80.lib
OUT=build/yosys/divider_${WIDTH}bit

mkdir -p "$OUT"

yosys -l "$OUT/synth.log" -p "
    read_verilog -sv src/divider.sv

    chparam -set WIDTH $WIDTH divider
    hierarchy -check -top divider

    synth -top divider -noabc

    dfflibmap -liberty $LIB
    abc -liberty $LIB

    clean
    stat -liberty $LIB

    write_verilog -noattr $OUT/divider_mapped.v
"
