%Part B.1 of mini-projet

clear all;
close all;

N=2;

V=[1, 1.15];

Timedelta=[0,3000]; %Time interval in which the script simulates the system
Initial=zeros(1,N*4);

for u=1:N
    Initial(3+(u-1)*4)=3;
end

options=odeset('RelTol',1e-4);
Kvector=0:0.05:1.5;
sizeK=size(Kvector);
xmax=zeros(N,sizeK(2));
xmin=zeros(N,sizeK(2));

for K=1:sizeK(2)
   
    C=Kvector(K);
    [T,Y]=ode45(MPdiffeqB(N,C,V),Timedelta,Initial,options);
    
    for t=1:N
    
        sizemax=size(Y(:,1));
        sizehalf=round(sizemax*0.9);
        xmax(t,K)=max(Y(sizehalf(1):sizemax(1),1+(t-1)*4));
        xmin(t,K)=min(Y(sizehalf(1):sizemax(1),1+(t-1)*4));
        
    end
end

for h=1:N
        plot(Kvector,xmax(h,:),Kvector,xmin(h,:));
        legend(['xmax L=' num2str(V(h)) ]);
        hold on
end

        title('XXX');
        xlabel('C');
        ylabel('xmin,xmax');
        grid on