clc;clear;
syms theta;
%%%%%%%%%%%将极坐标转化成直角坐标%%%%%%%%%%%%%
rho = 100*(1-0.3)/(1-0.3*cos(3*theta));
[x,y] = pol2cart(theta,rho);
r = [x y 0];
r1 = diff(r);r2 = diff(r1);r3 = diff(r2);
k = mo(cross(r1,r2))/(mo(r1))^3;
%%%%%%%%%%%定义误差大小，计算弧度角和弧长，求出delta_u%%%%%%%%%%%%
delta_e = 0.1;
theta = 0;
i = 1;
while theta<2*pi
    delta_theta = 2*eval(acos(1-delta_e*k));
    delta_s = delta_theta*(1/eval(k));
    delta_u = delta_s/eval(mo(r1));
    theta = theta+delta_u;
    if(i==1)
        theta_vector(i) = 0;
    end
    i=i+1;
    theta_vector(i) = theta;   
    %plot(subs(x,theta),subs(y,theta),'*');hold on;
end

theta = 0:0.05:2*pi;
yy = spline_three(theta_vector,eval(subs(rho,theta_vector)),1,1,theta);
polar(theta,yy)
