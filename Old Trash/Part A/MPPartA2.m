%Part A.3 of mini-projet

clear all;
close all;

Timedelta=[0,1000]; %Time interval in which the script simulates the system
Initial=[0.1640,0.3312,1.8141]; %Initial conditions of the system
%Initial=[0,0,0];

options=odeset('RelTol',1e-4,'AbsTol',[1e-4,1e-4,1e-4]);

for i=0:4
    
v1i=0.1+0.2*i;

[T,Y]=ode45(MPdiffeqA(v1i),Timedelta,Initial,options);

%figure();
%plot(T,Y(:,1),'-r',T,Y(:,2),'-g',T,Y(:,3),'-c');
%title('Evolution of X,Y & Z over time');
%xlabel('Time[h]');
%ylabel('Amount in [nM]');
%grid on;

%figure();
plot3(Y(:,1),Y(:,2),Y(:,3));
%title(['v1= ' num2str(v1i) 'nM/h.']);
title('v1 variable [0,1]')
xlabel('X');
ylabel('Y');
zlabel('Z');
hold on;
grid on;

end