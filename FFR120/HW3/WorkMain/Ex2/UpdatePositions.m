function  [distances, updatedParticles] = UpdatePositions(particles, eta, gridSize, T0)

updatedParticles = particles;
nrOfParticles = size(particles,1);
distances = zeros(nrOfParticles,nrOfParticles);

etaMin = -eta/2;
etaMax = eta/2;
rXi = (etaMax-etaMin).*rand(nrOfParticles) + etaMin;

for i = 1:nrOfParticles
    
    currentX = particles(i,1);
    currentY = particles(i,2);
    v = particles(i,3);
    currentDir = particles(i,4);
    
    xi = rXi(i);
    
    [pDists, torque] = Torque(particles, i, T0);
    distances(:,i) = pDists;
    
    newDir = currentDir + torque + xi; %xi is noice 
    newX = currentX + v*cos(newDir);
    newY = currentY + v*sin(newDir);
    
    if newX > gridSize
        newX = 1;
    end
    
    if newX < 1
        newX = gridSize;
    end
    
    if newY > gridSize
        newY = 1;
    end
    
    if newY < 1
        newY = gridSize;
    end
    
    updatedParticles(i,1) = newX;
    updatedParticles(i,2) = newY;
    updatedParticles(i,4) = newDir;
    
end
end

