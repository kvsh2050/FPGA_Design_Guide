# FPGA_Design_Guide
This is a Comprehensive Guide for building systems in FPGA. And also about FPGA Design.


## Checklist for FPGA Design
1. Clock and reset signals do not appear on the RHS of any always@* or assigns 
2. No clock Domain crossing occurs
3. All Combinatorial ifs have corresponding default or else 
4. All Case Options are covered and default case provided.
5. All LHS in an if/else/case appear are assigned for all conditions 
6. An LHS in an assign /always@* are an LHS only in that block
7. All seq blocks have (posedge clk) notation
8. No logic in seq block i.e, always@posedge block map directly to a flip flop from the standard cell library
9. Check combinatorial Loop, i.e, no LHS is affected by itself in RHS
10. Sysverilog logic type and always blocks. Do linter, Do synthesis.

## Questions for RTL Design
1. Basic Arithmetic Unit: Design a 4-bit arithmetic unit that performs addition, subtraction, multiplication, and division.
2. Floating-Point Unit: Implement a floating-point unit that supports IEEE 754 operations.
3. Asynchronous FIFO: Develop an asynchronous FIFO for cross-domain data transfer.
4. Cache Memory: Create a cache memory system with an LRU replacement policy.
5. Single-Cycle MIPS Datapath: Implement the datapath for a single-cycle MIPS processor architecture.
6. Control Unit for MIPS: Design the control unit for the MIPS processor.
7. Five-Stage MIPS Processor: Combine the datapath and control unit to create a complete five-stage MIPS processor.
8. RISC-V Core Implementation: Design a basic RISC-V core with RV32I base integer instruction set support.
9. Network-on-Chip (NoC) Router: Implement a 2D mesh NoC router with an XY routing algorithm.
10. DDR Memory Controller: Design a DDR memory controller for high-speed memory access.
11.  Serial Peripheral Interface (SPI) Protocol: Implement the SPI communication protocol.
12. Universal Asynchronous Receiver-Transmitter (UART): Design and simulate a UART for serial communication.
13. AXI Bus Interface: Explore the AXI bus interface for on-chip communication.
14. Direct Memory Access (DMA) Controller: Develop a DMA controller for memory-to-memory data transfer.
15. Digital Signal Processor (DSP): Implement a DSP core for audio processing.
16. Error Correction Code (ECC) Memory: Design an ECC memory system for error detection and correction.
17. Ethernet Controller: Implement an Ethernet controller for network communication.
18. Phase-Locked Loop (PLL): Design a PLL for clock generation and synchronization.
19. Convolutional Neural Network (CNN): Create a simple CNN (LeNet 5) for image recognition tasks.
20. H.264 Video Encoder: Implement a basic H.264 encoder for video compression.
21. Graphics Processing Unit (GPU): Create a basic GPU for rendering simple graphics.
22. Simple Image Processing Filters: Implement image processing filters like a median filter or edge detection algorithms.
23. Hardware Random Number Generator: Design a true hardware random number generator.
24. Asynchronous Circuit Design: Explore asynchronous circuit design and implement a handshake protocol.

These projects cover a broad spectrum of hardware design, from fundamental digital circuits to complex systems, providing a comprehensive experience in the field of hardware design and computer architecture. 
Source: https://www.linkedin.com/posts/kailash-prasad_vlsi-rtldesign-verilog-activity-7202964671283273729-f63d 
