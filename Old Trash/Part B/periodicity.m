function [ Period, Omega ] = periodicity( t,x )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

%Timescale
sizet=size(t);
st=max(sizet);
fs=t(st)/st;

%Periodogram creation
[pxx,w]=periodogram(x,t);

%Parameter initialization
sizew=size(w);
normalization=0;
Omega=0;
powercheck=0;

%Finds highest peak
for k=2:(sizew-1)
    if pxx(k)>= pxx(k-1) && pxx(k) <= pxx(k+1) && pxx(k) >= powercheck
        powercheck=pxx(k);
        windex=k;
    end
end

%Integrates a little bit around the highest peak to find normalization
space=round(windex/5);
for l=(windex-space):(windex+space)
    normalization=normalization+pxx(l);
end

%Weighted average
for m=(windex-space):(windex+space)
    Omega=Omega+w(m)*(pxx(m)/normalization);
end
 
%Calculates period and draws graphs
frequencyscale=w./fs;
Omega=Omega/fs;
Period=2*pi/Omega;

figure();
plot(frequencyscale,pxx);
xlim([Omega-(Omega/5),(Omega+Omega/5)]);
title(['Periodogram with T=' num2str(Period) 'h and w=' num2str(Omega) 'per hour.']);
xlabel('frequency w');
ylabel('power')

end

