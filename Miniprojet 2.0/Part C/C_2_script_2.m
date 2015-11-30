%Part C1 of the mini-projet

clear all;
close all;



%Initializes positions of the cells and their number
Width=10;
Length=14;
N=Width*Length;
        
%Initialization of periods around mu with sigma standard deviation
V=zeros(1,N); 
for s=1:N
    mu=1;
    sigma=0.05;
    V(s)=normrnd(mu,sigma);
end
  
Timedelta=[0,240]; %Time interval in which the script simulates the system

%Allows to set initial conditions of X,Y,Z for all cells (not only if N=2.
Initial=zeros(1,N*4);
for u=1:N
    Initial(1+(u-1)*4)=0;
    Initial(2+(u-1)*4)=0;
    Initial(3+(u-1)*4)=3;
    Initial(4+(u-1)*4)=0;
end

options=odeset('RelTol',1e-6);

C=1; %Coupling strength
A=ones(N);

%Simulates the system
[T,Y]=ode45(DifferentialSystemC_2(N,C,V,A),Timedelta,Initial,options);

figure();
subplot(1,2,1);
P=zeros(Width,Length);
for c1=1:Width
    for c2=1:Length
        coord=c2+(c1-1)*Length;
        Xcoord=Y(end,1+(coord-1)*4);
        P(c1,c2)=Xcoord;
        
    end
end
imagesc(P);
caxis([0.0,0.35]);
clb=colorbar;
title(['Xvalues with correlation matrix full of ones at T=' num2str(Timedelta(2)) '.']);
ylabel('x: Width');
xlabel('y: Length');
clb.Label.String = 'Concentration of X (in nM)';

subplot(1,2,2);
for t=1:N
    
    plot(T,Y(:,1+((t-1)*4)),'-')
    title(['Evolution of X1, X2 etc over time with K=' num2str(C) '.']);
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    grid on;
    hold on;
    
end

    




    
