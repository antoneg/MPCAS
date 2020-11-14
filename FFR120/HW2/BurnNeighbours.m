function [cluster, updatedLocationStatus] = BurnNeighbours(locationStatus, initLoc, gridSize)
cluster = [initLoc];
updatedLocationStatus = locationStatus;
updatedLocationStatus(initLoc, 2) = 2;
clR = [];
clL = [];
clU = [];
clD = [];


% row = floor((initLoc/gridSize)+1);
row = ceil(initLoc/gridSize);
col = mod(initLoc,gridSize);
if col == 0
    col = gridSize;
end

%4 directions

%Right
if (col + 1) <= gridSize %Right
    loc = updatedLocationStatus((initLoc + 1), 1);
else
    loc = initLoc-(gridSize-1);
end

if updatedLocationStatus(loc,2)== 1
    %         clR(1) = loc;
    %loop rec
    updatedLocationStatus(loc, 2) = 2;
    [nextClR, updatedLocationStatus] = BurnNeighbours(updatedLocationStatus, loc, gridSize);
    clR = [clR,nextClR];
end




% Left
if (col - 1) >= 1
    loc = updatedLocationStatus((initLoc - 1), 1);
else
    loc = initLoc + (gridSize - 1);
end
if updatedLocationStatus(loc, 2) == 1
    %         clL(1) = loc;
    %loop rec
    updatedLocationStatus(loc, 2) = 2;
    [nextClL, updatedLocationStatus] = BurnNeighbours(updatedLocationStatus, loc, gridSize);
    clL = [clL, nextClL];
end






%Up
if (row + 1) <= gridSize 
    loc = updatedLocationStatus((initLoc + gridSize), 1);
else
    loc = col; %This must be at the bottom, the first row, so location is just the col indx.
end
if updatedLocationStatus(loc, 2) == 1
    %         clU(1) = loc;
    %loop rec
    updatedLocationStatus(loc, 2) = 2;
    [nextClU, updatedLocationStatus] = BurnNeighbours(updatedLocationStatus, loc, gridSize);
    clU = [clU, nextClU];
end



%Down
if (row - 1) >= 1 
    loc = updatedLocationStatus((initLoc - gridSize), 1);
else
    % This must be at the top row, so location = all the first loc up to
    % the last row, + col.
    loc = gridSize*(gridSize-1) + col;
end
if updatedLocationStatus(loc, 2) == 1
    %         clD(1) = loc;
    %loop rec
    updatedLocationStatus(loc, 2) = 2;
    [nextClD, updatedLocationStatus] = BurnNeighbours(updatedLocationStatus, loc, gridSize);
    clD = [clD, nextClD];
end


cluster = [cluster, clR, clL, clD, clU];

end