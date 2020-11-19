function  [emptyLocations, treeLocations, fireLocations] = TrimStatusList(locationStatus)
% emptyLocations = [];
% treeLocations = [];
% fireLocations = [];
nrOfLocs = size(locationStatus,1);
tmpLocs = zeros(nrOfLocs,2);
tmpLocs(:,1) = [1:nrOfLocs];
tmpLocs(:,2) = locationStatus;
tmpLocs = sortrows(tmpLocs,2);

emptyIndx = find(tmpLocs(:,2) == 0, 1);
emptyIndxSize = size(emptyIndx,1);

if emptyIndxSize == 0
    emptyIndx = 0;
end

treeIndx = find(tmpLocs(:,2) == 1,1);
treeIndxSize = size(treeIndx,1);


if treeIndxSize == 0 
    treeIndx = 0;
end

burningIndx = find(tmpLocs(:,2) == 2,1);
burningIndxSize = size(burningIndx,1);

if burningIndxSize ==0
    burningIndx = 0;
end


if emptyIndx == 0
    emptyLocations = [];
else
    if treeIndx == 0
        if burningIndx == 0
            emptyLocations = tmpLocs(1:end,1);
        else
            emptyLocations = tmpLocs(1:(burningIndx-1),1);
        end
    else
        emptyLocations = tmpLocs(1:(treeIndx-1),1);
    end
end


if treeIndx == 0
    treeLocations = [];
else
    if burningIndx == 0
        treeLocations = tmpLocs(treeIndx:end,1);
    else
        treeLocations = tmpLocs(treeIndx:(burningIndx-1),1);
    end
end

if burningIndx == 0
    fireLocations = [];
else
    fireLocations = tmpLocs(burningIndx:end,1);
end
end

% if (treeIndx == 0 && burningIndx == 0) %No trees
%    emptyLocations = tmpLocs(1:end,1);
%
% elseif (treeIndx > 0) && (burningIndx == 0) %trees but no burning trees
% elseif (treeIndx == 0) && (burningIndx > 0)
% else
%
% end