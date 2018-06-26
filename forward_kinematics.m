function fkine = forward_kinematics(theta,d,a,alpha)

%标准D-H变换矩阵
fkine = [ cos(theta), -cos(alpha)*sin(theta),  sin(alpha)*sin(theta), a*cos(theta);
          sin(theta),  cos(alpha)*cos(theta), -sin(alpha)*cos(theta), a*sin(theta);
                  0,             sin(alpha),             cos(alpha),            d;
                  0,                      0,                      0,            1];
%改进D-H变换矩阵
% fkine = [           cos(theta),           -sin(theta),           0,             a;
%          cos(alpha)*sin(theta), cos(alpha)*cos(theta), -sin(alpha), -d*sin(alpha);
%          sin(alpha)*sin(theta), sin(alpha)*cos(theta),  cos(alpha),  d*cos(alpha);
%                              0,                     0,           0,             1];
end