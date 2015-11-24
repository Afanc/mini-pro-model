function [  ] = periodicity( x,t )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

[pxx,w]=periodogram(x,t);
%xIndex=find(pxx==max(pxx),1,'first');
%maxXValue=w(xIndex);
figure();
frequencyscale=w;
plot(frequencyscale,pxx);
xlabel('frequency w');
ylabel('power')

%periodscale=2.*pi./w;
%plot(periodscale,pxx);
%Omega=maxXValue*10;
sizew=size(w);
normalization=0;
Omega=0;
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
        


%Omega=w(windex)*10;
Period=1/Omega;
title(['Periodogram with T=' num2str(Period) 'h and w=' num2str(Omega) 'per hour.']);
end

