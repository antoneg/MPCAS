function updatedParticles = RemoveOverlaps(particles, distances, R)
updatedParticles = particles;
nrOfParticles = size(particles, 1);

for p = 1:nrOfParticles
    
    pDists = distances(p,:);
    
    for i = 1:nrOfParticles
        d = pDists(i);
        if (d < (2*R)) && (p ~= i) 
            pFrom = p;
            pTo = i;
            
            pFromX = updatedParticles(pFrom,1);
            pFromY = updatedParticles(pFrom,2);
            
            pToX = updatedParticles(pTo,1);
            pToY = updatedParticles(pTo,2);
                        
            %First for the pfrom
            xDif = pToX - pFromX;
            yDif = pToY - pFromY;
                                  
            newX = pFromX - ((2*R - d)*xDif/d)/2;
            newY = pFromY - ((2*R - d)*yDif/d)/2;
            updatedParticles(p,1) = newX;
            updatedParticles(p,2) = newY;
            
            %Then do the same for fTo.
            xDif = -xDif;
            yDif = -yDif;
            
            newX = pToX - ((2*R - d)*xDif/d)/2;
            newY = pToY - ((2*R - d)*yDif/d)/2;
            updatedParticles(i,1) = newX;
            updatedParticles(i,2) = newY;
            
        end

    end   
    
end

end