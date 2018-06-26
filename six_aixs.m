clear;
clc;
L1 = Link('d', 0, 'a', 0, 'alpha', pi/2);    %Link �ຯ��
L2 = Link('d', 0, 'a', 0.5, 'alpha', 0,'offset',pi/2);
L3 = Link('d', 0, 'a', 0, 'alpha', pi/2,'offset',pi/4);
L4 = Link('d', 1, 'a', 0, 'alpha', -pi/2);
L5 = Link('d', 0, 'a', 0, 'alpha', pi/2);
L6 = Link('d', 1, 'a', 1, 'alpha', 1);
robot=SerialLink([L1,L2,L3,L4,L5,L6]);   %SerialLink �ຯ��
robot.name='�Զ���';     %SerialLink ����ֵ
%robot.manuf='zh';     %SerialLink ����ֵ
robot.display();  %Link �ຯ��
cchain = robot.trchain; %��ʾĩ�˺ͻ����ı任��ϵ


init_ang=[0 0 0 0 0 0];
targ_ang=[pi/4,-pi/3,pi/5,pi/2,-pi/4,pi/6];
step=40;
[q,qd,qdd] = jtraj(init_ang, targ_ang, step);
subplot(3,2,[1,3]);
robot.plot(q); 


subplot(3,2,2);
i=1:6;
plot(q(:,i));hold on;
title('λ��');
grid on;
subplot(3,2,4);
i=1:6;
plot(qd(:,i));
title('�ٶ�');
grid on;
subplot(3,2,6);
i=1:6;
plot(qdd(:,i));
title('���ٶ�');
grid on;

p1 =[  -0.7071   -0.0000    0.7071    1.4142;
        0.0000   -1.0000   -0.0000   -0.0000;
        0.7071    0.0000    0.7071    1.9142;
             0         0         0    1.0000];


p2 =[     0.9640   -0.2639   -0.0332    0.9331;
          0.0979    0.2361    0.9668    1.9331;
         -0.2473   -0.9352    0.2534    0.8618;
               0         0         0    1.0000];

Tc=ctraj(p1,p2,step);
Tjtraj=transl(Tc);
subplot(3,2,5);
plot2(Tjtraj,'r');hold on;
tranimate(Tc)
title('p1��p2ֱ�߹켣');
grid on;

% p0 = robot.fkine(theta1)
% q = robot.getpos()
% q1 = robot.ikine(p0)