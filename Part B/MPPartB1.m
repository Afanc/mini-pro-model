%Part B.1 of mini-projet

clear all;
close all;

N=2;
C=1.5;
V=[1,1.2];
  
Timedelta=[0,20000]; %Time interval in which the script simulates the system
Initial=[0,0,1,0,0,0,1.5,0];
%for u=1:N
%    Initial(3+(u-1)*4)=3;
%end

options=odeset('RelTol',1e-6);

[T,Y]=ode45(MPdiffeqB(N,C,V),Timedelta,Initial,options);

for t=1:N
    
    plot(T,Y(:,1+((t-1)*4)),'-')
    title('Evolution of X1, X2 etc over time');
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    grid on;
    hold on;
    
end


    plot(Y(:,1+(p-1)*4),Y
