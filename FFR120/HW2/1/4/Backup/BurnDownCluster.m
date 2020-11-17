function updatedLocationStatus = BurnDownCluster(fireLocations, locationStatus)
updatedLocationStatus = locationStatus;
clusterSize = size(fireLocations, 1);
for i = 1:clusterSize
    loc = fireLocations(i);
    updatedLocationStatus(loc,2) = 0;
end
end