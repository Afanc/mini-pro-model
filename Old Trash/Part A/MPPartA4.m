%Part A.4 of mini-projet

clear all;
close all;

%for n=1:5

Timedelta=[0,1000]; %Time interval in which the script simulates the system
%Initial=[0.1640,0.3312,1.8141]; %Initial conditions of the system
Initial=[2,2,2];

options=odeset('RelTol',1e-4,'AbsTol',[1e-4,1e-4,1e-4]);

N=50;

v1vector=linspace(0,1,N);
xmax=zeros(1,N);
xmin=zeros(1,N);

for i=1:N
    
v1i=v1vector(i);

[T,Y]=ode45(MPdiffeqA(v1i),Timedelta,Initial,options);
sizemax=size(Y(:,1));
sizehalf=round(sizemax*0.9);
xmax(i)=max(Y(sizehalf(1):sizemax(1),1));
xmin(i)=min(Y(sizehalf(1):sizemax(1),1));

end

%figure();
%j=(n-1)*0.2;
%col=[j j j];
plot(v1vector,xmax,'g',v1vector,xmin,'r');
title('Bifurcation diagram');
xlabel('v1 [nM/h]');
ylabel('xmin,xmax [nM]');
hold on;

%figure();
%plot3(Y(:,1),Y(:,2),Y(:,3));
%title(['v1= ' num2str(v1i) 'nM/h.']);
%xlabel('X');
%ylabel('Y');
%zlabel('Z');
%hold on;

%end