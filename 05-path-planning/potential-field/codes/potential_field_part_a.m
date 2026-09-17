clc; clear; close all;

xs = [4 9];
xf = [28 19];
eta = 1;

d0 = 2;
alpha = 1;

B = [
     6  4   10 11  d0 alpha
     8 17   16 15  d0 alpha
    16  9   22 17  d0 alpha
];

[P, reached] = Path_generator(xs, xf, eta, B);

figure; hold on; grid on; axis equal;
title('Part (a) - Potential Field Path');
xlabel('x'); ylabel('y');

for i = 1:size(B,1)
    plot(B(i,[1 3]), B(i,[2 4]), 'k-', 'LineWidth', 3);
end

plot(P(:,1), P(:,2), 'b-o', 'LineWidth', 1.5, 'MarkerSize', 4);
plot(xs(1), xs(2), 'go', 'MarkerFaceColor','g', 'MarkerSize', 8);
plot(xf(1), xf(2), 'ro', 'MarkerFaceColor','r', 'MarkerSize', 8);

legend('Obstacles','Path','Start','Goal','Location','best');

if reached
    disp('Reached the goal.');
else
    disp('Did NOT reach the goal (stuck or maxIter).');
    disp(['Last point: [', num2str(P(end,1)), ', ', num2str(P(end,2)), ']']);
end
