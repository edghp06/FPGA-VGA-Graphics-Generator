# Tang Nano 4K VGA Graphics Generator

A compact FPGA project that generates a 640x480 VGA signal using Verilog RTL on the Tang Nano 4K.

The project displays test patterns and a moving square generated entirely in FPGA logic. It is designed as a learning-focused Year in Industry CV project covering VGA timing, counters, RTL design, simulation, and hardware verification.

## Project Goals

- Generate valid 640x480 VGA timing
- Display coloured test patterns
- Display an animated moving square
- Verify each module using Icarus Verilog and GTKWave
- Test the design on Tang Nano 4K hardware
- Keep the design small, readable, and interview-friendly

## Hardware

- Tang Nano 4K FPGA board
- Gowin EDA
- Icarus Verilog
- GTKWave
- VGA monitor
- Breadboard/jumper wires or VGA adapter

## Repository Structure

```text
rtl/          Verilog RTL modules
tb/           Testbenches
sim/          Simulation output files
constraints/  Gowin physical constraints
docs/         Project notes and design log
images/       Hardware photos and waveform screenshots