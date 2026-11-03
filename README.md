# UC Berkeley EECS 151 — ASIC Labs

This repo contains my independent lab work of **UC Berkeley EECS 151: Introduction to Digital Design and Integrated Circuits**, focusing on SystemVerilog, RTL design, digital logic, ASIC synthesis, static timing analysis (STA), and physical design.

## Learning Resources
- **Lecture Videos (Fa25):** [EECS 151 Lecture Recording](https://www.youtube.com/watch?v=ibmNx5xE72Y&t=3480s)
- **Lab Materials (Sp26):** [UC Berkeley EECS 151/251A](https://inst.eecs.berkeley.edu/~eecs151/sp26/)

**Disclaimer:** For UCB EECS-registered student, please don't copy my work or use this repo as reference. Since I am not officially enrolled in UC Berkeley EECS 151, I'm not able to connect to EECS server and use commercial tools. Instead, I use open-source tools to reproduce comparable design and verification workflow, following the lab instructions.

## Open-Source EDA Tool Substitutions

| Open-Source Tools (My Local Environment) | Commercial EDA Tools (UC Berkeley) | Purpose |
|---|---|---|
| **Verilator** | Synopsys VCS | RTL simulation and functional verification |
| **Surfer / GTKWave** | Synopsys Verdi | Waveform visualization and signal debugging |
| **Yosys + ABC** | Cadence Genus | RTL synthesis, logic optimization, and technology mapping |
| **OpenSTA** | Cadence timing analysis (Genus / Innovus) | Static timing analysis, setup and hold verification |
| **OpenROAD** | Cadence Innovus | Floorplanning, placement, timing optimization, clock-tree synthesis, and routing capabilities |

## Lab Overview

| Lab | Topic | Description |
|---|---|---|
| [Lab 1](./lab1) | SystemVerilog Fundamentals | Digital comparators, decoders, shift registers, counters, and RTL testbenches using Verilator. |
| [Lab 2](./lab2) | Timing Analysis and FIR Filter | Timing exercises, FIR filter implementation, adder-tree logic, and RTL simulation. |
| [Lab 3](./lab3) | Logic Synthesis and Static Timing Analysis | GCD and divider designs, synthesis using Yosys/ABC, SKY130 standard-cell mapping, and STA. |
| [Lab 4](./lab4) | ASIC Physical Design and GCD Coprocessor | FIFO-based GCD coprocessor, floorplanning, standard-cell placement, high-fanout repair, and setup-timing optimization using OpenROAD. |


### Technology Library Differences

My local synthesis and physical-design experiments currently use:

- **Technology:** SKY130 (130 nm CMOS)
- **Standard-cell library:** `sky130_fd_sc_hd`
- **Typical timing corner:** 25°C, 1.80 V
- **Synthesis:** Yosys + ABC
- **Physical design and STA:** OpenROAD / OpenSTA

The official Spring 2026 lab configuration uses:

- **Standard-cell library:** `sky130_scl` (9-track)
- **Setup timing corner:** Slow, 100°C, 1.60 V
- **Synthesis:** Cadence Genus
- **Physical design:** Cadence Innovus

Therefore, timing reports obtained using my local flow are not directly equivalent to the official Berkeley results.


**Focus Areas:** Digital IC Design · SystemVerilog · RTL Design · Logic Synthesis · Static Timing Analysis · ASIC Design Flow · Physical Design · VLSI
