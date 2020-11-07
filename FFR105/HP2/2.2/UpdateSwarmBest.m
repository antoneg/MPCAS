function newSwarmBest = UpdateSwarmBest(particleBestList, swarmBest)
newSwarmBest = swarmBest;
for i = 1:(size(particleBestList,1))
    
    particlesBest = particleBestList(i,3);
    globalBest = newSwarmBest(1,3);
    if(particlesBest < globalBest)
        newSwarmBest(1,1) = particleBestList(i,1);
        newSwarmBest(1,2) = particleBestList(i,2);
        newSwarmBest(1,3) = particlesBest;
    end
end
end