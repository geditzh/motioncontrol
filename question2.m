clear all
clc
%%%%%%%%%%%求曲线各阶导数，计算曲率挠率%%%%%%%%%%
syms t;
x = 21*cos(t)/(1-0.3*cos(3*t));
y = 21*sin(t)/(1-0.3*cos(3*t));
r = [21*cos(t)/(1-0.3*cos(3*t)) 21*sin(t)/(1-0.3*cos(3*t)) 0];
r1 = diff(r);r2 = diff(r1);r3 = diff(r2);
k = mo(cross(r1,r2))/(mo(r1))^3;
nao = dot(cross(r1,r2),r3)/((mo(cross(r1,r2)))^2);
%%%%%%%%%%%计算r1,r2叉乘结果与定义副法线方向是否一致%%%%%%%%%%
b = cross(r1,r2);
b = b(3);
%%%%%%%%%%%%%%%%%%%%画出绝对曲率和相对曲率%%%%%%%%%%%%%%%%%
t = 0:0.02*pi:pi*2;
figure(1)
subplot(1,2,1)
k = eval(k);
plot(t,k)
xlabel('t'),ylabel('k'),title('绝对曲率')
axis([0 8 -0.1 0.2]);
kr = zeros(1,length(k));
b = eval(b);
for i=1:length(k)
    kr(i) = b(i)*k(i)/abs(b(i));
end
subplot(1,2,2)
plot(t,kr);
xlabel('t'),ylabel('kr'),title('相对曲率')
axis([0 8 -0.1 0.2]);
%%%%%%%%%%%%%%%%%%%%画出曲线，挠率%%%%%%%%%%%%%%%%%%%
figure(2)
subplot(1,2,1)
plot(subs(x,t),subs(y,t));
xlabel('x');ylabel('y');title('原始曲线');
subplot(1,2,2)
plot(t,subs(nao,t))
xlabel('t'),ylabel('nao'),title('挠率曲线')