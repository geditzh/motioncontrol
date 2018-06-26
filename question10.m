clc;clear all;
syms theta1 theta2 theta3
trans_z = [1 0 0 0
           0 1 0 0
           0 0 1 theta1
           0 0 0 1];
trans_y = [1 0 0 0
           0 1 0 theta2
           0 0 1 0
           0 0 0 1];
trans_x = [1 0 0 theta3
           0 1 0 0
           0 0 1 0
           0 0 0 1];
T = trans_z*trans_y*trans_x       