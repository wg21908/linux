# 🐧 Linux Boot Process Overview

This document explains the step-by-step process of how a Linux system boots — from powering on the machine to reaching the login prompt or graphical desktop.

---

## 1. BIOS / UEFI Initialization

**Purpose:** Perform hardware initialization and hand off control to the bootloader.

- **BIOS (Basic Input/Output System)** or **UEFI (Unified Extensible Firmware Interface)** initializes CPU, memory, and connected devices.
- Executes **POST (Power-On Self-Test)** to verify hardware integrity.
- Searches for a bootable device based on the **boot order configuration**.
- Loads the **bootloader** from the **MBR (Master Boot Record)** or **EFI System Partition (ESP)** into memory.

---

## 2. Bootloader Stage (GRUB, LILO, etc.)

**Purpose:** Load the kernel into memory and hand control to it.

- Common bootloaders include **GRUB**, **systemd-boot**, and **LILO**.
- The bootloader:
  - Displays a **boot menu**.
  - Loads the **Linux kernel** (e.g., `/boot/vmlinuz-...`).
  - Loads the **initramfs** (initial RAM filesystem).
  - Passes **kernel parameters** (e.g., `root=/dev/sda1`) to the kernel.
- Control is handed over to the kernel.

---

## 3. Kernel Initialization

**Purpose:** Set up the system environment and mount the root filesystem.

- The kernel uncompresses into memory and initializes:
  - CPU and memory management
  - Device drivers
  - Process scheduler
  - Temporary root filesystem (initramfs)
- Mounts the **real root filesystem** (e.g., `/dev/sda2`) as specified in the kernel parameters.
- Launches the **init process** (PID 1).

---

## 4. Initramfs / Initrd

**Purpose:** Provide a temporary filesystem to bridge the kernel and user space.

- **Initramfs** contains essential drivers and tools to prepare the system before switching to the real root filesystem.
- Used for:
  - Loading kernel modules
  - Mounting complex or encrypted filesystems (e.g., LVM, RAID, LUKS)
- Executes `/init`, which sets up the environment and hands control to the main init system.

---

## 5. `init` or `systemd` Initialization

**Purpose:** Start and manage all user-space processes.

- Older systems use **SysVinit** (`/sbin/init`), modern systems use **systemd**.
- **systemd**:
  - Reads configuration from `/etc/systemd/system/`
  - Mounts filesystems listed in `/etc/fstab`
  - Brings up network interfaces
  - Starts background services (`sshd`, `cron`, etc.)
  - Transitions to the appropriate **target**:
    - `multi-user.target` for console mode
    - `graphical.target` for GUI mode

---

## 6. Login and User Space

**Purpose:** Provide user access and environment setup.

- Depending on the target:
  - **Console login:** via `getty` on `/dev/tty1`
  - **Graphical login:** via a display manager (e.g., GDM, LightDM)
- After login:
  - User shell starts (e.g., `bash`, `zsh`)
  - Startup scripts and desktop environments initialize
  - The system is now fully operational

---

## 🧾 Summary Diagram

```
+------------------+
| Power On         |
+--------+---------+
         |
         v
+------------------+
| BIOS / UEFI      |
| - POST           |
| - Load Bootloader|
+--------+---------+
         |
         v
+------------------+
| Bootloader (GRUB)|
| - Load kernel    |
| - Load initramfs |
+--------+---------+
         |
         v
+------------------+
| Kernel           |
| - Initialize HW  |
| - Mount rootfs   |
+--------+---------+
         |
         v
+------------------+
| Initramfs        |
| - Load modules   |
| - Mount real fs  |
+--------+---------+
         |
         v
+------------------+
| systemd/init     |
| - Start services |
| - Mount fs, net  |
+--------+---------+
         |
         v
+------------------+
| Login / GUI      |
+------------------+
```

