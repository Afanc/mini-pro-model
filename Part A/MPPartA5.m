%Periodogram Part A

clear all;
close all;

Timedelta=[0,1000]; %Time interval in which the script simulates the system
Initial=[0.1640,0.3312,1.8141]; %Initial conditions of the system
%Initial=[0,0,0];

options=odeset('RelTol',1e-4,'AbsTol',[1e-4,1e-4,1e-4]);

v1i=0.7;

[T,Y]=ode45(MPdiffeqA(v1i),Timedelta,Initial,options);


sizemaxY=size(Y(:,1));
sizehalfY=round(sizemaxY*0.9);
[pxx,w]=periodogram(Y(sizehalfY(1):sizemaxY(1),1));
[pxy,u]=periodogram(Y(sizehalfY(1):sizemaxY(1),2));
[pxz,p]=periodogram(Y(sizehalfY(1):sizemaxY(1),3));
%sizemaxP=size(pxx(:,1));
%sizehalfP=round(sizemaxP*0.01);
%xIndex=find(pxx==max(pxx(sizehalfP(1):sizemaxP(1))),1,'first');
xIndex=find(pxx==max(pxx),1,'first');
maxXValue=w(xIndex);
figure()
hold on;
plot(w,pxx);
plot(u,pxy);
plot(p,pxz);
grid on;
figure()
plot3(Y(sizehalfY(1):sizemaxY(1),1),Y(sizehalfY(1):sizemaxY(1),2),Y(sizehalfY(1):sizemaxY(1),1));
grid on;
Omega=maxXValue*10
Period=(2*pi)/Omega
