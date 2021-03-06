
function df= DifferentialSystemB(N,C,V)

%DifferentialSystemB contains the differential equation system of part B
%N is the input of how many cells are simulated
%C is the coupling constant
%V is the vector of lambda parameters(determines the periods of the cells.)

%List of relevant parameters that don't need to be given to the function:
v1=0.7;
v2=0.35;
v4=0.35;
v6=0.35;
v8=1;
K1=1;
K2=1;
K4=1;
K6=1;
K8=1;
k3=0.7;
k5=0.7;
k7=0.35;
vc=0.4;
Kc=1;

%Input parameters
K=C;
L=V;
oscillators=N;

%Calls on a nested function to return a functionhandle to ode45
df=@nestedB;

    function dy=nestedB(t,y)
    
        dy= zeros(oscillators*4,1);
    
        %Calculates the average of the V parameter of all the cells.
        F=0;
        for j=1:oscillators
            F=F+y(4+(j-1)*4);
        end
        F=F/oscillators;
 
        %shifts all parameters by 4
        for i=1:oscillators
            i1=1+(i-1)*4;
            i2=2+(i-1)*4;
            i3=3+(i-1)*4;
            i4=4+(i-1)*4;
    
            %the differential equation system
            dy(i1)=    L(i)*(v1*K1^4/(K1^4+y(i3)^4)+vc*K*F/(Kc+K*F)-v2*y(i1)/(K2+y(i1)));
            dy(i2)=    L(i)*(k3*y(i1)-v4*y(i2)/(K4+y(i2)));
            dy(i3)=    L(i)*(k5*y(i2)-v6*y(i3)/(K6+y(i3)));
            dy(i4)=    L(i)*(k7*y(i1)-v8*y(i4)/(K8+y(i4)));
    
        end
    end
end


