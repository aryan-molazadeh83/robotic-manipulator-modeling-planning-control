# Manipulator Kinematics

This module develops the kinematic modeling of two serial manipulators: a 3-DOF SCARA robot and a 3-DOF RRR PUMA-type robot.

The module builds directly on the homogeneous-transformation utilities introduced in `01-foundations`.

## Structure

```text
scara/
├── README.md
├── codes/
├── model/
└── cad/

puma/
├── README.md
├── codes/
├── model/
└── cad/
```

## SCARA

The SCARA branch focuses on:

- mechanical geometry and coordinate-frame definition,
- multibody modeling in Simulink/Simscape,
- Denavit–Hartenberg parameterization,
- analytical forward kinematics,
- comparison of analytical and simulated end-effector positions.

The analytical and simulation-based forward-kinematics results were evaluated over six joint configurations in the original project development.

## PUMA

The PUMA branch focuses on:

- CAD and multibody modeling of a 3-DOF RRR manipulator,
- end-effector position generation from specified joint configurations,
- geometric inverse kinematics,
- recovery and validation of joint configurations from Cartesian positions.

The inverse-kinematics solution was evaluated using six simulated configurations.

## Tools

- MATLAB
- Simulink
- Simscape / Simscape Multibody
- SolidWorks

## Project Role

Together, the SCARA and PUMA branches establish the manipulator-kinematics layer used by the subsequent differential-kinematics, motion-planning, and control modules.
