%Part B1 of the mini-projet

clear all;
close all;

N=2;
C=0; %Coupling coefficient
V=[1,1.15]; %Period parameters lambda
  
Timedelta=[0,400]; %Time interval in which the script simulates the system
Initial=[0,0,3,0,0,0,3,0]; %Allows adjustments of inital parameters

options=odeset('RelTol',1e-5);

%Simulates the cells
[T,Y]=ode45(DifferentialSystemB(N,C,V),Timedelta,Initial,options);

for t=1:N
    
    plot(T,Y(:,1+((t-1)*4)),'-')
    title('Evolution of X1, X2 etc over time');
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    grid on;
    hold on;
    
end


