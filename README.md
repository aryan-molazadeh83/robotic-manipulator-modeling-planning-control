# Robotic Manipulator Modeling, Motion Planning, and Control

Integrated robotics coursework covering manipulator kinematics, differential motion, trajectory and path planning, multibody simulation, actuation, and closed-loop control.

## Overview

This repository consolidates seven sequential assignments completed for the undergraduate Robotics course at Sharif University of Technology.

The work covers the modeling and simulation of SCARA and 3-DOF PUMA manipulators, including coordinate transformations, forward and inverse kinematics, Jacobian-based differential kinematics, trajectory generation, path planning, actuator modeling, and PID joint control.

The repository is presented as an **integrated coursework project**, not as an independent research project. Several assignments build directly on models and methods developed in earlier stages, particularly the SCARA modeling, trajectory-planning, and control tasks.

## Project Development Stages

1. **Coordinate Transformations**  
   Homogeneous rotation and translation transformations implemented in MATLAB.

2. **SCARA Modeling and Forward Kinematics**  
   CAD modeling, Simulink/Simscape simulation, Denavit–Hartenberg formulation, and forward-kinematics validation.

3. **PUMA Inverse Kinematics**  
   Modeling of a 3-DOF RRR manipulator and implementation of a geometric inverse-kinematics solution.

4. **Jacobian and Differential Kinematics**  
   Symbolic construction of translational and rotational Jacobians and joint-velocity analysis.

5. **SCARA Trajectory Planning**  
   Joint-space polynomial trajectories and Cartesian straight-line motion using an LSPB/trapezoidal velocity profile.

6. **Potential-Field Path Planning**  
   Artificial potential-field path planning for a point robot with line-segment obstacles, including analysis of a local-minimum failure case.

7. **Actuation and Closed-Loop Control**  
   SCARA multibody simulation with link masses, DC-motor/gear actuation, PID joint control, and execution of a planned trajectory.

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

The repository will be organized into seven modules corresponding to the main development stages:

```text
01-coordinate-transformations/
02-scara-forward-kinematics/
03-puma-inverse-kinematics/
04-jacobian-differential-kinematics/
05-scara-trajectory-planning/
06-potential-field-path-planning/
07-scara-actuation-control/
