function IK = puma_inverse_kinematics(x_0, y_0, z_0)

h = 0.65;
d = 0.15;
L_1 = 0.45;
L_2 = 0.55;
threshold = 0.0001;

P_0 = [x_0; y_0; z_0; 1];

theta_11 = pi/2 - abs(acos(d/sqrt(x_0^2 + z_0^2))) ...
    - atan2(z_0/sqrt(x_0^2 + z_0^2), x_0/sqrt(x_0^2 + z_0^2));

theta_1 = rad2deg(theta_11);
theta_1((theta_1 > (-1)*threshold) & (theta_1 < threshold)) = 0;

P_1 = Trans('Y', -h) * Trans('Z', -d) * Rot('Y', -theta_1) * P_0;

xx = P_1(1, 1);
yy = P_1(2, 1);
zz = P_1(3, 1);

theta_33 = -acos(((xx)^2 + (yy)^2 - (L_1)^2 - (L_2)^2) / (2*L_1*L_2));

theta_3 = rad2deg(theta_33);
theta_3((theta_3 > (-1)*threshold) & (theta_3 < threshold)) = 0;

beta = atan2(yy/sqrt(yy^2 + xx^2), xx/sqrt(yy^2 + xx^2));
alpha = atan2(L_2*sin(theta_33)/sqrt(yy^2 + xx^2), ...
    (L_1 + L_2*cos(theta_33))/sqrt(yy^2 + xx^2));

theta_22 = beta - alpha;
theta_2 = rad2deg(theta_22);
theta_2((theta_2 > (-1)*threshold) & (theta_2 < threshold)) = 0;

IK = [theta_1; theta_2; theta_3];

end


function T = Trans(axis, distance)
%Homogenous Transformation along "axis" for the amount of "distance"

axis = upper(axis);

if (axis == 'X')
    T = [1 0 0 distance; 0 1 0 0; 0 0 1 0; 0 0 0 1];
end

if (axis == 'Y')
    T = [1 0 0 0; 0 1 0 distance; 0 0 1 0; 0 0 0 1];
end

if (axis == 'Z')
    T = [1 0 0 0; 0 1 0 0; 0 0 1 distance; 0 0 0 1];
end

end


function R = Rot(axis, angle)
%Homogenous rotation along "axis" for the amount of "degree"

axis = upper(axis);
angle = deg2rad(angle);

if (axis == 'X')
    R = [1 0 0 0; 0 cos(angle) -sin(angle) 0; ...
         0 sin(angle) cos(angle) 0; 0 0 0 1];
end

if (axis == 'Y')
    R = [cos(angle) 0 sin(angle) 0; 0 1 0 0; ...
         -sin(angle) 0 cos(angle) 0; 0 0 0 1];
end

if (axis == 'Z')
    R = [cos(angle) -sin(angle) 0 0; sin(angle) cos(angle) 0 0; ...
         0 0 1 0; 0 0 0 1];
end

end
