function plotData = ForestFireSim(p ,f, gridSize, timeSteps, plotSetting, saveName, saveD, plotCounterLimit)
plotData = [];

nrOfLocations = gridSize^2;

emptyLocations = [1:nrOfLocations]; %all empty at init
treeLocations = [];
fireLocations = [];

%all empty at init
locationStatus = zeros(nrOfLocations,1); %0 empty, 1, tree, 2 fire
% locationStatus(1:nrOfLocations,1) = [1:nrOfLocations];

strikes = 0;
plotCounter = 0;

figCounter = 1;
for t = 1:timeSteps
    
    
    %Spawn new trees
    locationStatus = SpawnTree(locationStatus, emptyLocations, p);
    
    %Lightning strike
    locationStatus = SetTreeOnFire(locationStatus, nrOfLocations, gridSize, f);
    
    %Plot lattices and count nr of burning trees and total trees
    [emptyLocations, treeLocations, fireLocations] = TrimStatusList(locationStatus);
    
    nrOfBurningTrees = size(fireLocations,1);
    nrOfTrees = size(treeLocations,1);
    nrOfEmptyLocations = size(emptyLocations, 1);
    

    if nrOfBurningTrees > 0
        strikes = strikes + 1;
        plotData(strikes,1) = nrOfBurningTrees;
        plotData(strikes,2) = nrOfTrees + nrOfBurningTrees;
        plotData(strikes,3) = nrOfEmptyLocations;
        
     if(plotSetting == 1) && plotCounter > plotCounterLimit
            figure(figCounter)
            PlotTrees(locationStatus, gridSize);
            
            title(['forest fire at time step: ' num2str(t) ', p = ' num2str(p) ', f = ' num2str(f)])
            xlabel('x');
            ylabel('y');
            plotCounter = 0;
            figCounter = figCounter + 1;
            rfs = nrOfBurningTrees/(gridSize^2);
            disp([num2str(t) ' gave rfs: ' num2str(rfs)])
     else
         plotCounter = plotCounter + 1;
     end        
        locationStatus = BurnDownCluster(fireLocations, locationStatus);
    end
    
    if mod(t, 1000) == 0
        disp(t/1000);
    end
end
if (saveD)
    save(saveName);
end
end