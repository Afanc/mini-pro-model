function [ Omega,Period ] = periodicity( x,t )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[pxx,w]=periodogram(x,t);
%xIndex=find(pxx==max(pxx),1,'first');
%maxXValue=w(xIndex);
figure();
plot(w,pxx);
%Omega=maxXValue*10;
sizew=size(w);
normalization=0;
Omega=0;
Maximum=max(pxx);
threshold=Maximum/100; %Another way of cleaning up the signal
cheating=1; %A measure of the amount of noise you expect in the signal. Still work in progress
for j=1:sizew
    if pxx(j)>= threshold
    normalization=normalization+(pxx(j)^cheating);
    end
end

for i=1:sizew
    if pxx(i)>=threshold
    Omega=Omega+w(i)*((pxx(i)^cheating)/normalization);
    end
end

Omega=Omega*10;
Period=(2*pi)/Omega;
title(['Periodogram with T=' num2str(Period) ' and w=' num2str(Omega) '.']);
end

