function f = FoundationBrakeForce(mass, pressure, brakeTemp, tempMax) 
%9.82 mass/s^2
g = 9.82;
if brakeTemp < (tempMax - 100)
    f = (mass*g*pressure)/20; 
else 
    factor1 = (mass*g*pressure)/20;
    factor2 = (exp^(-(brakeTemp - (tempMax-100)) )/100 ); %Hmm
    f = factor1*factor2;
end
end