# Foundations: Homogeneous Coordinate Transformations

This module contains the mathematical foundation used in the later manipulator-kinematics sections of the project.

## Scope

The module implements homogeneous coordinate transformations in MATLAB and demonstrates how multiple rigid-body transformations can be composed to express a point or frame in a global reference frame.

The work includes:

- homogeneous rotations about the X, Y, and Z axes,
- homogeneous translations along the X, Y, and Z axes,
- composition of successive rigid-body transformations,
- transformation of a target-frame origin into global coordinates.

## MATLAB Implementation

Two reusable helper functions are included:

- `rot_function.m` — generates a 4×4 homogeneous rotation matrix for a specified axis and angle.
- `trans_function.m` — generates a 4×4 homogeneous translation matrix for a specified axis and displacement.

The accompanying MATLAB Live Script demonstrates the transformation sequence and verifies the resulting frame position.

For the example configuration used in the original coursework, the composed transformation is

```text
H01 =
     0     0    -1     5
     0     1     0    40
     1     0     0    20
     0     0     0     1
```

which places the target-frame origin at

```text
P0 = [5, 40, 20, 1]^T
```

with position coordinates expressed in centimeters.

## Source Files

```text
code/
├── HW1.mlx
├── rot_function.m
└── trans_function.m
```

## Tools

- MATLAB

## Role in the Project

These transformation utilities provide the coordinate-frame operations used conceptually in the subsequent SCARA and PUMA kinematics modules.

Angles supplied to `rot_function.m` are expressed in radians.
