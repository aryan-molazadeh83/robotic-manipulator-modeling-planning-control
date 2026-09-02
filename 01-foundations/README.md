# Foundations: Homogeneous Coordinate Transformations

This module provides the homogeneous-transformation utilities used as the mathematical foundation for the later manipulator-kinematics modules.

## Scope

The module demonstrates:

- homogeneous rotations about the X, Y, and Z axes,
- homogeneous translations along the X, Y, and Z axes,
- composition of successive rigid-body transformations,
- transformation of a target-frame origin into global coordinates.

## Source Files

```text
codes/
├── coordinate_transform_demo.m
├── rot_function.m
└── trans_function.m
```

- `rot_function.m` is the original MATLAB utility developed for homogeneous rotations.
- `trans_function.m` is the original MATLAB utility used for homogeneous translations.
- `coordinate_transform_demo.m` provides a clean, GitHub-readable demonstration of how the two utilities are combined.

## Example

The demonstration composes the following transformations:

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

which places the target-frame origin at

```text
P0 = [5, 40, 20, 1]^T
```

with position coordinates expressed in centimeters.

## Tools

- MATLAB

## Role in the Project

This module establishes the coordinate-transformation concepts used in the subsequent SCARA and PUMA manipulator models.

The original transformation utilities are preserved here, while the demonstration script is reorganized for readability and reproducibility within the integrated project.

Angles supplied to `rot_function.m` are expressed in radians.
