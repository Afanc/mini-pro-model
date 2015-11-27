%Part A4 of the mini-projet

clear all;
close all;

Timedelta=[0,4000]; %Time interval in which the script simulates the system
Initial=[0,0,4]; %Initial conditions of the system

options=odeset('RelTol',1e-5);

N=50; %Number of v1 values used to plot bifurcation diagram

%Initiates vectors
v1vector=linspace(0,1,N);
xmax=zeros(1,N);
xmin=zeros(1,N);

for i=1:N
    
v1i=v1vector(i);

%Simulates the cells
[T,Y]=ode45(DifferentialSystemA(v1i),Timedelta,Initial,options);

%Specifies lower cutoff point
cutoff=0.9;
sizemax=size(Y(:,1));
sizecutoff=round(sizemax*0.9);

%Looks for maximum and minimum values late in the system for given v1
xmax(i)=max(Y(sizecutoff(1):sizemax(1),1));
xmin(i)=min(Y(sizecutoff(1):sizemax(1),1));

end

%Plots xmax and xmin as a functino of v1
plot(v1vector,xmax,'g',v1vector,xmin,'r');
title('Bifurcation diagram');
xlabel('v1 [nM/h]');
ylabel('xmin,xmax [nM]');
legend('xmax','xmin');
hold on;
grid on;

