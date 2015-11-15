%Part A.1 of mini-projet

clear all;
close all;

Timedelta=[0,10000]; %Time interval in which the script simulates the system
%Initial=[0.1640,0.3312,1.8141]; %Initial conditions of the system
Initial=[0.2,0.5,2];

options=odeset('RelTol',1e-4,'AbsTol',[1e-4,1e-4,1e-4]);

v1i=0.1;

[T,Y]=ode45(MPdiffeqA(v1i),Timedelta,Initial,options);

figure();
plot(T,Y(:,1),'-',T,Y(:,2),'-',T,Y(:,3),'-');
title('Evolution of X,Y & Z over time');
xlabel('Time[h]');
ylabel('Amount in [nM]');

figure();
plot3(Y(:,1),Y(:,2),Y(:,3));
title('X,Y & Z as a function of each other');
xlabel('X');
ylabel('Y');
zlabel('Z');