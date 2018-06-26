clc;clear all;
syms d theta a alpha;
trans_d = [1 0 0 0;
           0 1 0 0;
           0 0 1 d;
           0 0 0 1];
rot_theta = [cos(theta) -sin(theta) 0 0
             sin(theta)  cos(theta) 0 0
                 0            0     1 0
                 0            0     0 1];
trans_a = [1 0 0 a
           0 1 0 0
           0 0 1 0
           0 0 0 1];
rot_alpha = [1      0          0      0
             0 cos(alpha) -sin(alpha) 0
             0 sin(alpha)  cos(alpha) 0
             0      0          0      1];
         
 T_modified = rot_alpha*trans_a*rot_theta*trans_d
 T_standard = trans_d*rot_theta*trans_a*rot_alpha
       
         
         