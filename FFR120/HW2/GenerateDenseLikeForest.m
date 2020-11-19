%Recreate dense like forests and set them on fire---------
function recreatedClusters = GenerateDenseLikeForest(fileName, gridSize)

data = load(fileName);
allTrees = data.plotData(:,2);


nrOfPreClusters = size(allTrees, 1);
nrOfLocations = gridSize^2;
recreatedClusters = zeros(nrOfPreClusters, 1);
allTrees = sort(allTrees);

for i = 1:nrOfPreClusters
    forestDensityProb = (allTrees(i)/(gridSize^2));
     locationStatus = zeros(nrOfLocations,1); %0 empty, 1, tree, 2 fire
%      locationStatus(1:nrOfLocations,1) = [1:nrOfLocations];
    
    %Initialize forest
    for l = 1:nrOfLocations
        r = rand;
        if r < forestDensityProb
            locationStatus(l) = 1;
        else
            locationStatus(l) = 0;
        end
    end
    
    %Get list of treeLocations

    [emptyLocations, treeLocations, fireLocations] = TrimStatusList(locationStatus);
    
    %Select a random tree to strike
   
    nrCompTrees = size(treeLocations, 1);
    
    rIndx = randi([1, nrCompTrees],1,1);
    strikeLoc = treeLocations(rIndx);
    
    %Burn cluster of trees and retrieve the size of the cluster
    locationStatus = BurnNeighbours(locationStatus, strikeLoc, gridSize);
    clusterSize = 0;
    
    for j = 1:size(locationStatus,1)
        if locationStatus(j) == 2
            clusterSize = clusterSize + 1; 
        end
    end

    recreatedClusters(i) = clusterSize;
    disp([num2str((i/nrOfPreClusters)*100) '% completed'])
end
end