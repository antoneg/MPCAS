function cluster = BurnNeighbours(locationStatus, initLoc, gridSize)
cluster = [initLoc];
updatedLocationStatus = locationStatus;
updatedLocationStatus(initLoc, 2) = 2;
clR = [];
clL = [];
clU = [];
clD = [];
row = ( ceil(initLoc/gridSize));

% row = floor((initLoc/gridSize)+1);
col = initLoc -((row-1)*gridSize);
initLoc
row
col
%check 4 dir
% if (initLoc + 1) <= rowIndx %Right
if (col + 1) <= gridSize %Right
    
    loc = locationStatus((initLoc + 1), 1);
    if locationStatus(loc,2)== 1
%         clR(1) = loc;
        %loop rec
        updatedLocationStatus(loc, 2) = 2;
        nextClR = BurnNeighbours(updatedLocationStatus, loc, gridSize);
        clR = [clR,nextClR];
    end
end

% if (initLoc - 1) >= rowIndx  
if (col - 1) >= 1%Left
    loc = locationStatus((initLoc - 1), 1);
    if locationStatus(loc, 2) == 1
%         clL(1) = loc;
        %loop rec
        updatedLocationStatus(loc, 2) = 2;
        nextClL = BurnNeighbours(updatedLocationStatus, loc, gridSize);
        clL = [clL, nextClL];
    end
end


% if (initLoc + gridSize) <= (gridSize^2)
if (row + 1) <= gridSize %Up
    loc = locationStatus((initLoc + gridSize), 1);
    if locationStatus(loc, 2) == 1
%         clU(1) = loc;
        %loop rec
        updatedLocationStatus(loc, 2) = 2;
        nextClU = BurnNeighbours(updatedLocationStatus, loc, gridSize);
        clU = [clU, nextClU];
    end
end


% if (initLoc - gridSize) >= (1)  
if (row - 1) >= 1 %Down
    loc = locationStatus((initLoc - gridSize), 1);
    if locationStatus(loc, 2) == 1
%         clD(1) = loc;
        %loop rec
        updatedLocationStatus(loc, 2) = 2;
        nextClD = BurnNeighbours(updatedLocationStatus, loc, gridSize);
        clD = [clD, nextClD];
    end
end

cluster = [cluster, clR, clL, clD, clU];

end