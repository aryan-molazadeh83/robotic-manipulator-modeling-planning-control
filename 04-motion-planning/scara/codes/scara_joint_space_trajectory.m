clc;
clear;
close all;

[theta1_i, theta2_i, d_i] = location(50, 20, 10);
[theta1_f, theta2_f, d_f] = location(-20, -30, 30);

Coef = [1, 0, 0, 0;
        0, 1, 0, 0;
        1, 2, 4, 8;
        0, 1, 4, 12];

b_1 = [theta1_i; 0; theta1_f; 0];
b_2 = [theta2_i; 0; theta2_f; 0];
b_3 = [d_i; 0; d_f; 0];

X_1 = Coef \ b_1;
X_2 = Coef \ b_2;
X_3 = Coef \ b_3;

coeff = [X_1(4,1) X_1(3,1) X_1(2,1) X_1(1,1);
         X_2(4,1) X_2(3,1) X_2(2,1) X_2(1,1);
         X_3(4,1) X_3(3,1) X_3(2,1) X_3(1,1)];

joint_names = {'Joint 1 - angle theta1', ...
               'Joint 2 - angle theta2', ...
               'Joint 3 - displacement d'};

line_style = {'--r'};

syms s

for i = 1:3
    p = poly2sym(coeff(i,:), s);
    dp = diff(p, s);
    ddp = diff(p, s, 2);

    p_func = matlabFunction(p);
    dp_func = matlabFunction(dp);
    ddp_func = matlabFunction(ddp);

    t = linspace(0, 2, 200);
    p_vals = p_func(t);
    dp_vals = dp_func(t);
    ddp_vals = ddp_func(t);

    figure('Position', [100, 100, 800, 600], 'Name', joint_names{i});

    subplot(3,1,1);
    plot(t, p_vals, line_style{1}, 'LineWidth', 2);
    grid on;
    grid minor;
    title([joint_names{i} ' - Position Profile'], ...
        'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Time (s)', 'FontSize', 10);
    ylabel('Position (deg/cm)', 'FontSize', 10);

    subplot(3,1,2);
    plot(t, dp_vals, line_style{1}, 'LineWidth', 2);
    grid on;
    grid minor;
    title('Velocity Profile', 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Time (s)', 'FontSize', 10);
    ylabel('Velocity (unit/s)', 'FontSize', 10);

    subplot(3,1,3);
    plot(t, ddp_vals, line_style{1}, 'LineWidth', 2);
    grid on;
    grid minor;
    title('Acceleration Profile', 'FontSize', 12, 'FontWeight', 'bold');
    xlabel('Time (s)', 'FontSize', 10);
    ylabel('Acceleration (unit/s^2)', 'FontSize', 10);

    sgtitle(['Motion Profile for ' joint_names{i}], ...
        'FontSize', 14, 'FontWeight', 'bold');
end

fprintf('Initial and final values:\n');
fprintf('Joint 1: theta1(0)=%.2f deg, theta1(2)=%.2f deg\n', ...
    theta1_i, theta1_f);
fprintf('Joint 2: theta2(0)=%.2f deg, theta2(2)=%.2f deg\n', ...
    theta2_i, theta2_f);
fprintf('Joint 3: d(0)=%.2f cm, d(2)=%.2f cm\n\n', ...
    d_i, d_f);

fprintf('Polynomial coefficients:\n');

for i = 1:3
    fprintf('%s: ', joint_names{i});
    fprintf('%.4f ', coeff(i,:));
    fprintf('\n');
end


function [theta_1, theta_2, d] = location(x, y, z)

    l1 = 45;
    l2 = 40;
    h = 50;

    d = h - z;

    theta_2 = rad2deg(acos( ...
        (x^2 + y^2 - l1^2 - l2^2) / (2*l1*l2)));

    theta_1 = rad2deg( ...
        atan2(y, x) ...
        - atan2( ...
            l2*sind(theta_2)/sqrt(x^2 + y^2), ...
            (l1 + l2*cosd(theta_2))/sqrt(x^2 + y^2)));

end
