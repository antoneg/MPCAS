function newVelocities = UpdateVelocities(velocities, c1, c2, particleBestList, swarmBest, positions, numbOfBoids, deltaT, vMax, inertiaWeight)
newVelocities = velocities;

numbOfVars = size(velocities,2);

particleBestListTmp = particleBestList(:,1:2);
swarmBestTmp = swarmBest(1,1:2);

for i = 1:numbOfBoids
    for j = 1:numbOfVars
        r = rand;
        q = rand;
        
        term1 = c1*q*  ( ( particleBestListTmp(i,j) - positions(i,j) ) / deltaT );
        term2 = c2*r*  ( ( swarmBestTmp(1,j) - positions(i,j) ) / deltaT );
        
        newVelocities(i,j) = inertiaWeight*velocities(i,j) + term1 + term2;
        if( newVelocities(i,j) > vMax)
            newVelocities(i,j) = vMax;
        end
    end
end
end