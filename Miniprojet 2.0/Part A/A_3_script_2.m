%Part A3 of the mini-projet part 2

clear all;
close all;

Timedelta=[0,1000]; %Time interval in which the script simulates the system
Initial=[0,0,4]; %Initial conditions of the system

options=odeset('RelTol',1e-4,'AbsTol',[1e-4,1e-4,1e-4]);

for i=0:10
    
v1i=0.0+0.1*i;

[T,Y]=ode45(DifferentialSystemA(v1i),Timedelta,Initial,options);

%Plots X,Y and Z over time with a given v1
figure();
plot(T,Y(:,1),'-r',T,Y(:,2),'-g',T,Y(:,3),'-b');
title(['Evolution of X,Y & Z over time with v1=' num2str(v1i) 'nM/h.']);
xlabel('Time[h]');
ylabel('Amount in [nM]');
legend('X','Y','Z');
grid on;
%filename = strcat('A-A', num2str(i));
%print(filename, '-dpng');

%Plots X,Y and Z as a function of each other with a given v1
figure();
plot3(Y(:,1),Y(:,2),Y(:,3));
title(['v1= ' num2str(v1i) 'nM/h.']);
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
%filename = strcat('A-AA', num2str(i));
%print(filename, '-dpng');

end