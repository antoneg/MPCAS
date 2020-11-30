function torque  = Torque(particles, pIndx, T0, Rc)

eHat = [0;0;1];
nrOfParticles = size(particles,1);

xPos = particles(pIndx,1);
yPos = particles(pIndx,2);

dir = particles(pIndx,4);
xDir = cos(dir);
yDir = sin(dir);

vHat = [xDir; yDir; 0];

sumTot = 0;
for i = 1:size(particles,1)
    relVec = [];
    if i ~= pIndx
        xRel = particles(i,1);
        yRel = particles(i,2);
        
        relVec(1) = xRel - xPos;
        relVec(2) = yRel - yPos;
        d = norm(relVec);
        
        if d <= Rc
        normRelX = relVec(1)/d;
        normRelY = relVec(2)/d;
        
        fac1 = dot(vHat, [normRelX; normRelY;0]);
        fac1 = (fac1./(d^2)); %hm
        
        fac2 = cross(vHat, [normRelX;normRelY;0]);
        fac2 = dot(fac2,  eHat);
        sumTot = sumTot + fac1*fac2;
        end
    end
end
torque = T0*sumTot;
end