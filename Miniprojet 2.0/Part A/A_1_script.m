%Part A1 of mini-projet 

clear all;
close all;

Timedelta=[0,10]; %Time interval in which the script simulates the system
Initial=[0,0,4]; %Initial conditions

options=odeset('RelTol',1e-8);

%Sets parameter v1
v1i=0.7;

%Simulates the cell
[T,Y]=ode45(DifferentialSystemA(v1i),Timedelta,Initial,options);

%Plots the evolution of parameters over time
figure();
plot(T,Y(:,1),'-',T,Y(:,2),'-',T,Y(:,3),'-');
title('Evolution of X,Y & Z over time');
xlabel('Time[h]');
ylabel('Amount in [nM]');
legend('X','Y','Z');
grid on;

%Plots the evolution of parameters as a function of each other
figure();
plot3(Y(:,1),Y(:,2),Y(:,3));
title('X,Y & Z as a function of each other');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;