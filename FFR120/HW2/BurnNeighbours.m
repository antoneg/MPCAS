function updatedLocationStatus = BurnNeighbours(locationStatus, initLoc, gridSize)
updatedLocationStatus = locationStatus;
updatedLocationStatus(initLoc) = 2;

% row = floor((initLoc/gridSize)+1);
row = ceil(initLoc/gridSize);
col = mod(initLoc,gridSize);
if col == 0
    col = gridSize;
end

%4 directions

%Right
if (col + 1) <= gridSize %Right
    loc = (initLoc + 1);
else
    loc = initLoc-(gridSize-1);
end

if updatedLocationStatus(loc) == 1
    %loop rec
    updatedLocationStatus(loc) = 2;
     updatedLocationStatus = BurnNeighbours(updatedLocationStatus, loc, gridSize);
end




% Left
if (col - 1) >= 1
    loc = (initLoc - 1);
else
    loc = initLoc + (gridSize - 1);
end
if updatedLocationStatus(loc) == 1
    %         clL(1) = loc;
    %loop rec
    updatedLocationStatus(loc) = 2;
   updatedLocationStatus = BurnNeighbours(updatedLocationStatus, loc, gridSize);
end






%Up
if (row + 1) <= gridSize 
    loc = initLoc + gridSize;
else
    loc = col; %This must be at the bottom, the first row, so location is just the col indx.
end
if updatedLocationStatus(loc) == 1
    %loop rec
    updatedLocationStatus(loc) = 2;
    updatedLocationStatus = BurnNeighbours(updatedLocationStatus, loc, gridSize);
end



%Down
if (row - 1) >= 1 
    loc = (initLoc - gridSize);
else
    % This must be at the top row, so location = all the first loc up to
    % the last row, + col.
    loc = gridSize*(gridSize-1) + col;
end
if updatedLocationStatus(loc) == 1
    %loop rec
    updatedLocationStatus(loc) = 2;
   updatedLocationStatus = BurnNeighbours(updatedLocationStatus, loc, gridSize);
end


end