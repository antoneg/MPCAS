clear all

p = 0.001;
f = 0.01;

gridSize = 128;
timeSteps = 30000;

nrOfLocations = gridSize^2;

emptyLocations = [1:nrOfLocations]; %all empty at init
treeLocation = [];
fireLocation = [];

%all empty at init
locationStatus = zeros(nrOfLocations,2); %0 empty, 1, tree, 2 fire
locationStatus(1:nrOfLocations,1) = [1:nrOfLocations];

% strike = false;
strikes = 0;

tic
for t = 1:timeSteps
    
    %Trim lists %I can remove the fires lol
    [emptyLocations, treeLocations, fireLocations] = TrimStatusList(locationStatus);
    
    %Identify clusters of fire??
    
    %Spawn new tree
    locationStatus = SpawnTree(locationStatus, emptyLocations, p);
    
    %Power of Zeus, BOOM!
    [fireLocations, locationStatus] = SetTreeOnFire(locationStatus, nrOfLocations, gridSize, f);
    
    %Remove forest (but first plot what is being removed)
    nrOfBurningTrees = size(fireLocations,2);
    nrOfTrees = size(treeLocations,1);
    nrOfEmpty = size(emptyLocations, 1);
    if nrOfBurningTrees > 0
        strikes = strikes + 1;
        plotData(strikes,1) = nrOfBurningTrees;
        plotData(strikes,2) = nrOfTrees;
        plotData(strikes,3) = nrOfEmpty;
        
%         figure (1)
%         if size(fireLocations,2) >= 1000
%             PlotTrees(locationStatus, gridSize);
%         end
        locationStatus = BurnDownCluster(fireLocations, locationStatus);
    end

    if mod(t, 1000) == 0
        disp(t/1000);
    end
    
end
save('myData.mat');
toc