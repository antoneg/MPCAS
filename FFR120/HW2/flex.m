p = 0.5;
f = 0.01;

gridSize = 128;
timeSteps = 10000;

nrOfLocations = gridSize^2;

emptyLocations = [1:nrOfLocations]; %all empty at init
treeLocation = [];
fireLocation = [];

%all empty at init
locationStatus = zeros(nrOfLocations,2); %0 empty, 1, tree, 2 fire
locationStatus(1:nrOfLocations,1) = [1:nrOfLocations];

tic
for t = 1:timeSteps
    
    %Trim lists
    [emptyLocations, treeLocations, fireLocations] = TrimStatusList(locationStatus);
    
    %Identify clusters of fire??
    
    %Spawn new tree
    locationStatus = SpawnTree(locationStatus, emptyLocations, p);
    
    %Power of Zeus, BOOM!
    locationStatus = SetTreeOnFire(locationStatus, treeLocations, f);
    
    %Shut down cluster??
    
    if mod(t,1000) == 0
     figure (1)
     PlotTrees(locationStatus, gridSize);
    end
   
end
toc