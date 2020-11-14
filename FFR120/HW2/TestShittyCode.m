gridSize = 5;
nrOfLocs = gridSize^2;

locationStatus = zeros(nrOfLocs,2);
locationStatus(:,1) = [1:nrOfLocs];


for c = 1:15 % about 15 trees
    rLoc = randi([1, nrOfLocs],1,1);
    locationStatus(rLoc,2) = 1;
end
locationStatus
cluster = [];

figure(1)
for i = 1:size(locationStatus,1)
    loc  = locationStatus(i,1);
    
    %     x = floor((loc/gridSize)+1);
    %     y = loc - ((x-1)*gridSize);
    row = ceil(loc/gridSize);
    col = mod(loc,gridSize);
    if col == 0
        col = gridSize;
    end
    
    if locationStatus(i,2) == 1
        plot(col, row, 'go')
        hold on
        text(col, row, num2str(loc))
        hold on
    end
end



[cluster, updatedLocationStatus] = BurnNeighbours(locationStatus, 5, gridSize);
cluster
updatedLocationStatus
for b = 1:size(cluster, 2)
    bLoc = cluster(b);
    
    bRow = ceil(bLoc/gridSize);
    bCol = mod(bLoc,gridSize);
    if bCol == 0
        bCol = gridSize;
    end
    
    plot(bCol, bRow, 'ro');
    hold on 
end

hold off

xlim([0, 6])
ylim([0, 6])