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
![Block Diagram](images/Block_Diagram.png)

## Results

### HDL Simulation Results

#### Amplitude Modulation (AM)
![AM Simulation](results/am_simulation.png)

#### Frequency Modulation (FM)
![FM Simulation](results/fm_simulation.png)

#### Phase Modulation (PM)
![PM Simulation](results/pm_simulation.png)

#### Linear Frequency Modulation (LFM)
![LFM Simulation](results/lfm_simulation.png)

---

### Hardware Validation (CRO Results)

#### AM Output
![AM CRO](results/am_cro.png)

#### FM Output
![FM CRO](results/fm_cro.png)

#### PM Output
![PM CRO](results/pm_cro.png)

#### LFM Output
![LFM CRO](results/lfm_cro.png)

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
