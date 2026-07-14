# SystemVerilog-ShiftRegister
Parameterized SystemVerilog shift register with rotate left/right operation and testbench.

# Parameterized SystemVerilog Shift Register

## Description

This project implements a configurable shift register using SystemVerilog.

Features:
- Parameterized register size
- Rotate right / rotate left operation
- Parallel data loading
- Serial output
- Shift counter
- Reset support

## Module Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| ROTATE_TO_RIGHT | Shift direction control | 1 |
| PEEK_INDEX | Bit index for observation | 0 |
| N | Shift register width | 8 |

## Inputs

| Signal | Description |
|--------|-------------|
| clk | Clock |
| rst | Active high reset |
| load_sr | Load enable |
| load_value | Parallel input data |
| shift_sr | Shift enable |
| bits_to_shift | Number of shifts |

## Outputs

| Signal | Description |
|--------|-------------|
| serial_out | Serial data output |
| peek_value | Selected bit observation |
| all_bits_shifted | Shift completion flag |

## Operation

Example:
