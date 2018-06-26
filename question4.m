clc;clear;
%%%%%%%%%%%%%%%%%%将角度生成栅格%%%%%%%%%%%%%%%%%
theta = 0:1:360;
fai = 0:1:90;
[theta,fai] = meshgrid(theta,fai);
a = 40;b = 20;
%%%%%%%%%%%%%%%%%g代表平面椭圆曲线方程%%%%%%%%%%%%%%%%%
g = (theta-181).^2/a^2+(fai-46).^2/b^2;
[r,c] = size(g);
theta1 = zeros(91,361);
fai1 = zeros(91,361);
%%%%%%%%%%%%%%%%%画出选定的椭圆定义域%%%%%%%%%%%%%%%%%
figure(1)
for i=1:r
    for j=1:c
         if(g(i,j)<=1)
            plot(theta(i,j),fai(i,j),'*');hold on;            
            theta1(i,j) = theta(i,j);
            fai1(i,j) = fai(i,j);
         end
    end
end
axis([135 225 20 70]);
xlabel('theta');ylabel('fai');title('定义域');
%%%%%%%%%%%%%%%%%画出对应到三维坐标系中的曲面%%%%%%%%%%%%%%%%%
figure(2)
ind = find(theta1 == 0);
theta1(ind) = nan;
ind = find(fai1 == 0);
fai1(ind) = nan;
theta1 = theta1.*pi/180;
fai1 = fai1.*pi/180;
x = 30*cos(fai1).*cos(theta1);
y = 20*cos(fai1).*sin(theta1);
z = 15*sin(fai1);
surf(x,y,z);
title('投影曲面')


