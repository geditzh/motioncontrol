clc;clear all
syms alpha beta gamma;
Rz_alpha = [cos(alpha) -sin(alpha) 0;sin(alpha) cos(alpha) 0;0 0 1];
Ry_beta = [cos(beta) 0 sin(beta);0 1 0;-sin(beta) 0 cos(beta)];
Rx_gamma = [1 0 0;0 cos(gamma) -sin(gamma);0 sin(gamma) cos(gamma)];

Rab = Rz_alpha*Ry_beta*Rx_gamma


