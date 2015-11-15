%Part A.3 of mini-projet

clear all;
close all;

Timedelta=[0,1000]; %Time interval in which the script simulates the system
%Initial=[0.1640,0.3312,1.8141]; %Initial conditions of the system
Initial=[0.2,0.5,2];

options=odeset('RelTol',1e-4,'AbsTol',[1e-4,1e-4,1e-4]);

for i=0:3
    
v1i=0.1+0.3*i;

[T,Y]=ode45(MPdiffeqA(v1i),Timedelta,Initial,options);

%figure();
%plot(T,Y(:,1),'-',T,Y(:,2),'-',T,Y(:,3),'-');
%title('Evolution of X,Y & Z over time');
%xlabel('Time[h]');
%ylabel('Amount in [nM]');

%figure();
plot3(Y(:,1),Y(:,2),Y(:,3));
title(['v1= ' num2str(v1i) 'nM/h.']);
xlabel('X');
ylabel('Y');
zlabel('Z');
hold on;

end