function [distances ,torque]  = Torque(particles, pIndx, T0, Rc)

eHat = [0;0;1];
nrOfParticles = size(particles,1);
distances = zeros(nrOfParticles,1);

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
        dist = norm(relVec);
        distances(i) = dist;
        
        if dist <= Rc
            normRelX = relVec(1)/dist;
            normRelY = relVec(2)/dist;
            
            fac1 = dot(vHat, [normRelX; normRelY;0]);
            fac1 = (fac1./(dist^2)); %hm
            
            fac2 = cross(vHat, [normRelX;normRelY;0]);
            fac2 = dot(fac2,  eHat);
            sumTot = sumTot + fac1*fac2;
        end
    else
        distances(i)=0;
    end
end
torque = T0*sumTot;
end