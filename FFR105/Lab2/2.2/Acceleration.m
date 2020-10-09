function a = Acceleration(cohesion, alignment, seperation, numbOfBoids,cConsts)
    cConsts(1) = cC;
    cConsts(2) = cL;
    cConsts(3) = cS;
    for i = 1:numbOfBoids
        a(i) = cC*cohesion(i) + cL*alignment(i) + cS*seperation(i);
    end
end