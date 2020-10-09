function newXsb = UpdateSwarmBest(xPb, xSb)
    newXsb = xSb;
    for i = 1:(size(xPb,1))
        
        particlesBest = xPb(i,3);
        globalBest = newXsb(1,3);
        if(particlesBest < globalBest)
            newXsb(1,1) = xPb(i,1);
            newXsb(1,2) = xPb(i,2);
            newXsb(1,3) = particlesBest;
        end
    end
end