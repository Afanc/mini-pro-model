%Part A3 of the mini-projet

clear all;
close all;

Timedelta=[0,1000]; %Time interval in which the script simulates the system
Initial=[0.1640,0.3312,1.8141];%Initial conditions of the system

options=odeset('RelTol',1e-4);

%Simulates the system for v1=0.1,0.3,0.5,0.7 and 0.9
for i=0:4
    
v1i=0.1+0.2*i;

[T,Y]=ode45(DifferentialSystemA(v1i),Timedelta,Initial,options);

plot3(Y(:,1),Y(:,2),Y(:,3));
title('v1 variable [0,1]')
xlabel('X');
ylabel('Y');
zlabel('Z');
hold on;
grid on;

end

legend('v1=0.1nM/h','v1=0.3nM/h','v1=0.5nM/h','v1=0.7nM/h','v1=0.9nM/h');