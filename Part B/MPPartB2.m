%Part B.1 of mini-projet

clear all;
close all;

N=2;

V=[1, 1.15];

Timedelta=[0,2000]; %Time interval in which the script simulates the system
Initial=zeros(1,N*4);

for u=1:N
    Initial(3+(u-1)*4)=3;
end

options=odeset('RelTol',1e-4);


for K=1:15
C=0.0+(K-1)*0.1;
[T,Y]=ode45(MPdiffeqB(N,C,V),Timedelta,Initial,options);
figure();
for t=1:N
    
    %plot(T(2000:4000),Y(2000:4000,(1+((t-1)*4))),'-')
    plot(T,Y(:,(1+((t-1)*4))),'-')
    title(['Evolution of X1 and X2 etc over time for C=' num2str(C)]);
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    legend('L=1','L=1.15')
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
end