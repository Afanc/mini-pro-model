%Part B1 of the mini-projet

clear all;
close all;

N=2; %Number of cells
C=0; %Coupling
V=[1,1.15]; %Periods
  
Timedelta=[0,2000]; %Time interval in which the script simulates the system
options=odeset('RelTol',1e-6);

%Allows to set initial conditions of X,Y,Z for all cells (not only if N=2.
Initial=zeros(1,N*4);
for u=1:N
    Initial(1+(u-1)*4)=0;
    Initial(2+(u-1)*4)=0;
    Initial(3+(u-1)*4)=3;
    Initial(4+(u-1)*4)=0;
end

for k=1:6

V(2)=1+(k-1)*0.2;

[T,Y]=ode45(DifferentialSystemB(N,C,V),Timedelta,Initial,options);

%Plots X1 and X2 as a function of each other
figure()
plot(Y(:,1),Y(:,5)); %X1,X2
title(['X1,X2 with L1=1 and L2=' num2str(V(2)) '.']);
xlabel('Amount of X1 [nM]');
ylabel('Amount of X2 [nM]');
%filename = strcat('B1', num2str(k));
%print(filename, '-dpng');

%Plots X1,X2 over time
figure()
plot(T,Y(:,1),'-r',T,Y(:,5),'-b');
title(['Evolution of X1, X2 over time with L1=1 and L2=' num2str(V(2)) '.']);
xlabel('Time[h]');
ylabel('Amount in [nM]');
legend('X1','X2');
grid on;
%filename = strcat('B2', num2str(k));
%print(filename, '-dpng');

%Plots X1 and Y2 as a function of each other
figure()
plot(Y(:,1),Y(:,6)); 
title(['X1,Y2 with L1=1 and L2=' num2str(V(2)) '.']);
xlabel('Amount of X1 [nM]');
ylabel('Amount of Y2 [nM]');
grid on;
%filename = strcat('B3', num2str(k));
%print(filename, '-dpng');

%Plot X1,Y2 over time
figure()
plot(T,Y(:,1),'-',T,Y(:,6),'-');
title(['Evolution of X1, Y2 over time with L1=1 and L2=' num2str(V(2)) '.']);
xlabel('Time[h]');
ylabel('Amount in [nM]');
legend('X1','Y2');
grid on;    
%filename = strcat('B4', num2str(k));
%print(filename, '-dpng');
    
end

 