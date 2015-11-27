%Part B.1 of mini-projet

clear all;
close all;

N=100;
C=1.5;
V=zeros(1,N);

for s=1:N
    
V(s)=normrnd(1,0.05);

end

plot(V);
  
Timedelta=[0,120]; %Time interval in which the script simulates the system
Initial=zeros(1,N*4);

for u=1:N
    Initial(3+(u-1)*4)=3;
end

options=odeset('RelTol',1e-6);

[T,Y]=ode45(MPdiffeqB(N,C,V),Timedelta,Initial,options);

for t=1:N
    
    plot(T,Y(:,1+((t-1)*4)),'-')
    title(['Evolution of X1, X2 etc over time with K=' num2str(C) '.']);
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    grid on;
    hold on;
    
end


    
