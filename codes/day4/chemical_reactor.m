clear
clc

k1 = 4; 
k2 = 2; 
k3 = 5; 
k4 = 2; 
k5 = 1;

A = [-k1, k2, 0; k1, -(k2+k3+k4), 0; 0, k3, -k5];
B = [];
C = eye(3);
D = [];

% Install control system toolbox
sys = ss(A, B, C, D);
x0 = [10, 0, 0]';
initialplot(sys, x0)
