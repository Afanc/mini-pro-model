
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
        
    dy(1+((i-1)*4))=    L(i)*(((v1 * K1^4) / (K1^4 + y(3)^4)) - ((v2 * y(1+((i-1)*4)))/(K2+y(1+((i-1)*4))))+((vc*K*F)/(Kc+(K*F))));
    dy(2+((i-1)*4))=    L(i)*((k3*y(1+((i-1)*4)))   -   ((v4*y(2+((i-1)*4)))/(K4+y(2+((i-1)*4)))));
    dy(3+((i-1)*4))=    L(i)*((k5*y(2+((i-1)*4)))   -   ((v6*y(3+((i-1)*4)))/(K6+y(3+((i-1)*4)))));
    dy(4+((i-1)*4))=    L(i)*((k7*y(1+((i-1)*4)))   -   ((v8*y(4+((i-1)*4)))/(K8+y(4+((i-1)*4)))));
    
    end

    end
end


