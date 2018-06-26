clc; clear all;
syms x y z L0 L1 L2;
%求解theta1
theta1 = atan2(-x,y);
%求解theta3
r = sqrt(x^2+y^2+(L0-z)^2);
alpha = acos((L1^2+L2^2-r^2)/(2*L1*L2));
theta3_1 = pi-alpha;
theta3_2 = pi+alpha;
%求解theta2
beta = acos((L1^2+r^2-L2^2)/(2*L1*r));
theta2_1 = pi/2-atan2((x^2+y^2),(L0-z))-beta;
theta2_2 = pi/2-atan2((x^2+y^2),(L0-z))+beta;
%Solution 1
theta1
theta2_1
theta3_1
%Solution 2
theta1
theta2_2
theta3_2