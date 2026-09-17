%% Project Setup
% Adds the project source-code and model folders to the MATLAB path.
% Run this script once after opening the repository.

project_root = fileparts(mfilename('fullpath'));

addpath(project_root);

addpath(fullfile(project_root, '01-foundations', 'codes'));

addpath(fullfile(project_root, '02-manipulator-kinematics', 'scara', 'codes'));
addpath(fullfile(project_root, '02-manipulator-kinematics', 'scara', 'model'));
addpath(fullfile(project_root, '02-manipulator-kinematics', 'puma', 'codes'));
addpath(fullfile(project_root, '02-manipulator-kinematics', 'puma', 'model'));

addpath(fullfile(project_root, '03-differential-kinematics', 'codes'));

addpath(fullfile(project_root, '04-motion-planning', 'scara', 'codes'));
addpath(fullfile(project_root, '04-motion-planning', 'scara', 'model'));

addpath(fullfile(project_root, '05-path-planning', 'potential-field', 'codes'));

addpath(fullfile(project_root, '06-actuation-and-control', 'model'));

disp('Project paths added successfully.');
