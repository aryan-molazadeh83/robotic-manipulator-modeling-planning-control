# SCARA Kinematics

This submodule contains the kinematic model of a 3-DOF SCARA manipulator.

## Scope

The SCARA model combines analytical kinematics with a multibody simulation model.

The work includes:

- CAD representation of the base, two planar links, and prismatic end-effector stage,
- coordinate-frame assignment,
- Denavit–Hartenberg modeling,
- analytical forward kinematics,
- multibody simulation in Simulink/Simscape,
- validation of end-effector positions over multiple joint configurations.

## Robot Parameters

The analytical model uses:

- base height: 50 cm,
- first planar link: 45 cm,
- second planar link: 40 cm,
- two revolute joints followed by one prismatic joint.

## Source Organization

```text
codes/
model/
cad/
```

The MATLAB kinematics code will reuse the homogeneous rotation and translation utilities from `01-foundations/codes`.

The `model/` directory contains the SCARA multibody model, while `cad/` contains the associated geometry files used to construct the simulated mechanism.

## Validation

The analytical forward-kinematics results were compared with the simulated end-effector positions for six joint configurations during the original project development.

## Tools

- MATLAB
- Simulink
- Simscape / Simscape Multibody
- SolidWorks

## Project Role

This SCARA model is reused later for trajectory planning and closed-loop actuation/control, making it the primary manipulator platform of the integrated project.
