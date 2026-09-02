# PUMA Kinematics

This submodule contains the kinematic model of a 3-DOF RRR PUMA-type manipulator.

## Scope

The work includes:

- CAD representation of the manipulator geometry,
- multibody simulation in Simulink/Simscape,
- forward pose generation from joint configurations,
- geometric inverse kinematics,
- validation of recovered joint configurations.

## Robot Parameters

The model uses the following geometric parameters:

- base height: 65 cm,
- horizontal offset: 15 cm,
- first arm length: 45 cm,
- second arm length: 55 cm.

## Source Organization

```text
codes/
model/
cad/
```

The `model/` directory contains the multibody model, while `cad/` contains the SolidWorks/STEP geometry used by the simulated mechanism.

The MATLAB inverse-kinematics implementation will be reorganized into a reusable project-level function before the source code is finalized in this directory.

## Validation

Cartesian end-effector positions generated from six simulated joint configurations were supplied to the inverse-kinematics calculation, and the recovered joint configurations were compared with the original inputs.

## Tools

- MATLAB
- Simulink
- Simscape / Simscape Multibody
- SolidWorks

## Project Role

The PUMA model provides a second manipulator architecture for studying inverse and differential kinematics. Its geometry is carried forward into the Jacobian analysis developed in `03-differential-kinematics`.
