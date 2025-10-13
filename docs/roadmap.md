# Operating System Development Roadmap

## Introduction
This document outlines the roadmap for building **Embryos**, a minimal operating system developed entirely from scratch.  
The roadmap is divided into clear phases representing each core layer of the system.

---

## Core Components
An operating system consists of the following essential parts:

- **Bootloader** – loads the kernel into memory and transfers control.  
- **Kernel** – manages CPU, memory, and hardware.  
- **Interrupts** – handle hardware communication.  
- **Memory Management** – allocates and protects RAM usage.  
- **System Calls** – connect user programs with kernel services.  
- **Program Execution** – loads and runs user applications.  
- **Filesystem** – provides file storage and access (optional at first).  
- **Shell** – offers a user interface for interaction.

---

## Development Phases

### Phase 1 – Bootloader
- Load the kernel into memory.  
- Display basic boot output.  
- Jump to the kernel entry point.

### Phase 2 – Minimal Kernel
- Enter protected mode.  
- Initialize stack and segments.  
- Display output from the kernel.

### Phase 3 – Hardware and Interrupts
- Setup IDT and ISRs.  
- Implement keyboard and timer handling.

### Phase 4 – Process Management
- Add task scheduling.  
- Implement basic system calls.

### Phase 5 – Filesystem and User Programs
- Load programs from disk.  
- Execute simple binaries.

### Phase 6 – Shell
- Provide a command-line interface.  
- Implement essential built-in commands.

---

## Outcome
After completing these phases, **Embryos** will evolve into a functional, minimal operating system capable of booting, managing hardware, running programs, and providing user interaction.

