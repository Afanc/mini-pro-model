%Part C1 of the mini-projet

clear all;
close all;

%Initializes positions of the cells and their number
Width=10;
Length=14;
N=Width*Length;
Position=zeros(2,N);
for counter1=1:Width
    for counter2=1:Length
        Position(1,counter2+(counter1-1)*Length)=counter1;
        Position(2,counter2+(counter1-1)*Length)=counter2;
    end
end
        
%Initialization of periods around mu with sigma standard deviation
V=zeros(1,N); 
for s=1:N
    mu=1;
    sigma=0.05;
    V(s)=normrnd(mu,sigma);
end
  
Timedelta=[0,240]; %Time interval in which the script simulates the system

%Allows to set initial conditions of X,Y,Z for all cells (not only if N=2.
Initial=zeros(1,N*4);
for u=1:N
    Initial(1+(u-1)*4)=0;
    Initial(2+(u-1)*4)=0;
    Initial(3+(u-1)*4)=3;
    Initial(4+(u-1)*4)=0;
end

options=odeset('RelTol',1e-6);

C=1.5; %Coupling strength
for prob=1:6
Probability=0.2*(prob-1);
A=zeros(N);
for ce=1:N
for ec=1:N
    hashtag=rand;
    if hashtag <= Probability
        A(ce,ec)=1;
    end
end
end

%Simulates the system
[T,Y]=ode45(DifferentialSystemC_2(N,C,V,A),Timedelta,Initial,options);

%Makes a gif
figure();
filename = ['C_2_gif_4_' num2str(Probability*10) '.gif'];
sizeT=size(T);
stepsize=10;
for time=1:stepsize:sizeT
    
P=zeros(Width,Length);
for c1=1:Width
    for c2=1:Length
        coord=c2+(c1-1)*Length;
        Xcoord=Y(time,1+(coord-1)*4);
        P(c1,c2)=Xcoord;   
    end
end
imagesc(P);
caxis([0.0,0.4]);
clb=colorbar;
title(['Visualisation of the X values of ' num2str(N) ' cells with P=' num2str(Probability) '.']);
ylabel('x: Width');
xlabel('y: Length');
clb.Label.String = 'Concentration of X (in nM)';
drawnow
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
if time == 1;
    imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
else
    imwrite(imind,cm,filename,'gif','WriteMode','append');
end
        
end

figure();
for t=1:N
    
    plot(T,Y(:,1+((t-1)*4)),'-')
    title(['Evolution of X1, X2 etc over time with P=' num2str(Probability) '.'] );
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    grid on;
    hold on;
    
end

    


end

    
