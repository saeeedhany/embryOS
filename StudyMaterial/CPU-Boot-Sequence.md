# 🖥️ The CPU Boot Sequence: From Power On to Program Execution

Have you ever wondered what happens the moment you press the POWER button on your computer? It might seem like magic, but behind the scenes, your CPU orchestrates a complex series of steps to bring your system to life. Let's demystify this "magic trick" of the CPU.

## The Journey Begins: Power On!

1.  **The CPU Wakes Up, Lost and Found:** When your computer powers on, the CPU is activated, but it doesn't immediately know what to do or where to go. To find its way, it has a predefined starting point: a special "friend" known as the **Reset Vector**.

2.  **Meeting the Reset Vector:** The Reset Vector is a constant, stable memory address, typically `0xFFFF0` for x86 processors. This address is hardwired into the CPU. This isn't where the entire operating system code resides; rather, it holds a critical instruction: a jump to the actual BIOS (Basic Input/Output System) code.

3.  **Executing BIOS:** The CPU executes the instruction at `0xFFFF0`, which redirects it to the main BIOS code. The BIOS then takes over, performing a crucial check-up called the **Power-On Self-Test (POST)**. During POST, the BIOS checks essential hardware components like the keyboard, RAM, display, and other peripherals to ensure they are functioning correctly.

4.  **Finding the Bootable Device:** Once POST is complete, the BIOS begins searching for a bootable device. This could be a hard drive, a USB flash drive, a CD/DVD, or a network boot server – any device that contains a boot sector.

5.  **Loading the Master Boot Record (MBR):** Upon finding a bootable device, the BIOS reads the very first sector of that device. This sector is known as the **Master Boot Record (MBR)**. The BIOS loads this 512-byte MBR into a specific memory address: `0x7C00`.

6.  **Handing Control to the MBR:** Finally, the CPU "jumps" to the `0x7C00` address in memory and begins executing the code found within the MBR. This MBR code is the very first piece of software that runs, and its primary job is to initiate the loading of the operating system.

---

## Important Questions & Concepts

### What is the Reset Vector? Why not jump directly to BIOS?

The Reset Vector is a fixed, predefined physical memory address (e.g., `0xFFFF0` for x86 CPUs) that the CPU is hardwired to start executing from upon power-on or reset.

You might wonder why the CPU doesn't just jump directly to the main BIOS code. There are several reasons for this design:

* **Standardization and Consistency:** The Reset Vector provides a single, universally known entry point for all compatible CPUs. This simplifies motherboard design and ensures consistent behavior across different hardware manufacturers.
* **Minimal and Stable:** The Reset Vector doesn't need to contain the entire BIOS code. It typically holds a small "stub" of code, often just a jump instruction, that redirects the CPU to the larger BIOS firmware located elsewhere in memory (e.g., at `0xF0000` or higher). This small, stable entry point is less prone to corruption and provides a reliable starting point.
* **Flexibility:** It allows the full BIOS firmware to be located at different physical addresses depending on the specific motherboard or BIOS version, while the CPU's initial jump point remains constant.

### The Concept of "Address" in Computer Architecture

From the CPU boot sequence, it's clear that the concept of an "address" is fundamental. So, what exactly is an address in computer systems?

* **Numeric Identifier:** In essence, an address is a **numeric identifier** that points to a specific, unique location in the computer's memory. Think of it like a house number on a street; it tells the CPU exactly where to find data or where to store it. Every single byte in memory has its own unique address.

* **How CPUs Use Addresses:** When a CPU needs to access data from memory or write data to it, it uses special internal registers:
    * **Memory Address Register (MAR):** Holds the address of the memory location to be accessed.
    * **Memory Data Register (MDR):** Temporarily stores the data being fetched from or written to that memory location.
    This entire process is handled by the hardware and is crucial for efficient memory operations.

* **Types of Addresses:** Modern computer systems utilize different types of addresses:
    * **Physical Address:** This is the actual, real address directly in the hardware memory (RAM or ROM). It's the "real" location.
    * **Logical or Virtual Address:** This is the address that programs use. It's an abstraction provided by the operating system, which then maps these virtual addresses to physical memory addresses using a component called the **Memory Management Unit (MMU)**. This mapping enables features like multitasking, memory protection, and efficient memory usage.
    * **Segmented Address:** This type was historically used in older x86 CPUs operating in **Real Mode**. A segmented address is formed by combining a "segment" and an "offset" (e.g., `0xF000:0xFFF0`). The CPU calculates the physical address by using the formula: `(Segment × 16) + Offset`.

* **Addressing Limits:** The maximum amount of memory a CPU can address is determined by its **address bus width**:
    * A 16-bit address bus can access up to $2^{16}$ bytes, which is 64 KB.
    * A 32-bit address bus can access up to $2^{32}$ bytes, which is 4 GB.
    * A 64-bit CPU can theoretically access $2^{64}$ bytes (16 Exabytes) of memory, though practical implementations usually have lower limits.

* **Practical Use:** Instructions like `mov al, [0x1234]` (move data from address `0x1234` to register `al`) or `mov [0x1234], al` (move data from `al` to address `0x1234`) directly interact with memory using these addresses. Even hardware devices often have memory-mapped I/O, meaning their registers and data can be accessed through specific physical addresses.

In summary, an address is more than just a number; it's the core mechanism that allows the CPU to read instructions, access variables, jump to functions, and interact with all hardware components. The CPU interprets and resolves these addresses through its internal addressing mechanisms, which vary based on its operational mode (e.g., Real Mode, Protected Mode, Long Mode).

### What is the Master Boot Record (MBR)?

The **Master Boot Record (MBR)** is the very first sector on a bootable storage device, such as a hard disk drive, USB flash drive, or SSD. It is always 512 bytes in size.

When the BIOS identifies a bootable device, it reads this 512-byte MBR into memory (specifically at address `0x7C00`) and then transfers control of the system to the code contained within it. The MBR's primary function is to contain the bootloader code (which then loads the operating system) and the disk's partition table.

### What is a Hard Sector?

A **hard sector** is the smallest physical unit of storage on a traditional magnetic disk (like an HDD) or a flash memory device (like a USB drive). It's the fundamental block of data that the BIOS works with when reading from storage.

Historically, the standard size for a hard sector has been 512 bytes. However, modern disks often use a larger sector size, typically 4 KB, which is referred to as **Advanced Format**. Using larger sectors can improve storage efficiency and error correction.
