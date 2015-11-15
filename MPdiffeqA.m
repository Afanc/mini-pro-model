
function df= MPdiffeqA(v1i)

%MPdiffeqA contains the differential equation system of part A

v1=v1i;
v2=0.35;
v4=0.35;
v6=0.35;
K1=1;
K2=1;
K4=1;
K6=1;
k3=0.7;
k5=0.7;

df=@nested;

    function dy=nested(t,y)
    dy= zeros(3,1);
    dy(1)= ((v1 * K1^4) / (K1^4 + y(3)^4)) - ((v2 * y(1))/(K2+y(1)));
    dy(2)= (k3*y(1)) - ((v4*y(2))/(K4+y(2)));
    dy(3)= (k5*y(2)) - ((v6*y(3))/(K6+y(3)));
    end

end

