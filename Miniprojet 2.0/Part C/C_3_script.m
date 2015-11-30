%Part C1 of the mini-projet

clear all;
close all;

%Initializes positions of the cells and their number
Width=10;
Length=10;
N=Width*Length;

        
%Initialization of periods around mu with sigma standard deviation
V=zeros(1,2*N); 
lambdamin=0.9;
lambdamax=1.1;
lambdavector=linspace(lambdamin,lambdamax,Length);
Lambdurr=1.15;
for clic=1:Width
    for clic2=1:Length
        mu=lambdavector(clic2);
        sigma=0.02;
        V(clic2+(clic-1)*Length)=normrnd(mu,sigma);
        V(N+clic2+(clic-1)*Length)=normrnd(Lambdurr*mu,sigma);
    end
end

Timedelta=[0,180]; %Time interval in which the script simulates the system

%Allows to set initial conditions of X,Y,Z for all cells (not only if N=2.
Initial=zeros(1,2*N*4);
for u=1:2*N
    Initial(1+(u-1)*4)=0;
    Initial(2+(u-1)*4)=0;
    Initial(3+(u-1)*4)=3;
    Initial(4+(u-1)*4)=0;
end

options=odeset('RelTol',1e-6);

C=1.5; %Coupling strength

A=zeros(N); %Coupling matrix
Ainter=ones(N);

A=zeros(N); %Coupling matrix
for cN1=1:N
    for cN2=1:N
        g=cN1-cN2;
        f=cN2-cN1;
        if ((floor((cN1-1)/Length)+1)/(floor((cN2-1)/Length)+1)) == 1

            if cN1==cN2 || f==1 || g==1 || f==Length || g==Length 
                A(cN1,cN2)=1;
            end
        else
            if cN1==cN2 || f==Length || g==Length
                A(cN1,cN2)=1;
            end
        end
    end
end


%Simulates the system
[T,Y]=ode45(DifferentialSystemC_3(N,C,V,A,Ainter),Timedelta,Initial,options);

%Makes a gif
figure();
filename = 'C_2_gif_6.gif';
sizeT=size(T);
stepsize=5;
for time=1:stepsize:sizeT
    
P1=zeros(Width,Length);
for c1=1:Width
    for c2=1:Length
        coord=c2+(c1-1)*Length;
        Xcoord=Y(time,1+(coord-1)*4);
        P1(c1,c2)=Xcoord;   
    end
end
subplot(2,1,1);
imagesc(P1);
caxis([0.0,0.5]);
clb=colorbar;
title(['Population 1 with ' num2str(N) ' cells and Lambda=1.']);
ylabel('x: Width');
xlabel('y: Length');
clb.Label.String = 'Concentration of X (in nM)';

P2=zeros(Width,Length);
for c3=1:Width
    for c4=1:Length
        coord=c4+(c3-1)*Length;
        Xcoord=Y(time,1+(N+coord-1)*4);
        P2(c3,c4)=Xcoord;   
    end
end

subplot(2,1,2);
imagesc(P2);
caxis([0.0,0.5]);
clb2=colorbar;
title(['Population 2 with ' num2str(N) ' cells and Lambda=' num2str(Lambdurr) '.']);
ylabel('x: Width');
xlabel('y: Length');
clb2.Label.String = 'Concentration of X (in nM)';


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
    title(['Evolution of X1, X2 etc over time'] );
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    grid on;
    hold on;
    
end


figure();
for t=N+1:2*N
    
    plot(T,Y(:,1+((t-1)*4)),'-')
    title(['Evolution of X1, X2 etc over time'] );
    xlabel('Time[h]');
    ylabel('Amount in [nM]');
    grid on;
    hold on;
    
end