# Robotic Manipulator Modeling, Motion Planning, and Control

An integrated undergraduate robotics project covering manipulator kinematics, differential motion, trajectory and path planning, multibody simulation, actuation, and closed-loop control.

## Overview

This repository consolidates a sequence of robotics assignments completed at Sharif University of Technology into a single engineering project.

Rather than presenting the original coursework as separate homework submissions, the repository reorganizes the work into technical modules that follow the development of robotic-manipulator analysis and control:

**mathematical foundations → manipulator kinematics → differential kinematics → motion planning → path planning → actuation and closed-loop control**

The project includes work on SCARA and 3-DOF PUMA manipulators using MATLAB, Simulink, Simscape Multibody, and SolidWorks.

## Project Architecture

### 1. Foundations
Homogeneous transformations and coordinate-frame operations used throughout the later kinematic models.

### 2. Manipulator Kinematics
Forward kinematics of a SCARA robot and geometric inverse kinematics of a 3-DOF RRR PUMA manipulator.

### 3. Differential Kinematics
Symbolic translational and rotational Jacobian construction and joint-velocity mapping.

### 4. Motion Planning
Joint-space polynomial trajectories and Cartesian straight-line motion using an LSPB/trapezoidal velocity profile.

### 5. Path Planning
Artificial potential-field path planning with line-segment obstacles and analysis of a local-minimum failure case.

### 6. Actuation and Control
SCARA multibody modeling with link masses, DC-motor/gear actuation, PID joint control, and closed-loop execution of a planned trajectory.

## Selected Results

- Forward- and inverse-kinematics solutions were evaluated across multiple simulated robot configurations.
- A straight-line SCARA trajectory was generated with a maximum end-effector velocity of **18 cm/s** and an acceleration constraint of **g/3**, resulting in a **4.96 s** motion.
- PID-controlled joints exhibited **4.57–4.92% overshoot** and settled before approximately **2 s** in the reported simulations.
- Planned-trajectory execution produced a reported **final Cartesian position RMSE of 0.0082 cm**, compared with **0.4539 cm** for a direct endpoint-step command.

## Tools

- MATLAB
- Simulink
- Simscape / Simscape Multibody
- SolidWorks

## Repository Structure

```text
01-foundations/
02-manipulator-kinematics/
03-differential-kinematics/
04-motion-planning/
05-path-planning/
06-actuation-and-control/
assets/
docs/
```

The numbered directories contain the technical project modules. Reusable figures and visual results will be placed under `assets/`, while original coursework reports may be retained under `docs/course-reports/` as archival documentation.

## Course Information

**Course:** Robotics  
**Department:** Mechanical Engineering  
**University:** Sharif University of Technology  
**Instructor:** Dr. Saeed Behzadipour

## Notes

All results in this repository are based on analytical calculations and simulation. No physical robot was fabricated or experimentally tested as part of this coursework.

The repository is an engineering-oriented reorganization of the original coursework. Course-provided problem statements and copyrighted instructional material are not redistributed.
