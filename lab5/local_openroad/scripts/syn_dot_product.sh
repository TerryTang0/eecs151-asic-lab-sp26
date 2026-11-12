#!/usr/bin/env bash
# EECS151/251A Lab 5: local Sky130HD synthesis, preserving SRAM22 as a macro.
# Run from any directory. Requires Yosys and the already installed OpenROAD test PDK.
set -euo pipefail

LAB5_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
cd "$LAB5_DIR"

SKY130_LIB="$HOME/Documents/eda-tools/OpenROAD/test/sky130hd/sky130_fd_sc_hd__tt_025C_1v80.lib"
SRAM_DIR="$LAB5_DIR/sram22_sky130_macros/sram22_64x32m4w8"
SRAM_LIB="$SRAM_DIR/sram22_64x32m4w8_tt_025C_1v80.lib"
SRAM_LEF="$SRAM_DIR/sram22_64x32m4w8.lef"
SRAM_STUB="local_openroad/scripts/sram22_64x32m4w8_blackbox.v"
OUTPUT="local_openroad/results/dot_product_mapped.v"
LOG="local_openroad/logs/syn_dot_product.log"

for file in "$SKY130_LIB" "$SRAM_LIB" "$SRAM_LEF" "$SRAM_STUB" src/dot_product.sv; do
    if [[ ! -f "$file" ]]; then
        echo "Missing required file: $file" >&2
        exit 1
    fi
done
command -v yosys >/dev/null || { echo 'yosys not found on PATH' >&2; exit 1; }
mkdir -p local_openroad/results local_openroad/logs

# Yosys implicitly defines SYNTHESIS when reading RTL. The concurrent SVAs
# in src/dot_product.sv must be surrounded by `ifndef SYNTHESIS ... `endif.
# 20 ns clock target for ABC: -D takes picoseconds (20,000 ps).
yosys -Q -T -l "$LOG" -p "
  read_verilog -sv $SRAM_STUB
  read_verilog -sv src/dot_product.sv
  hierarchy -check -top dot_product
  synth -top dot_product -noabc
  dfflibmap -liberty $SKY130_LIB
  abc -liberty $SKY130_LIB -D 20000

  read_liberty -lib $SKY130_LIB

  clean
  check -assert
  stat -liberty $SKY130_LIB
  write_verilog -noattr -noexpr $OUTPUT
"

echo
printf 'Mapped netlist: %s\n' "$OUTPUT"
printf 'Synthesis log: %s\n' "$LOG"
echo 'Check that this netlist contains one SRAM22 instance:'
grep -n 'sram22_64x32m4w8' "$OUTPUT" || true
echo 'Next: inspect cell counts and SRAM preservation before OpenROAD floorplanning.'
