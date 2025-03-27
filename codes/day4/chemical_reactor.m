%% Clear environment
clear
clc

%% Define reaction coefficients
k1 = 4; 
k2 = 2; 
k3 = 5; 
k4 = 2; 
k5 = 1;

%% Define control system matrix
A = [-k1, k2, 0; k1, -(k2+k3+k4), 0; 0, k3, -k5];
B = [];
C = eye(3);
D = [];

%% Solve the system 
% Install control system toolbox
sys = ss(A, B, C, D);
x0 = [10, 0, 0]';
initialplot(sys, x0);
