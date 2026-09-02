clear;
clc;

% Problem geometry
a = 20;
b = 20;
e = 15;
l = 5;

% Build the homogeneous transformations

% Translate 40 cm along the global Y axis.
T_y = trans_function('Y', a + b);

% Translate 20 cm along the Z axis.
T_z = trans_function('Z', e + l);

% Translate 5 cm along the X axis.
T_x = trans_function('X', l);

% Rotate -90 degrees about the Y axis.
R_y = rot_function('Y', -pi/2);

% Compose the transformation from frame 1 to frame 0
H01 = T_y * T_z * T_x * R_y;

% Target-frame origin expressed in frame 1
P1 = [0;
      0;
      0;
      1];

% Express the target-frame origin in the global frame
P0 = H01 * P1;

% Display results
disp('Homogeneous transformation H01 =');
disp(H01);

disp('Target-frame origin expressed in the global frame P0 =');
disp(P0);

% Verification
expected_P0 = [5;
               40;
               20;
               1];

assert(norm(P0 - expected_P0) < 1e-10, ...
    'The computed target position does not match the expected result.');
