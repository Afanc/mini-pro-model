%Part A.3 of mini-projet

clear all;
close all;

Timedelta=[0,1000]; %Time interval in which the script simulates the system
%Initial=[0.1640,0.3312,1.8141]; %Initial conditions of the system
Initial=[0,0,0];

options=odeset('RelTol',1e-4,'AbsTol',[1e-4,1e-4,1e-4]);

N=50;

v1vector=linspace(0,1,N);
xmax=zeros(N);
xmin=zeros(N);

for i=1:N
    
v1i=v1vector(i);

[T,Y]=ode45(MPdiffeqA(v1i),Timedelta,Initial,options);

xmax(i)=max(Y(:,1));
xmin(i)=min(Y(:,1));

end

%figure();
plot(v1vector,xmax,'-',v1vector,xmin,'-');
title('Bifurcation diagram');
xlabel('v1 [nM/h]');
ylabel('xmin,xmax [nM]');

%figure();
%plot3(Y(:,1),Y(:,2),Y(:,3));
%title(['v1= ' num2str(v1i) 'nM/h.']);
%xlabel('X');
%ylabel('Y');
%zlabel('Z');
%hold on;

