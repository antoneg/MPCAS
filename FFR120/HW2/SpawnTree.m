function updatedLocationStatus = SpawnTree(locationStatus, emptyLocations, p)

updatedLocationStatus = locationStatus;
nrOfEmptyLocations = size(emptyLocations,1);
for i = 1:nrOfEmptyLocations
    loc = emptyLocations(i);
    r = rand;
    if r < p
        updatedLocationStatus(loc) = 1;
    end
end
% rp = rand;
% if rp < p
%     indx = randi([1,nrOfEmptyLocations],1,1);
%     randLoc = emptyLocations(indx);
%     updatedLocationStatus(randLoc,2) = 1;
% end
end