
function df= MPdiffeqB(N,C,V)

%MPdiffeqA contains the differential equation system of part A

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
K=C;
L=V;

oscillators=N;

df=@nestedB;

    function dy=nestedB(t,y)
    dy= zeros(oscillators*4,1);
    
    F=0;
    for j=1:oscillators
        F=F+y(j*4);
    end
    F=F/oscillators;
    
    for i=1:oscillators
    i1=1+((i-1)*4);
    i2=2+((i-1)*4);
    i3=3+((i-1)*4);
    i4=4+((i-1)*4);
    
    dy(i1)=    L(i)*(((v1 * K1^4) / (K1^4 + y(i3)^4)) - ((v2 * y(i1))/(K2+y(i1))+((vc*K*F)/(Kc+(K*F)))));
    dy(i2)=    L(i)*((k3*y(i1))   -   ((v4*y(i2))/(K4+y(i2))));
    dy(i3)=    L(i)*((k5*y(i2))   -   ((v6*y(i3))/(K6+y(i3))));
    dy(i4)=    L(i)*((k7*y(i1))   -   ((v8*y(i4))/(K8+y(i4))));
    
    end

    end
end


