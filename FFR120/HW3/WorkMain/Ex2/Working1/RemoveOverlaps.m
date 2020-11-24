function updatedParticles = RemoveOverlaps(particles, distances, R)
updatedParticles = particles;
nrOfParticles = size(particles, 1);

for p = 1:nrOfParticles
    
    pDists = distances(p,:);
    clusterSize = 1;
    for i = 1:nrOfParticles
        d = pDists(i);
        if (d < R) && (p ~= i)
            clusterSize = clusterSize + 1;
            pFrom = p;
            pTo = i;
            
            pFromX = updatedParticles(pFrom,1);
            pFromY = updatedParticles(pFrom,2);
            
            pToX = updatedParticles(pTo,1);
            pToY = updatedParticles(pTo,2);
            
            
            %First for the pfrom
            xDif = pToX - pFromX;
            yDif = pToY - pFromY;
            
            
            newX = pFromX - xDif/2;
            newY = pFromY - yDif/2;
            updatedParticles(p,1) = newX;
            updatedParticles(p,2) = newY;
            
            %Then do the same for fTo.
            xDif = -xDif;
            yDif = -yDif;
            
            newX = pToX - xDif/2;
            newY = pToY - yDif/2;
            updatedParticles(i,1) = newX;
            updatedParticles(i,2) = newY;
            
        end
        if clusterSize > 3
            disp(num2str(clusterSize));
        end
    end
    
    
end

end