clc;
clear;

x = 0.01 * input('insert X(cm): ');
y = 0.01 * input('insert Y(cm): ');
z = 0.01 * input('insert Z(cm): ');

F = puma_inverse_kinematics(x, y, z);

disp('Joint angles values:');
disp('theta_1:');
disp(F(1,1));
disp('Theta_2:');
disp(F(2,1));
disp('theta_3:');
disp(F(3,1));
