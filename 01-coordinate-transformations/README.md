# Coordinate Transformations

This module contains the first stage of the robotics coursework and focuses on homogeneous coordinate transformations in MATLAB.

## Objectives

- Implement homogeneous rotation matrices about the X, Y, and Z axes.
- Use homogeneous translation matrices along the X, Y, and Z axes.
- Compose successive rigid-body transformations.
- Express the position of a target point with respect to a reference coordinate frame.

## Implementation

Two MATLAB helper functions are used:

- `rot_function.m` generates a 4×4 homogeneous rotation matrix for a specified axis and angle.
- `trans_function.m` generates a 4×4 homogeneous translation matrix for a specified axis and displacement.

The accompanying MATLAB Live Script (`HW1.mlx`) applies a sequence of translations and a rotation to determine the position of the target frame with respect to the global frame.

The transformation sequence used in the assignment is:

1. Translation of 40 cm along the Y axis.
2. Translation of 20 cm along the Z axis.
3. Translation of 5 cm along the X axis.
4. Rotation of -90° about the Y axis.

The resulting homogeneous transformation is

```text
H01 =
     0     0    -1     5
     0     1     0    40
     1     0     0    20
     0     0     0     1
```

and the target-frame origin expressed in the global frame is

```text
P0 = [5, 40, 20, 1]^T
```

with position coordinates expressed in centimeters.

## Files

The original homework structure is preserved in this repository:

```text
codes/
├── HW1.mlx
├── rot_function.m
└── trans_function.m

model/
└── (empty in this assignment)

report/
└── HW1_report_Molazadeh_Aryan_401107527.pdf
```

## Tools

- MATLAB

## Notes

Angles supplied to `rot_function.m` are expressed in radians.

The `model/` directory is intentionally empty for this assignment because no Simulink, Simscape, or CAD model was required at this stage.

This module serves as the mathematical foundation for the manipulator kinematics developed in the subsequent assignments, where the same transformation concepts are extended to robot models, Denavit–Hartenberg formulations, and simulation environments.
