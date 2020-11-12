function updatedLocationStatus = SpawnTree(locationStatus, emptyLocations, p)

updatedLocationStatus = locationStatus;
nrOfEmptyLocations = size(emptyLocations,1);

    rp = rand;
    if rp < p
       indx = randi([1,nrOfEmptyLocations],1,1);
       randLoc = emptyLocations(indx);
       updatedLocationStatus(randLoc,2) = 1;     
    end
end