function pathLength = GetPathLength(path,cityLocation)
nrOfNodes = size(cityLocation,1);
pathLength = 0;
for i = 1:(nrOfNodes-1)
    
    fromIndx = path(i);
    toIndx = path(i+1);
    from = cityLocation(fromIndx,:);
    to = cityLocation(toIndx,:);
    
    subPathLen = norm(from-to);
    pathLength = pathLength + subPathLen;
end
fromIndx = path(nrOfNodes);
toIndx = path(1);
from = cityLocation(fromIndx,:);
to = cityLocation(toIndx,:);

subPathLen = norm(from-to);
pathLength = pathLength + subPathLen;
end