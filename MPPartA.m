%Part A of mini-projet

clear all;
close all;

Timedelta=[0,1000]; %Time interval in which the script simulates the system
Initial=[1,2,3]; %Initial conditions of the system

options=odeset('RelTol',1e-4,'AbsTol',[1e-4,1e-4,1e-4]);

[T,Y]=ode45(@MPdiffeqA,Timedelta,Initial,options);

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