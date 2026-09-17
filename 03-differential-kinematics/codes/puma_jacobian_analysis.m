clc;
clear;

%% part1
D_H = [sym('th1'), sym('h') , sym('0') , sym('90');
       sym('th2'), sym('d') , sym('L1'), sym('0') ;
       sym('th3'), sym('0') , sym('L2'), sym('0') ];

A = [1, 1, 1];
Q = [sym('th1'); sym('th2'); sym('th3')];

%% part2
% N means number of links
n1 = size(D_H);
n = n1(1,1);

%% part3
th    = sym('Th', [n 1]);
D     = sym('D', [n 1]);
L     = sym('L', [n 1]);
alpha = sym('Al', [n 1]);

DH = [th D L alpha];

%% part4
HH = cell(1,n);

for k = 1:n
    HH{k} = Rot('Z', DH(k, 1))*Trans('Z', DH(k, 2))* ...
            Trans('X', DH(k, 3))*Rot('X', DH(k, 4));
end

%% part5
H = cell(1, n+1);

for k = 0:n
    if k == 0
        H{k+1} = sym(eye(4));
    else
        H{k+1} = H{k}*HH{k};
    end
end

%% part6
R = cell(1, n+1);

for i = 1:n+1
    R{i} = H{i}(1:3, 1:3);
end

%% part7
% J_w is a Rotational Jacobian
J_w1 = cell(1, n);

for i = 1:n
    J_w1{i} = R{i}*[0;0;1]*A(1, i);
end

J_w = horzcat(J_w1{:});

%% part8
% J_v is a Transitional Jacobian
J_v1 = cell(1, n);

for i = 1:n
    if A(1, i) == 0
        J_v1{i} = R{i}*[0;0;1];

    elseif A(1, i) == 1
        J_v1{i} = cross(R{i}*[0;0;1], ...
            (H{n+1}(1:3, 4:4) - H{i}(1:3, 4:4)));
    end
end

J_v = horzcat(J_v1{:});

%% part9
% J_of is a Jacobian Transformation Matrix
J_of = [J_v; J_w];

J = subs(J_of, DH, D_H);

%% part10
J_inv = inv(J_v);

V = [150; 100; 50];

V_th = (J_inv)*V;

%% part11
% h = 650, D = 150, L1 = 450, L2 = 550

th_dot1 = V_th(1,1);
th_dot2 = V_th(2,1);
th_dot3 = V_th(3,1);

%% part12
function T = Trans(axis, distance)

axis = upper(axis);

if (axis == 'X')
    T = [1 0 0 distance;
         0 1 0 0;
         0 0 1 0;
         0 0 0 1];
end

if (axis == 'Y')
    T = [1 0 0 0;
         0 1 0 distance;
         0 0 1 0;
         0 0 0 1];
end

if (axis == 'Z')
    T = [1 0 0 0;
         0 1 0 0;
         0 0 1 distance;
         0 0 0 1];
end

end

%% part13
function R = Rot(axis, angle)

axis = upper(axis);
angle = deg2rad(angle);

if (axis == 'X')
    R = [1 0 0 0;
         0 cos(angle) -sin(angle) 0;
         0 sin(angle) cos(angle) 0;
         0 0 0 1];
end

if (axis == 'Y')
    R = [cos(angle) 0 sin(angle) 0;
         0 1 0 0;
         -sin(angle) 0 cos(angle) 0;
         0 0 0 1];
end

if (axis == 'Z')
    R = [cos(angle) -sin(angle) 0 0;
         sin(angle) cos(angle) 0 0;
         0 0 1 0;
         0 0 0 1];
end

end
