# FPGA Based Elevator Model

# Overview

This project implements a model elevator system using an FPGA board, programmed in VHDL, and designed through logical circuit design principles. The system integrates sensor inputs, motor control via PWM, and a FIFO-based memory module to store and process user requests.

The design simulates real-world elevator operations while demonstrating digital system design techniques and hardware-level control using FPGA resources.

# Features

Sensor Integration: Detects elevator position and floor requests.

Motor Control with PWM: Smooth bidirectional control of the elevator motor.

FIFO-Based Memory: Stores user inputs (floor requests) and processes them in order.

Priority Handling: Ensures efficient scheduling and avoids input conflicts.

State Machine Control: Implements elevator logic (idle, moving etc.).

Scalable Design: Easily expandable for additional floors or features.
