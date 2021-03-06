%Part BN2 of the mini-projet

clear all;
close all;

N=100; %Number of cells
C=1.5; %coupling strength

%Initialization of periods around mu with sigma standard deviation
V=zeros(1,N); 
for s=1:N
    mu=1;
    sigma=0.05;
    V(s)=normrnd(mu,sigma);
end
  
Timedelta=[0,1000]; %Time interval in which the script simulates the system
options=odeset('RelTol',1e-6);

%Allows to set initial conditions of X,Y,Z for all cells (not only if N=2.
Initial=zeros(1,N*4);
for u=1:N
    Initial(1+(u-1)*4)=0;
    Initial(2+(u-1)*4)=0;
    Initial(3+(u-1)*4)=3;
    Initial(4+(u-1)*4)=0;
end

%Simulates the system
[T,Y]=ode45(DifferentialSystemB(N,C,V),Timedelta,Initial,options);

%Calculates R
sizeTe=size(T);
sizeT=sizeTe(1);
Ves=zeros(sizeT,N);
for b=1:N
    Ves(:,b)=Y(:,4+(b-1)*4);
end

Fes=zeros(sizeT,1);
for z=1:size(T)
    for q=1:N
        Fes(z)=Fes(z)+Y(z,4+(q-1)*4);
    end
    Fes(z)=Fes(z)/N;
end    

meanfsq=0;
meanf=0;
for d=1:sizeT
    meanfsq=meanfsq+(Fes(d)^2);
    meanf=meanf+Fes(d);
end
meanfsq=meanfsq/sizeT;
meanf=meanf/sizeT;

meanVsq=zeros(1,N);
meanV=zeros(1,N);
for r=1:N
    for e=1:sizeT
        meanVsq(r)=meanVsq(r)+(Ves(e,r)^2);
        meanV(r)=meanV(r)+Ves(e,r);
    end
end
meanVsq=meanVsq/sizeT;
meanV=meanV/sizeT;

denominator=0;
for a=1:N
    denominator=denominator+meanVsq(a)-(meanV(a)^2);
end
denominator=denominator/N;

numerator=meanfsq-meanf.^2;

R=numerator/denominator;

%Plots X values over times and gives K and R values
for t=1:N
    
    plot(T,Y(:,1+((t-1)*4)),'-')
    hold on;
  
end

title(['Evolution of X1, X2 etc over time with K=' num2str(C) ' and R=' num2str(R) '.']);
xlabel('Time[h]');
ylabel('Amount in [nM]');
grid on;
    






    
