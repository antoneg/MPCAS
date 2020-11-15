function [cluster, updatedLocationStatus] = SetTreeOnFire(locationStatus, nrOfLocations, gridSize, f)
%(locationStatus, treeLocations, gridSize, f);
updatedLocationStatus = locationStatus;
cluster = [];
r = rand;
if r < f
    randLoc = randi([1, nrOfLocations], 1,1);
    status = locationStatus(randLoc,2);
    if status == 1 % is a tree
%         updatedLocationStatus(randLoc,2) = 2;         
        [cluster, updatedLocationStatus] = BurnNeighbours(updatedLocationStatus, randLoc, gridSize);
    end
end
end