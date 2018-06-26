function infkine = inverse_kinematics(T)

    px = T(1,4);py = T(2,4);pz = T(3,4);nx = T(1,1);ny = T(2,1);
    cos_theta2 = (px^2+py^2-40^2*2)/(2*40*40);
    sin_theta2 = sqrt(1-cos_theta2^2);
    theta2 = -atan(sin_theta2/cos_theta2);
    
    sin_theta1 = ((40+40*cos_theta2)*py-40*sin_theta2*px)/(px^2+py^2);
    cos_theta1 = ((40+40*cos_theta2)*px+40*sin_theta2*py)/(px^2+py^2);
    theta1 = atan(sin_theta1/cos_theta1);
    
    d3 = pz-40;
    
    cos_theta4 = nx*cos(theta1+theta2)+ny*sin(theta1+theta2);
    sin_theta4 = nx*sin(theta1+theta2)-ny*cos(theta1+theta2);
    theta4 = atan(sin_theta4/cos_theta4);
    infkine = [theta1,theta2,d3,theta4] ;
end