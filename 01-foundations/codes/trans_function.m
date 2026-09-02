function T=trans_function(axis, distance) 
%Perform a homogeneous translation along the "axis" by a distance of "distance".

axis=upper(axis); 
if (axis == 'X') 
T=[1 0 0 distance; 0 1 0 0; 0 0 1 0; 0 0 0 1]; 
end 

if (axis == 'Y') 
T=[1 0 0 0; 0 1 0 distance; 0 0 1 0; 0 0 0 1]; 
end

if (axis =='Z') 
T=[1 0 0 0; 0 1 0 0; 0 0 1 distance; 0 0 0 1]; 
end