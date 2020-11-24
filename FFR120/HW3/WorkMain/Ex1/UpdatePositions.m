function  updatedParticles = UpdatePositions(particles, omega, Dt, Dr)

updatedParticles = particles;
nrOfParticles = size(particles,1);

for i = 1:nrOfParticles
    
    wPhi = normrnd(0,1);
    wX = normrnd(0,1);
    wY = normrnd(0,1);
    
    currentX = particles(i,1);
    currentY = particles(i,2);
    v = particles(i,3);
    currentPhi = particles(i,4);
    
    updatedParticles(i,1) = currentX + v*cos(currentPhi)+(sqrt(2*Dt) * wX);
    updatedParticles(i,2) = currentY + v*sin(currentPhi)+(sqrt(2*Dt)*wY);
    updatedParticles(i,4) = currentPhi + omega + sqrt(2*Dr)*wPhi;
end
end

