%Part B.1 of mini-projet

clear all;
close all;

N=2;
C=0;
V=[1,1];

for k=1:6
    V(2)=1+(k-1)*0.2;
  
Timedelta=[0,500]; %Time interval in which the script simulates the system
Initial=[0,0,3,0,0,0,3,0];
%for u=1:N
%    Initial(3+(u-1)*4)=3;
%end

options=odeset('RelTol',1e-6);

[T,Y]=ode45(MPdiffeqB(N,C,V),Timedelta,Initial,options);

figure()
plot(Y(:,1),Y(:,5)); %X1,X2
title(['X1,X2 with L1=1 and L2=' num2str(V(2)) '.']);
xlabel('Amount of X1 [nM]');
ylabel('Amount of X2 [nM]');
filename = strcat('B1', num2str(k));
print(filename, '-dpng');

    figure()
    plot(T,Y(:,1),'-r',T,Y(:,5),'-b');
    title(['Evolution of X1, X2 over time with L1=1 and L2=' num2str(V(2)) '.']);
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    grid on;
    filename = strcat('B2', num2str(k));
print(filename, '-dpng');

figure()
plot(Y(:,1),Y(:,6)); %X1,X2
title(['X1,Y2 with L1=1 and L2=' num2str(V(2)) '.']);
xlabel('Amount of X1 [nM]');
ylabel('Amount of Y2 [nM]');

filename = strcat('B3', num2str(k));
print(filename, '-dpng');
    figure()
    plot(T,Y(:,1),'-',T,Y(:,6),'-');
    title(['Evolution of X1, Y2 over time with L1=1 and L2=' num2str(V(2)) '.']);
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    grid on;
    
    filename = strcat('B4', num2str(k));
print(filename, '-dpng');
    
end

 