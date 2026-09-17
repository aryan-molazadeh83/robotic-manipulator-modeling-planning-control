# Robotic Manipulator Modeling, Motion Planning, and Control

An integrated undergraduate robotics coursework project covering coordinate transformations, manipulator kinematics, differential kinematics, trajectory generation, potential-field path planning, multibody mechanical modeling, actuator modeling, and closed-loop control.

The work was completed for the **Robotics** course in the Department of Mechanical Engineering at **Sharif University of Technology** under the supervision of **Dr. Saeed Behzadipour**.

## Project Overview

This repository reorganizes seven sequential course assignments into a single engineering-oriented portfolio project.

The main development path is:

**coordinate frames → manipulator kinematics → differential kinematics → trajectory planning → actuation → PID control → closed-loop execution**

Two manipulator models are used:

- **SCARA manipulator** for forward kinematics, trajectory generation, multibody simulation, actuation, and control
- **3-DOF PUMA-type RRR manipulator** for geometric inverse kinematics and Jacobian-based differential kinematics

A separate **2-D artificial potential-field** example is included as an independent path-planning study.

## Selected Results

- Evaluated SCARA forward kinematics and PUMA inverse kinematics across multiple simulated configurations.
- Generated a straight-line SCARA Cartesian trajectory using an LSPB profile with:
  - maximum end-effector velocity: **18 cm/s**
  - acceleration limit: **g/3**
  - total motion time: **4.96 s**
- Tuned PID joint controllers with reported overshoot values of:
  - **4.92%**
  - **4.57%**
  - **4.90%**
- Reported settling before approximately **2 s** in the corresponding joint-control simulations.
- Closed-loop execution of the planned trajectory produced a final Cartesian position RMSE of **0.008165 cm**, compared with **0.453872 cm** for a direct endpoint-step reference.

## Repository Structure

```text
robotic-manipulator-modeling-planning-control/
├── README.md
├── setup_project.m
├── reports/
├── 01-foundations/
│   └── codes/
├── 02-manipulator-kinematics/
│   ├── scara/
│   │   ├── codes/
│   │   └── model/
│   └── puma/
│       ├── codes/
│       └── model/
├── 03-differential-kinematics/
│   └── codes/
├── 04-motion-planning/
│   └── scara/
│       ├── codes/
│       └── model/
├── 05-path-planning/
│   └── potential-field/
│       └── codes/
└── 06-actuation-and-control/
    └── model/
```

The `reports/` directory contains the original English coursework reports for archival reference. The technical source files have been reorganized separately into the module-based structure shown above.

## Modules

### 1. Foundations

Implements homogeneous transformations and coordinate-frame operations used by later modules.

Main files include:

- `coordinate_transform_demo.m`
- `rot_function.m`
- `trans_function.m`

### 2. Manipulator Kinematics

#### SCARA

Implements analytical forward kinematics and a Simscape Multibody model of the manipulator.

Key files:

- `scara_forward_kinematics.m`
- `scara_fk_cases.m`
- `scara_kinematics.slx`

#### PUMA

Implements geometric inverse kinematics for a 3-DOF RRR manipulator and a corresponding Simscape model.

Key files:

- `puma_inverse_kinematics.m`
- `puma_ik_demo.m`
- `puma_kinematics.slx`

### 3. Differential Kinematics

Constructs the manipulator Jacobian symbolically and evaluates differential motion relationships between Cartesian and joint velocities.

Key file:

- `puma_jacobian_analysis.m`

### 4. Motion Planning

Implements SCARA trajectory generation in both joint space and Cartesian space.

Included approaches:

- cubic joint-space trajectory generation with zero endpoint velocities
- Cartesian straight-line trajectory generation using an LSPB profile

Key files:

- `scara_joint_space_trajectory.m`
- `scara_joint_space_trajectory.slx`
- `scara_cartesian_lspb_trajectory.slx`

### 5. Path Planning

Implements a separate 2-D artificial potential-field planner with line-segment obstacles.

The examples demonstrate both successful motion generation and the local-minimum limitation of classical potential-field methods.

Key files:

- `Path_generator.m`
- `potential_field_part_a.m`
- `potential_field_part_b.m`

### 6. Actuation and Control

Extends the SCARA model with multibody mechanical properties, actuator models, and closed-loop control.

The simulations include:

- link-mass assignment
- DC motor and gear actuation
- PID joint control
- planned-trajectory tracking
- comparison with direct endpoint-step control

Key models:

- `scara_motor_gear_actuation.slx`
- `scara_pid_joint_control.slx`
- `scara_trajectory_tracking.slx`
- `scara_endpoint_step_control.slx`

## Getting Started

Clone the repository and open MATLAB from the repository root.

Run:

```matlab
setup_project
```

This adds the project code and model directories to the MATLAB path.

After that, individual scripts and Simulink/Simscape models can be opened directly.

Typical examples:

```matlab
scara_fk_cases
puma_ik_demo
puma_jacobian_analysis
scara_joint_space_trajectory
potential_field_part_a
potential_field_part_b
```

## Software

The project uses:

- MATLAB
- Symbolic Math Toolbox
- Simulink
- Simscape
- Simscape Multibody
- SolidWorks / STEP geometry files

## Implementation Notes and Limitations

This repository preserves the original coursework implementations with only limited refactoring for organization, portability, and readability.

Important limitations include:

- The project is based on analytical work and simulation only; no physical robot was fabricated or experimentally validated.
- The potential-field planner is an independent 2-D study and is not integrated into the SCARA or PUMA control chain.
- The SCARA forward-kinematics implementation preserves the original `alpha3 = 180` convention even though the shared rotation helper expects radians. In the original calculation order, this does not affect the reported end-effector position, but it does affect orientation.
- The PUMA inverse-kinematics implementation computes one geometric branch; some configurations require manual sign or branch interpretation.
- The differential-kinematics script uses direct matrix inversion, so results near singular configurations can be numerically sensitive.
- The potential-field planner can terminate because of a local minimum or because the iteration limit is reached.

## Course Information

**Course:** Robotics  
**Department:** Mechanical Engineering  
**University:** Sharif University of Technology  
**Instructor:** Dr. Saeed Behzadipour

## Reports

The original English reports for all seven assignments are retained in:

```text
reports/
```

They are kept in their original assignment-oriented format as archival documentation, while the repository itself presents the work as an integrated engineering project.

## Academic Context

This repository contains the author's own coursework implementations and reports. Course problem statements and other instructional material are not redistributed.
