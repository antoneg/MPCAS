function updatedLocationStatus = SetTreeOnFire(locationStatus, nrOfLocations, f)
updatedLocationStatus = locationStatus;
r = rand;
if r < f
    randLoc = randi([1, nrOfLocations], 1,1);
    status = locationStatus(randLoc,2);
    if status == 1 % is a tree
        updatedLocationStatus(randLoc,2) == 2;         
        updatedLocationStatus = BurnNeighbours(updatedLocationStatus, randLoc);
    end
end
end