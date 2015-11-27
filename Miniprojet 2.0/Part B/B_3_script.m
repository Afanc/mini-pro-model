%Part B3 of mini-projet

clear all;
close all;

N=2; %Number of cells

V=[1, 1.5]; %Period vector

Timedelta=[0,5000]; %Time interval in which the script simulates the system
options=odeset('RelTol',1e-4);

%Allows to set initial conditions of X,Y,Z for all cells (not only if N=2.
Initial=zeros(1,N*4);
for u=1:N
    Initial(1+(u-1)*4)=0;
    Initial(2+(u-1)*4)=0;
    Initial(3+(u-1)*4)=3;
    Initial(4+(u-1)*4)=0;
end

%K varies from 0 to 1.5
Kvector=0:0.05:1.5;
sizeK=size(Kvector);

%Initializes xmax and xmin vectors
xmax=zeros(N,sizeK(2));
xmin=zeros(N,sizeK(2));

for K=1:sizeK(2)
   
    C=Kvector(K);
    
    %Simulates the system
    [T,Y]=ode45(DifferentialSystemB(N,C,V),Timedelta,Initial,options);
    
    for t=1:N
        
        %xmin and xmax in the last tenth of the simulation
        cutoff=0.9;
        sizemax=size(Y(:,1));
        sizecutoff=round(sizemax*cutoff);
        xmax(t,K)=max(Y(sizecutoff(1):sizemax(1),1+(t-1)*4));
        xmin(t,K)=min(Y(sizecutoff(1):sizemax(1),1+(t-1)*4));
        
    end
    
end

for h=1:N
        plot(Kvector,xmax(h,:),Kvector,xmin(h,:));
        hold on
end
        legend(['xmax L=' num2str(V(1))],['xmin L=' num2str(V(1))],['xmax L=' num2str(V(2))],['xmin L=' num2str(V(2))]);
        title('Bifurcation diagram for varying K');
        xlabel('Coupling constant K');
        ylabel('xmin,xmax');
        grid on