# FPGA-Based Reconfigurable Multi-Modulation Signal Generator

## Overview

A reconfigurable FPGA-based multi-modulation signal generator implemented using Direct Digital Synthesis (DDS). The system supportsMulti-Modulation waveform generation through a shared hardware architecture and dynamic waveform selection.

### Supported Modulation Schemes

- Amplitude Modulation (AM)
- Frequency Modulation (FM)
- Phase Modulation (PM)
- Linear Frequency Modulation (LFM/Chirp)

## Features

- DDS-based waveform generation
- Reconfigurable FPGA architecture
- Dynamic modulation selection
- Shared hardware resource utilization
- Real-time signal synthesis
- Hardware validation using DAC and CRO

## Tools & Technologies

- FPGA
- Verilog HDL
- VHDL
- Xilinx Vivado
- MATLAB
- FPGA Development Board
- Direct Digital Synthesis (DDS)

## Architecture

![Block Diagram](images/Design_Architecture.png)
![Block Diagram](images/Block_Diagram.jpeg)

## Results

### HDL Simulation Results

#### Amplitude Modulation (AM)
![AM Simulation](results/AM_Simulation.png)

#### Frequency Modulation (FM)
![FM Simulation](results/FM_Simulation.png)

#### Phase Modulation (PM)
![PM Simulation](results/PM_Simulation.png)

#### Linear Frequency Modulation (LFM)
![LFM Simulation](results/LFM_Simulation.png)

---

### Hardware Validation (CRO Results)

#### AM Output
![AM CRO](results/AM.jpeg)

#### FM Output
![FM CRO](results/FM.jpeg)

#### PM Output
![PM CRO](results/PM.jpeg)

#### LFM Output
![LFM CRO](results/LFM.jpeg)

## Future Enhancements

- Multi-Tone Signal
- BPSK implementation
- QPSK implementation
- QAM implementation
- OFDM waveform generation
- SDR integration

## Author

Supreeth K

M.Tech Embedded Systems | FPGA | Verilog HDL | Digital Design
