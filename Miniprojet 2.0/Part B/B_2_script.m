%Part B2 of the mini-projet

clear all;
close all;

N=2; %Number of cells

V=[1, 1.15]; %Period vector

Timedelta=[0,2000]; %Time interval in which the script simulates the system

%Allows to set initial conditions of X,Y,Z for all cells (not only if N=2.
Initial=zeros(1,N*4);
for u=1:N
    Initial(1+(u-1)*4)=0;
    Initial(2+(u-1)*4)=0;
    Initial(3+(u-1)*4)=3;
    Initial(4+(u-1)*4)=0;
end

options=odeset('RelTol',1e-4);

for K=1:16
    %Set coupling coefficient in [0,1.5]
    C=0.0+(K-1)*0.1;
    
    %Simulates the system
    [T,Y]=ode45(DifferentialSystemB(N,C,V),Timedelta,Initial,options);
    figure();
    
    for t=1:N
        %plots X1, X2 etc over time
        plot(T,Y(:,(1+((t-1)*4))),'-')
        title(['Evolution of X1 and X2 etc over time for C=' num2str(C)]);
        xlabel('Time[h]');
        ylabel('Amount in [nM]');
        grid on;
        hold on;
    end
    legend('L=1','L=1.15');
end