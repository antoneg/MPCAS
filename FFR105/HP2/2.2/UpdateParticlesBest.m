function newParticleBestList = UpdateParticlesBest(particleBestList, evalList)
newParticleBestList = particleBestList;
for i = 1:(size(particleBestList,1))
    
    currentBest = particleBestList(i,3);
    currentVal = evalList(i,3);
    
    if(currentVal < currentBest)
        newParticleBestList(i,1) = evalList(i,1);
        newParticleBestList(i,2) = evalList(i,2);
        newParticleBestList(i,3) = evalList(i,3);
    end
end
end