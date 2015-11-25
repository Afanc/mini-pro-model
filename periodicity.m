function [ Period, Omega ] = periodicity( t,x )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here


%xIndex=find(pxx==max(pxx),1,'first');
%maxXValue=w(xIndex);
%periodscale=2.*pi./w;
%plot(periodscale,pxx);
%Omega=maxXValue*10;
sizet=size(t);
st=max(sizet);
fs=t(st)/st;

[pxx,w]=periodogram(x,t);
sizew=size(w);
normalization=0;
Omega=0;
Period=0;
%Maximum=max(pxx);
%threshold=Maximum/100; %Another way of cleaning up the signal
%cheating=1; %A measure of the amount of noise you expect in the signal. Still work in progress
%for j=1:sizew
%   if pxx(j)>= threshold
%    normalization=normalization+(pxx(j)^cheating);
%   end
%end

%for i=1:sizew
%    if pxx(i)>=threshold
%    Omega=Omega+w(i)*((pxx(i)^cheating)/normalization);
%    end
%end
powercheck=0;

for k=2:sizew
    if pxx(k)>= pxx(k-1) && pxx(k) <= pxx(k+1) && pxx(k) >= powercheck
        powercheck=pxx(k);
        windex=k;
    end
end

space=round(windex/5);

for l=(windex-space):(windex+space)
    normalization=normalization+pxx(l);
end

for m=(windex-space):(windex+space)
    Omega=Omega+w(m)*(pxx(m)/normalization);
end
 
frequencyscale=w./fs;
Omega=Omega/fs
Period=2*pi/Omega
%Omega=w(windex)*10;

figure();
plot(frequencyscale,pxx);
title(['Periodogram with T=' num2str(Period) 'h and w=' num2str(Omega) 'per hour.']);
xlabel('frequency w');
ylabel('power')

end

