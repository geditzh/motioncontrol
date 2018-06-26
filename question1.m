clear all
clc
%%%%%%%%%%%求曲线各阶导数，计算曲率挠率%%%%%%%%%%
syms t;
r = [5*cos(t),2*sin(t),3*t];
r1 = diff(r);r2 = diff(r1);r3 = diff(r2);
k = mo(cross(r1,r2))/(mo(r1))^3;
C = [r1;r2;r3];
%nao = dot(cross(r1,r2),r3)/((mo(cross(r1,r2)))^2);
nao = det(C)/((mo(cross(r1,r2)))^2);
%%%%%%%%%%%%%%%%%%%%画出曲线，曲率，挠率%%%%%%%%%%%%%%%%%%%
t = 0:0.006*pi:6*pi;
figure(1)
subplot(1,2,1)
plot(t,subs(k,t))
xlabel('t');ylabel('k');title('曲率曲线');
subplot(1,2,2)
plot(t,subs(nao,t))
xlabel('t');ylabel('nao');title('挠率曲线');

figure(2)
x = 5*cos(t);
y = 2*sin(t);
z = 3*t;
plot3(x,y,z)
xlabel('x');ylabel('y');zlabel('z');title('原始曲线')