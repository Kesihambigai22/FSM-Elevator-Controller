# 🚀 FSM-Based Elevator Controller using FPGA (Verilog HDL)

---

## 📌 Project Overview

This project implements a **real-time Elevator Control System** using a **Finite State Machine (FSM)** designed in **Verilog HDL** and deployed on an **FPGA platform**.

The system efficiently handles:

* Floor requests
* Elevator movement (Up/Down)
* Door operations

Unlike traditional microcontroller-based systems, this design leverages **parallel processing of FPGA**, ensuring **fast, deterministic, and reliable performance**.

---

## 🎯 Problem Statement

Modern multi-storey buildings require **efficient, safe, and real-time elevator systems**. Traditional solutions may suffer from delays and limited parallel processing.

👉 This project solves that by using:

* FSM-based control
* Hardware-level execution on FPGA
* Deterministic state transitions

---

## 🧠 Core Concepts Used

* Finite State Machine (FSM)
* Sequential Digital Circuits
* Flip-Flops & Registers
* Clock Division
* Digital Logic Design
* Hardware Description Language (Verilog)

### 🔁 FSM States

* **IDLE** → Waiting for user input
* **MOVE** → Elevator moves (Up/Down)
* **DOOR** → Door opens at destination

---

## ⚙️ Hardware Components

### 🔧 Core Hardware

* FPGA Development Board (Altera DE2-115 / Cyclone IV)
* On-board 50 MHz Clock
* Push Buttons (Reset, Request)
* Slide Switches (Floor Selection)

### 💡 Output Devices

* LEDs for status indication:

  * LED0 → Up movement
  * LED1 → Down movement
  * LED2 → Door open

### 🔌 Supporting Components

* JTAG / USB Blaster (for programming)
* 5V Power Supply
* Computer System (for development & simulation)

---

## 💻 Software & Tools Used

* **Verilog HDL** → System design
* **Intel Quartus Prime** → Synthesis & FPGA programming
* **ModelSim** → Simulation & waveform analysis

---

## 🧩 System Architecture

The system is designed as an FSM where:

* Inputs → Floor request + reset
* Processing → FSM logic
* Outputs → Movement + door signals

👉 The controller continuously:

1. Reads input
2. Decides direction
3. Moves elevator
4. Opens door at destination
5. Returns to idle

---

## 🔄 Working Principle

1. User selects floor using switches
2. Presses request button
3. FSM checks:

   * If target > current → Move Up
   * If target < current → Move Down
4. Elevator moves step-by-step
5. When destination reached:

   * Door opens (timer controlled)
6. System returns to IDLE

---

## 🛠️ Implementation Details

### 📌 Modules Used

* `elevator_controller.v` → Core FSM logic
* `elevator_top.v` → FPGA interfacing
* `testbench.v` → Simulation

### ⏱️ Clock Optimization

* 50 MHz clock divided to ~1 Hz
* Allows human-visible operation

### ⏲️ Door Timing

* Timer implemented in FSM
* Keeps door open for fixed duration

---

## 🧪 Testing & Verification

### ✔ Simulation

* Done using ModelSim
* Tested multiple scenarios:

  * Up movement
  * Down movement
  * Reset behavior

### ✔ Hardware Testing

* Implemented on FPGA board
* Verified using LEDs
* Output matched expected FSM behavior

---

## 📊 Results

### Example 1: Floor 0 → 3

* Elevator moves UP
* Stops at each floor
* Door opens at destination

### Example 2: Floor 3 → 1

* Elevator moves DOWN
* Door opens correctly
* Returns to IDLE

👉 System showed:

* Accurate floor tracking
* Correct direction control
* Reliable door timing

---

## 💡 Skills Gained

### 🔧 Technical Skills

* FPGA Programming
* Verilog HDL Design
* FSM Design & Optimization
* Digital System Design
* Hardware Debugging
* Simulation (ModelSim)

### 🧠 Practical Skills

* Problem Solving
* System Design Thinking
* Debugging Hardware + Code
* Team Collaboration

---

## 🌍 Applications

* Elevator systems in buildings
* Industrial automation
* Smart buildings
* Robotics control systems
* Traffic management systems

---

## 🚀 Future Improvements

* Multi-floor expansion (8–16 floors)
* Multiple elevator coordination
* AI-based scheduling algorithms
* IoT-based remote monitoring
* Voice & display interface
* Power optimization techniques

---

## 📂 Project Structure

```
FSM-Elevator-Controller
 ┣ 📂 src
 ┃ ┣ elevator_controller.v
 ┃ ┣ elevator_top.v
 ┃ ┗ testbench.v
 ┣ 📂 docs
 ┃ ┗ report.pdf
 ┣ 📂 images
 ┃ ┣ block_diagram.png
 ┃ ┣ fsm_diagram.png
 ┃ ┗ hardware_setup.png
 ┣ README.md
 ┗ LICENSE
```

---

## 📸 System Diagrams

(Add images in GitHub)

```
![FSM Diagram](images/FPGA_Elevator_FMS_LOGIC_diagram.jpg)
![Block Diagram](images/FPGA_Elevator_Block_diagram.jpg)
![Hardware Setup](images/FPGA_BOARD.jpg)
```

---

## 📄 Project Report

Detailed documentation available in:
📁 (docs/FSM_Based_Elevator_Controller_VTOP_Report.pdf)
📁 (docs/FSM_ELEVATOR.pdf)

---

## 👩‍💻 Author

**Kesihambigai**
B.Tech Electronics and Communication Engineering
VIT Vellore

---

## ⭐ Final Note

This project demonstrates how **theoretical digital design concepts** can be transformed into a **real-time hardware system**, bridging the gap between **academics and practical engineering**.
