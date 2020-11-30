function  [distances, updatedParticles] = UpdatePositions(particles, eta, gridSize, T0, Rc, acPsRatio)

updatedParticles = particles;
nrOfParticles = size(particles,1);
distances = zeros(nrOfParticles,nrOfParticles);
nrOfActive = ceil(acPsRatio*nrOfParticles);

etaMin = -eta/2;
etaMax = eta/2;
rXi = (etaMax-etaMin).*rand(nrOfParticles) + etaMin;

for i = 1:nrOfParticles
    
    currentX = particles(i,1);
    currentY = particles(i,2);
    v = particles(i,3);
    currentDir = particles(i,4);
    particleType = particles(i,5);
    currDists = GetDistances(particles, i);
    distances(:,i) = currDists;
    if (particleType == 1) %Is active
        xi = rXi(i);      
        torqueAc = Torque(particles(1:nrOfActive,:), i, T0, Rc);
        torqueRe = Torque(particles(nrOfActive+1:nrOfParticles,:), i, T0, Rc);
        newDir = currentDir + (torqueAc - torqueRe)  + xi; %xi is noice
        newX = currentX + v*cos(newDir);
        newY = currentY + v*sin(newDir);
    else
        newDirX = 0.1*v*(-1+2*rand(1,1));
        newDirY = 0.1*v*(-1+2*rand(1,1));
        newX = currentX + newDirX;
        newY = currentY + newDirY;
    end
   
    if newX > gridSize
        newX = 1 + rand;
    end
    
    if newX < 1
        newX = gridSize - rand;
    end
    
    if newY > gridSize
        newY = 1 + rand;
    end
    
    if newY < 1
        newY = gridSize - rand;
    end
    
    updatedParticles(i,1) = newX;
    updatedParticles(i,2) = newY;
    updatedParticles(i,4) = newDir;
    
end
end

