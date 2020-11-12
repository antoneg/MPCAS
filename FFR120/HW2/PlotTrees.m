function PlotTrees(locationStatus, gridSize)
nrOfLocations = size(locationStatus,1);

for i = 1:nrOfLocations   
    if locationStatus(i,2) == 1
        x = floor((i/gridSize)+1);
        y = i - ((x-1)*gridSize);
        plot(x,y,'g.')
        hold on
    end   
end
hold off
xlim([0 130])
ylim([0 130])
end