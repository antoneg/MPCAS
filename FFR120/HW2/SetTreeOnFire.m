function  updatedLocationStatus = SetTreeOnFire(locationStatus, nrOfLocations, gridSize, f)
%(locationStatus, treeLocations, gridSize, f);
updatedLocationStatus = locationStatus;
r = rand;
if r < f
    randLoc = randi([1, nrOfLocations], 1,1);
    status = locationStatus(randLoc);
    if status == 1 % is a tree
%         updatedLocationStatus(randLoc,2) = 2;         
       updatedLocationStatus = BurnNeighbours(updatedLocationStatus, randLoc, gridSize);
    end
end
end