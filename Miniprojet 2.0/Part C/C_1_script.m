%Part C1 of the mini-projet

clear all;
close all;

C=0; %Coupling strength

%Initializes positions of the cells and their number
Width=10;
Length=14;
N=Width*Length;
Position=zeros(2,N);
for counter1=1:Width
    for counter2=1:Length
        Position(1,counter2+(counter1-1)*Length)=counter1;
        Position(2,counter2+(counter1-1)*Length)=counter2;
    end
end
        
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

%Simulates the system
[T,Y]=ode45(DifferentialSystemC(N,C,V),Timedelta,Initial,options);

figure()    
C=zeros(Width,Length);
for c1=1:Width
    for c2=1:Length
        coord=c2+(c1-1)*Width;
        Xcoord=Y(end,1+(coord-1)*4);
        C(c1,c2)=Xcoord;
        
    end
end
imagesc(C);
clb=colorbar;
title(['Visualisation of the X values of ' num2str(N) ' cells at end of simulation']);
ylabel('x: Width');
xlabel('y: Length');
clb.Label.String = 'Concentration of X (in nM)';

    




    
