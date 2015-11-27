%Part BN1 of the mini-projet

clear all;
close all;

N=100; %Number of cells
C=1.5; %Coupling strength

%Initialization of periods around mu with sigma standard deviation
V=zeros(1,N); 
for s=1:N
    mu=1;
    sigma=0.05;
    V(s)=normrnd(mu,sigma);
end
  
Timedelta=[0,120]; %Time interval in which the script simulates the system


%Allows to set initial conditions of X,Y,Z for all cells (not only if N=2.
Initial=zeros(1,N*4);
for u=1:N
    Initial(1+(u-1)*4)=0;
    Initial(2+(u-1)*4)=0;
    Initial(3+(u-1)*4)=3;
    Initial(4+(u-1)*4)=0;
end

options=odeset('RelTol',1e-6);

%Simulates the system
[T,Y]=ode45(DifferentialSystemB(N,C,V),Timedelta,Initial,options);

for t=1:N
    
    plot(T,Y(:,1+((t-1)*4)),'-')
    title(['Evolution of X1, X2 etc over time with K=' num2str(C) '.']);
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    grid on;
    hold on;
    
end



    
