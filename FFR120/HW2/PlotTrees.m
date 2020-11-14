function PlotTrees(locationStatus, gridSize)
nrOfLocations = size(locationStatus,1);

for i = 1:nrOfLocations
    loc = i;
    row = ceil(loc/gridSize);
    col = mod(loc,gridSize);
    if col == 0
        col = gridSize;
    end
    
    if locationStatus(i,2) == 1
        
        plot(col,row,'g.')
        hold on
    end
    if locationStatus(i,2) == 2
        plot(col,row,'r.')
        hold on
    end
end
hold off
xlim([0 130])
ylim([0 130])
end
