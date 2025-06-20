# Operating System Development Roadmap

## Introduction

This document outlines a comprehensive roadmap for building a functional operating system from the ground up.

This roadmap serves as a practical guide for developers. It details the progression through each layer of OS creation, from initial CPU activation to the execution of custom shell commands.

---

## Purpose of this Roadmap

This roadmap is designed to facilitate:
1.  Systematic OS construction, from fundamental components to higher-level functionalities.
2.  Identification of essential learning objectives and their optimal sequence.
3.  A deep understanding of CPU operational modes, memory management, and execution flows.
4.  Trackable progress through defined milestones, ensuring continuous development.

---

## Roadmap Structure

Each phase within this document is organized into three distinct sections:

| Label        | Description                                                  |
|--------------|--------------------------------------------------------------|
| **Goal** | The specific outcome to be achieved by the completion of the phase. |
| **Learn** | Fundamental concepts and tools required for the phase.       |
| **Build** | Practical components or code implementations to be developed. |

Each phase contributes directly to the construction of a real operating system component.

---

# Core Operating System Design Principles

## Defining an Operating System

A system qualifies as a genuine Operating System when it incorporates the following core components:

| Component               | Description                                                 |
|-------------------------|-------------------------------------------------------------|
| **Bootloader** | Responsible for loading the kernel from disk into memory.   |
| **Kernel** | Manages CPU resources, memory, and hardware interactions.   |
| **Interrupt Handling** | Controls the communication mechanism between hardware and the CPU. |
| **Memory Management** | Handles the proper allocation and deallocation of Random Access Memory (RAM). |
| **System Calls (Syscalls)** | Provides an interface for user programs to interact with the kernel. |
| **Program Execution** | Enables the loading and execution of external user applications. |
| **Filesystem** (optional initially) | Facilitates reading from and writing to files.        |
| **Shell** | Offers a user interface (Command Line Interface/Graphical User Interface) for system interaction. |

A basic operating system has been built if it can:
-   Boot from custom code.
-   Load a kernel.
-   Execute programs.
-   Manage fundamental hardware interactions (e.g., keyboard, display).
-   Provide a user interaction interface (Shell).

---

## Shell vs. Operating System

**Conclusion:** A Shell is not an Operating System.

**Explanation:**
-   A Shell is a user interface that communicates with the kernel.
-   Commands issued through the Shell are translated into **system calls**.
-   The kernel performs the actual operations, including process creation, memory allocation, and hardware access.

### Clarification on Common Misconceptions

Confusion often arises because:
-   The Shell is the primary component users directly interact with.
-   In certain embedded or experimental systems, a Shell might operate directly on hardware without an explicit kernel, leading to the impression that it functions as the entire OS.

| Scenario                            | Full OS Designation |
|-------------------------------------|---------------------|
| Shell operating on a Linux kernel   | Yes                 |
| Shell operating directly on hardware | Potentially         |
| Shell without kernel or process management | No                  |

---

## Execution Order: Kernel vs. Bootloader

The **Bootloader** always executes first.

-   Upon power-on, the CPU initiates execution from a predetermined memory address.
-   This initial code is typically located in Read-Only Memory (ROM) or within the Basic Input/Output System (BIOS).
-   The Bootloader's function is to load the kernel into memory and then transfer execution control to it.

> The Bootloader precedes and enables the kernel's execution.

---

## Shell Development Pre-Full OS

A Shell can be developed prior to a complete Operating System. However, it will function as a user interface prototype unless it is integrated with:
-   Robust process management.
-   System call support.
-   Memory and execution management.

Developing a Shell independently serves as a valuable learning phase before full OS development.

---

## Filesystem Requirement

A filesystem is not a mandatory component in the initial stages of OS development. However, it becomes necessary for loading external programs or persistent file storage.

---

## Assembly Language Necessity

Assembly language is generally required for OS development due to its role in:
-   Bootloader implementation.
-   Transitioning to Protected Mode.
-   Low-level hardware configuration.

---

## Linux: Kernel or OS?

Linux refers specifically to the **kernel**. A complete operating system distribution, such as Ubuntu, comprises the Linux kernel combined with GNU tools and a shell environment.

---

## Kernel Mode vs. User Mode

| Mode        | Access Permissions                         |
|-------------|--------------------------------------------|
| Kernel Mode | Full access to hardware and memory resources. |
| User Mode   | Restricted access, relying on system calls for OS services. |

---

# 🛠️ Operating System Construction Roadmap

## 🧱 Phase 1: Bootloader

### Goal:
Load the kernel from disk and transfer execution control.

### Learn:
-   CPU boot sequence: [StudyMaterial/CPU-Boot-Sequence.md](StudyMaterial/CPU-Boot-Sequence.md)
-   Real Mode: [StudyMaterial/Real-Mode.md](StudyMaterial/Real-Mode.md)
-   Assembly (nasm): [StudyMaterial/Assembly-Nasm.md](StudyMaterial/Assembly-Nasm.md)
-   BIOS interrupts (int 0x10, int 0x13): [StudyMaterial/BIOS-Interrupts.md](StudyMaterial/BIOS-Interrupts.md)
-   FAT12 basics (optional): [StudyMaterial/FAT12-Basics.md](StudyMaterial/FAT12-Basics.md)

### Build:
-   512-byte boot sector (Master Boot Record - MBR)
-   Output of a boot message (e.g., `Booting...`)
-   Kernel loading into RAM
-   Jump to the kernel's entry point

---

## 🧱 Phase 2: Minimal Kernel

### Goal:
Initiate a C-based kernel in Protected Mode.

### Learn:
-   Transition from Real Mode to Protected Mode: [StudyMaterial/Switching-Real-to-Protected-Mode.md](StudyMaterial/Switching-Real-to-Protected-Mode.md)
-   Stack setup: [StudyMaterial/Stack-Setup.md](StudyMaterial/Stack-Setup.md)
-   C and Assembly language linking: [StudyMaterial/C-Assembly-Linking.md](StudyMaterial/C-Assembly-Linking.md)
-   Linker scripts: [StudyMaterial/Linker-Scripts.md](StudyMaterial/Linker-Scripts.md)

### Build:
-   Kernel execution at memory address `0x100000`
-   VGA output utilizing memory address `0xB8000`
-   Output of a kernel-specific message (e.g., `Hello from Kernel`)

---

## 🧱 Phase 3: Hardware and Interrupts

### Goal:
Implement interaction with hardware components (e.g., keyboard, timer).

### Learn:
-   Interrupt Descriptor Table (IDT): [StudyMaterial/IDT.md](StudyMaterial/IDT.md)
-   Programmable Interrupt Controller (PIC) and Interrupt ReQuests (IRQs): [StudyMaterial/PIC-and-IRQs.md](StudyMaterial/PIC-and-IRQs.md)
-   Writing Interrupt Service Routines (ISRs): [StudyMaterial/ISRs.md](StudyMaterial/ISRs.md)

### Build:
-   Timer handler (`IRQ0`)
-   Keyboard handler (`IRQ1`)
-   Basic system tick counter

---

## 🧱 Phase 4: Process Management

### Goal:
Implement the execution and switching between tasks.

### Learn:
-   Context switching: [StudyMaterial/Context-Switching.md](StudyMaterial/Context-Switching.md)
-   Task management structure: [StudyMaterial/Task-Management-Structure.md](StudyMaterial/Task-Management-Structure.md)
-   Round-Robin scheduling algorithm: [StudyMaterial/Round-Robin-Scheduling.md](StudyMaterial/Round-Robin-Scheduling.md)
-   Writing a system call handler (`int 0x80`): [StudyMaterial/Syscall-Handler.md](StudyMaterial/Syscall-Handler.md)

### Build:
-   Two test tasks
-   Scheduler implementation
-   A single system call (e.g., `write`)

---

## 🧱 Phase 5: Filesystem and User Programs

### Goal:
Enable the loading of programs from disk.

### Learn:
-   FAT12 or a simple custom filesystem implementation: [StudyMaterial/FAT12-or-Custom-FS.md](StudyMaterial/FAT12-or-Custom-FS.md)
-   Program loader mechanism: [StudyMaterial/Program-Loader.md](StudyMaterial/Program-Loader.md)

### Build:
-   A minimal file reader (e.g., `ls`, `cat` functionalities)
-   Loading `.bin` files into memory
-   Execution of user programs

---

## 🧱 Phase 6: Operating System Shell

### Goal:
Provide an interactive command-line interface.

### Learn:
-   Command parser design: [StudyMaterial/Command-Parser.md](StudyMaterial/Command-Parser.md)
-   Integration of the shell with the system call layer: [StudyMaterial/Shell-to-Syscall-Layer.md](StudyMaterial/Shell-to-Syscall-Layer.md)
-   Input/Output (I/O) handling: [StudyMaterial/IO-Handling.md](StudyMaterial/IO-Handling.md)

### Build:
-   A foundational shell
-   Implementation of built-in commands (e.g., `run`, `ls`)
-   Keyboard input buffering

---

## Final Outcome

Upon completion of all six phases, the resulting system will include:
-   A bootloader
-   A functional kernel
-   Hardware drivers
-   Process management capabilities
-   Executable user programs
-   A command-line shell interface

This process culminates in the manual construction of a complete operating system from its foundational elements.
