function H3=scara_forward_kinematics(theta1, theta2, d3)
theta1 = deg2rad(theta1);
theta2 = deg2rad(theta2);

d1 = 50;
l1 = 45;
l2 = 40;
alpha3 = 180;

H01 = rot_function('Z', theta1) * trans_function('Z', d1) * trans_function('X', l1);
H12 = rot_function('Z', theta2) * trans_function('X', l2);
H23 = trans_function('Z', d3) * rot_function('X', alpha3);
H3 = H01 * H12 * H23;