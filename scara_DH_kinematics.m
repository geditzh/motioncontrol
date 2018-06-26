clc; clear all;
L1 = Link([0 80 40 0 0]);    %Link 类函数
L2 = Link([0 0 40 0 0]);
L3 = Link([0 0 0 0 1]);
L4 = Link([0 -40 0 0 0]);
robot = SerialLink([L1 L2 L3 L4]);
robot.name = 'scara';
robot.plotopt = {'workspace',[-100 100 -100 100 -100 100]};
robot.display();  %Link 类函数
init_ang=[0 0 0 0];
targ_ang=[pi/4 pi/2 10 pi/2];

%正向运动学分析
T0_1 = forward_kinematics(pi/4,80,40,0);
T1_2 = forward_kinematics(pi/2,0,40,0);
T2_3 = forward_kinematics(0,10,0,0);
T3_4 = forward_kinematics(pi/2,-40,0,0);
T0_4 = T0_1*T1_2*T2_3*T3_4;
robot.fkine(targ_ang);
[q,qd,qdd] = jtraj(init_ang, targ_ang, 40);
robot.plot(q);

%逆向运动学分析
p1 = [     1     0     0    80
     0     1     0     0
     0     0     1    40
     0     0     0     1]; 
p2 = [   -0.7071    0.7071         0    0.0000
   -0.7071   -0.7071         0   56.5685
         0         0    1.0000   50.0000
         0         0         0    1.0000];
targ = inverse_kinematics(p2)     
Tc=ctraj(p1,p2,40);
Tjtraj=transl(Tc);
figure(2)
plot2(Tjtraj,'r');hold on;
tranimate(Tc)
title('p1到p2直线轨迹');
grid on;