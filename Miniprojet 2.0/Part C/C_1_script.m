%Part C1 of the mini-projet

clear all;
close all;

C=1.5; %Coupling strength

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
  
Timeend=2000;
Timedelta=[0,Timeend]; %Time interval in which the script simulates the system

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
[T,Y]=ode45(DifferentialSystemC(N,C,V),Timedelta,Initial,options);

figure()    
P=zeros(Width,Length);
for c1=1:Width
    for c2=1:Length
        coord=c2+(c1-1)*Width;
        Xcoord=Y(end,1+(coord-1)*4);
        P(c1,c2)=Xcoord;
        
    end
end
imagesc(P);
caxis([0.0,0.3]);
clb=colorbar;
title(['X values, K=' num2str(C) ', N=' num2str(N) ', T=' num2str(Timeend) '.']);
ylabel('x: Width');
xlabel('y: Length');
clb.Label.String = 'Concentration of X (in nM)';

    




    
