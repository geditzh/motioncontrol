clc;clear;
syms theta;

%%%%%%%%%%%将极坐标转化成直角坐标，计算曲率挠率%%%%%%%%%%
rho = 100*(1-0.3)/(1-0.3*cos(3*theta));
[x,y] = pol2cart(theta,rho);
theta = 0:0.02*pi:2*pi;
figure(1)
subplot(1,2,1)
polar(theta,subs(rho,theta))
title('原始曲线');
subplot(1,2,2)
plot(subs(x,theta),subs(y,theta))
xlabel('x');ylabel('y');title('直角坐标');
r = [x y 0];
r1 = diff(r);r2 = diff(r1);r3 = diff(r2);
k = mo(cross(r1,r2))/(mo(r1))^3;
%%%%%%%%%%%计算r1,r2叉乘结果与定义副法线方向是否一致%%%%%%%%%%
b = cross(r1,r2);
b = b(3);
%%%%%%%%%%%%%%%%%%%%画出绝对曲率和相对曲率%%%%%%%%%%%%%%%%%
figure(2)
subplot(1,2,1)
k = eval(k);
plot(theta,k);
xlabel('x');ylabel('k');title('绝对曲率');
axis([0 8 -0.02 0.05]);
kr = zeros(1,length(k));
b = eval(b);
for i=1:length(k)
    kr(i) = b(i)*k(i)/abs(b(i));
end
subplot(1,2,2)
plot(theta,kr)
xlabel('x');ylabel('k');title('相对曲率');
axis([0 8 -0.02 0.05]);
%%%%%%%%%%%%%%%%%%%%%计算画出左右法向等距线%%%%%%%%%%%%%%%%%%%
kr_max=0;
for i=1:1:length(kr)
    if(kr(i)>0)
        if(kr(i)>kr_max)
            kr_max = kr(i);
        end
    end
end
Rmax_Left = 1/kr_max
b = [0 0 1];
t = r1/mo(r1);
n = cross(b,t);
r_left = r+1.5*Rmax_Left*n;
kr_max=0;
for i=1:1:length(kr)
    if(kr(i)<0)
        kr(i) = abs(kr(i));
        if(kr(i)>kr_max)
            kr_max = kr(i);
        end
    end
end
Rmax_Right = 1/kr_max
r_right = r-1.5*Rmax_Right*n;
figure(3)
%polar(theta,subs(rho,theta));hold on;
plot(subs(x,theta),subs(y,theta));hold on;
plot(subs(r_left(1),theta),subs(r_left(2),theta),'r');hold on;
plot(subs(r_right(1),theta),subs(r_right(2),theta),'k')
