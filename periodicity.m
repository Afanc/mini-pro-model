function [ Omega,Period ] = periodicity( x,t )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[pxx,w]=periodogram(x,t);
xIndex=find(pxx==max(pxx),1,'first');
maxXValue=w(xIndex);
figure();
plot(w,pxx);
Omega=maxXValue*10;
Period=(2*pi)/Omega;

end

