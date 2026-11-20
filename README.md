# Tang Nano 4K VGA Graphics Generator

A compact FPGA project that generates a 640x480 VGA signal using Verilog RTL on the Tang Nano 4K.

The design draws a white 40×40 square that moves across a dark blue background, generated entirely in FPGA logic. It is designed as a learning-focused Year in Industry CV project covering VGA timing, counters, RTL design and simulation.

## Status

- Every module is verified in simulation with Icarus Verilog and GTKWave.
- Not yet run on hardware. That needs a Gowin PLL to make the 25.2 MHz pixel clock from the board's 27 MHz crystal, and a pin constraints file.
- Reset (`rst`) is active-high.

## Project Goals

- Generate valid 640x480 VGA timing
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
images/       Waveform screenshots
sim/          Simulation output (created when you run a testbench; ignored by Git)
```

## Modules

| File | Purpose |
| --- | --- |
| `rtl/vga_timing.v` | 800 × 525 pixel and line counters, active-low hsync/vsync, active-video and end-of-frame tick |
| `rtl/square_anim.v` | Moves the square one pixel right each frame, from x = 100 to 500, then wraps |
| `rtl/pattern_gen.v` | White inside the square, dark blue elsewhere, black during blanking |
| `rtl/top.v` | Connects the three modules; `clk` is the 25 MHz pixel clock |

## Running the simulations

From the project folder, with Icarus Verilog and GTKWave installed:

```bash
iverilog -o sim/vga_timing_tb tb/tb_vga_timing.v rtl/vga_timing.v
vvp sim/vga_timing_tb
gtkwave sim/vga_timing.vcd
```

The other testbenches (`tb_pattern_gen`, `tb_square_anim`, `tb_top`) build the same way; `tb_top` needs all four RTL files. Waveforms are written to `sim/`, which Git ignores.

## Waveforms

| Module | Screenshot |
| --- | --- |
| VGA timing | [vga_timing_waveform.png](images/vga_timing_waveform.png) |
| Pattern generator | [gtkwave_pattern_gen.png](images/gtkwave_pattern_gen.png) |
| Square animation | [gtkwave_square_anim.png](images/gtkwave_square_anim.png) |
| Square drawn by the pattern generator | [gtkwave_square_pattern.png](images/gtkwave_square_pattern.png) |
| Top-level integration | [gtkwave_top_integration.png](images/gtkwave_top_integration.png) |

