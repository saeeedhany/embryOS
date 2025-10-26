# Log 01 — Initialization

The project "Embryos" officially begins here.  
Objective: start building the boot process and define the structure for upcoming phases.

*18-oct-2024*

We finaly start working on the actuall thing, we're now have start point for our bootloader.asm and this is the steps that i should work on : 

bootloader.asm
├── [1] Bootloader header (boot signature + origin)
├── [2] Setup stage (environment setup)
├── [3] Display / Debug messages (optional)
    - we actually finish till this step at this point, now i am working on the rest of the map. *18-oct-2024*
├── [4] Load kernel (using BIOS interrupts)
├── [5] Enable A20 line
├── [6] Setup GDT (for Protected Mode)
├── [7] Switch to Protected Mode
├── [8] Jump to Kernel
└── [9] Boot signature (0xAA55)


