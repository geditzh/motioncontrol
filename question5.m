clc;clear;
syms theta;
%%%%%%%%%%%将极坐标转化成直角坐标，计算曲率挠率%%%%%%%%%%
rho = 100*(1-0.3)/(1-0.3*cos(3*theta));
rho1 = 100*(1-0.5)/(1-0.5*cos(3*theta));
rho2 = 100*(1-0.7)/(1-0.7*cos(3*theta));
rho3 = 100*(1-0.9)/(1-0.9*cos(3*theta));
[x,y] = pol2cart(theta,rho);
[x1,y1] = pol2cart(theta,rho1);
[x2,y2] = pol2cart(theta,rho2);
[x3,y3] = pol2cart(theta,rho3);
theta = 0:0.002*pi:2*pi;
figure(1)
plot(subs(x,theta),subs(y,theta));hold on;
plot(subs(x1,theta),subs(y1,theta));hold on;
plot(subs(x2,theta),subs(y2,theta));hold on;
plot(subs(x3,theta),subs(y3,theta));hold on;
annotation('arrow',[0.64 0.55],[0.76 0.74]);  
annotation('arrow',[0.64 0.55],[0.68 0.64]);  
annotation('arrow',[0.64 0.52],[0.60 0.58]);  
annotation('arrow',[0.64 0.53],[0.52 0.54]);  
text(40,60,'\fontsize{15}k=0.3');  
text(40,40,'\fontsize{15}k=0.5');  
text(40,20,'\fontsize{15}k=0.7');  
text(40,0,'\fontsize{15}k=0.9');  
title('原始曲线');