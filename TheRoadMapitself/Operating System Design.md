# 📘 Introduction: What Is This Roadmap For?

Welcome,

The document you're reading is not just a guide — it's a **complete roadmap** for building a real, functioning operating system from scratch.

Unlike theoretical courses or textbooks, this roadmap is designed for **practical builders**. It walks you through every layer of system creation:  
from the first byte the CPU reads after power-on, all the way to executing your own shell commands inside a system **you built entirely with your own hands**.

---

## 🎯 Why does this roadmap exist?

To help you:
1. **Build your own OS** step-by-step, bottom to top.
2. **Understand exactly what to learn**, in which order — no fluff.
3. **Think like the CPU itself** — real mode, protected mode, memory, execution.
4. **See progress with milestones**, and never get stuck not knowing what’s next.

---

## 🧱 What do the labels mean?

Every phase in this file has 3 parts:

| Label        | Meaning                                                        |
|--------------|----------------------------------------------------------------|
| **🎯 Goal**  | What you should accomplish by the end of the phase             |
| **🔑 Learn** | What concepts/tools you should understand before building      |
| **🔨 Build** | What you must build with your hands — real working code        |

These aren’t just topics. Each phase builds a piece of a real OS.

---

# 🧠 Core Questions About Operating System Design

## ❓ When can I say I built a system (Operating System)?

You can consider what you've built a real **Operating System** when it includes the following essential components:

| Component               | Description                                                 |
|------------------------|-------------------------------------------------------------|
| **Bootloader**         | Loads the kernel from disk into memory                      |
| **Kernel**             | Manages the CPU, memory, and hardware                       |
| **Interrupt Handling** | Controls how hardware communicates with the CPU             |
| **Memory Management**  | Allocates and frees RAM properly                            |
| **System Calls (Syscalls)** | Interface for programs to talk to the kernel           |
| **Program Execution**  | Ability to load and run external user programs              |
| **Filesystem** (optional at first) | Read and write files                          |
| **Shell**              | User interface (CLI/GUI) to interact with the OS            |

If you can:
- Boot from your code
- Load a kernel
- Execute programs
- Handle basic hardware interaction (keyboard, screen)
- Provide a way for users to interact (shell)

Then yes — you built a basic OS.

---

## ❓ Is the Shell considered an Operating System?

**Short Answer:** No.

**Real Answer:**
- A shell is **not** an OS. It’s a user interface that communicates with the kernel.
- The shell sends commands via **system calls**.
- The kernel does the real work: process creation, memory allocation, hardware access, etc.

### Why the confusion?

Because:
- Shells are the part users directly interact with.
- In embedded/experimental systems, a shell may run directly on hardware with no visible kernel, which gives the illusion it's the OS.

| Scenario                            | Is it a full OS? |
|-------------------------------------|------------------|
| Shell on top of Linux kernel        | ✅ Yes           |
| Shell running directly on hardware  | ⚠️ Maybe         |
| Shell without kernel or process mgmt | ❌ No            |

---

## ❓ Who runs first — kernel or bootloader?

Always the **bootloader**.

- The CPU starts from a specific memory address after power-on.
- This code is usually in ROM or BIOS.
- The bootloader loads the kernel into memory and transfers execution.

> Bootloader = mother. Kernel = baby. No bootloader → no kernel birth.

---

## ❓ Can I build a shell before the full OS?

Yes, but it will only be a **UI mockup** unless:
- You have real process management
- You support syscalls
- You manage memory and execution

Still, it’s a **great way to learn** before full OS development.

---

## ❓ Do I need a filesystem to build an OS?

Not at first. But for running external programs or storing files, yes.

---

## ❓ Can I build an OS without Assembly?

Not really. Assembly is required for:
- Bootloader
- Switching to protected mode
- Low-level hardware setup

---

## ❓ Is Linux just a kernel?

Yes. Linux = kernel. Ubuntu = Linux kernel + GNU tools + shell.

---

## ❓ Kernel mode vs User mode?

| Mode        | Access                          |
|-------------|----------------------------------|
| Kernel Mode | Full access to hardware/memory   |
| User Mode   | Limited, uses syscalls to ask OS |

---

# 🛠️ Roadmap to Build an Operating System From Scratch

## 🧱 Phase 1: Bootloader

### 🎯 Goal:
Load the kernel from disk and pass control to it.

### 🔑 Learn:
- CPU boot sequence
- Real Mode
- Assembly (nasm)
- BIOS interrupts (int 0x10, int 0x13)
- FAT12 basics (optional)

### 🔨 Build:
- 512-byte boot sector (MBR)
- Print message: `Booting...`
- Load kernel to RAM
- Jump to kernel entry point

---

## 🧱 Phase 2: Minimal Kernel

### 🎯 Goal:
Boot into a protected mode C kernel.

### 🔑 Learn:
- Switching from Real to Protected Mode
- Set up the stack
- C + Assembly linking
- Linker scripts

### 🔨 Build:
- Kernel runs at 0x100000
- VGA output using 0xB8000
- Print `Hello from Kernel`

---

## 🧱 Phase 3: Hardware and Interrupts

### 🎯 Goal:
React to hardware (keyboard, timer).

### 🔑 Learn:
- IDT (Interrupt Descriptor Table)
- PIC and IRQs
- Writing ISRs

### 🔨 Build:
- Timer handler (`IRQ0`)
- Keyboard handler (`IRQ1`)
- Basic tick counter

---

## 🧱 Phase 4: Process Management

### 🎯 Goal:
Run and switch between tasks.

### 🔑 Learn:
- Context switching
- Task management structure
- Round-Robin scheduling
- Writing syscall handler (`int 0x80`)

### 🔨 Build:
- Two test tasks
- Scheduler
- One syscall (`write`)

---

## 🧱 Phase 5: Filesystem and User Programs

### 🎯 Goal:
Load programs from disk.

### 🔑 Learn:
- FAT12 or a simple custom FS
- Program loader

### 🔨 Build:
- Minimal file reader (`ls`, `cat`)
- Load `.bin` file into memory
- Execute user program

---

## 🧱 Phase 6: Operating System Shell

### 🎯 Goal:
Provide interactive command-line interface.

### 🔑 Learn:
- Command parser
- Connect shell to syscall layer
- I/O handling

### 🔨 Build:
- Basic shell
- Built-in commands (`run`, `ls`, etc)
- Keyboard input buffer

---

## 🏁 Final Result

After all 6 phases, you will have:
- A bootloader
- A real kernel
- Drivers
- Process management
- Executable programs
- A shell interface

You will have built a full OS by hand from scratch 💻💪
