%Part B.1 of mini-projet

clear all;
close all;

N=2;
C=0;
V=[1, 12];

Timedelta=[0,1000]; %Time interval in which the script simulates the system
Initial=zeros(1,N*4);

options=odeset('RelTol',1e-4);

[T,Y]=ode45(MPdiffeqB(N,C,V),Timedelta,Initial,options);

for t=1:N
    
    %plot(T(2000:4000),Y(2000:4000,(1+((t-1)*4))),'-')
    plot(T,Y(:,(1+((t-1)*4))),'-')
    title('Evolution of X1, X2 etc over time');
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    grid on;
    hold on;
    
    %figure();
    %plot3(Y(:,(1+((t-1)*4))),Y(:,(3+((t-1)*4))),Y(:,(4+((t-1)*4))));
    %title('X,Z & V as a function of each other');
    %xlabel('X');
    %ylabel('Z');
    %zlabel('V');
    %hold on;
    %grid on;
    
end
