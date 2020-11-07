% x = 0:.01:6;
% y = sin(x);
% px = 0;
% py = 0;
% for i=1:100
%     figure(100); %This is so it will replot over the previous figure, and not make a new one.
%     plot(x,y, px, py,'o');
%     pause(0.1);
%     px = px+6/100;
%     py = sin(px);
% end


% xPositions = [1:100];
% yPositions = [1:100];
%
% rx = randi([1,100],1,1);
% rx
% ry = randi([1,100],1,1);
% ry
%
% xLine = 1:100
% yLine = 1:100
susceptibles = [];
infected = [];
recovered = [];
nrOfIndividuals = 1000;
timeSteps = 100;
dProb = 0.5;
bProb = 0.5;
yProb = 0.1;
%Construc individuals with inital positions and state
% individual indx, posx, posy. 
tileTracker = containers.Map('KeyType','double','ValueType','any');

%ind id as key, location as value.
keySet = [1:200];
susMap = containers.Map('KeyType','double','ValueType','any');

infMap = containers.Map('KeyType','double','ValueType','any');

recMap = containers.Map('KeyType','double','ValueType','any');

for i = 1:nrOfIndividuals
    rx = randi([1,100],1,1);
    ry = randi([1,100],1,1);
    susceptibles(i,:) = [i;rx;ry];  
    susMap(i) = [rx,ry];

    %Keep track on tiles with individuals. 
    tileNr = (rx-1)*10 + ry;
    if (isKey(tileTracker, tileNr))
        tileIndividuals = tileTracker(tileNr);
        tileIndividuals(end) = i;      
        tileTracker(tileNr) = tileIndividuals;
    else
        tileTracker(tileNr) = i;
    end
end

population = susceptibles;
    % A random individual gets infected. Add to that list and remove from
    % other.
    infected = [];
    rInfect = randi([1,nrOfIndividuals],1,1);
    infected(1,:) = susceptibles(rInfect,:);
    susceptibles(rInfect,:) = [];
    
    infLocation = susMap(rInfect);
    infMap(rInfect) = infLocation;
    remove(susMap, rInfect);
%     %Add to infected tiles.
%     susceptibles(rInfect,2) = sx;
%     susceptibles(rInfect,3) = sy;
% 
%     %Keep track of tiles that have infected individuals.
%     tileNr = (sx-1)*10 + sy;
%     infectedTiles = [tileNr];
%     allSusKeys = keys(susMap);
%     allSusKeys(1,1)
%     allSusKeys(1,2)
%     allSusKeys = allSusKeys{:,:};
%     allSusKeys
for i = 1:timeSteps
    figure(100);
    
    %Move all
    susMap = MoveIndividuals(susMap, dProb);
    infMap = MoveIndividuals(infMap, dProb);
    recMap = MoveIndividuals(recMap, dProb);
    
%     allInd = [susceptibles;infected;recoverd];
    
    %Update tile tracker
    tileTracker = UpdateTileTracker(susMap, infMap, recMap);
    
%     %Keep track of infected tiles. 
%     infectedTiles = UpdateInfectedTiles(infected);
    
    
    [susMap, infMap, recMap] = InfectOthers(susMap, infMap, recMap, tileTracker,bProb, yProb);
    infMap
    allSusKeys = keys(susMap);
    size(allSusKeys,2)
    for s = 1:size(allSusKeys,2)
        key = allSusKeys(1,s);

%         key = key{1,1};
       key = key{1,1};
        location = susMap(key);
        x = location(1);
        y = location(2);
        susXs(s) = x;
        susYs(s) = y;
    end
    scatter(susXs, susYs);
    
    axis([0 100 0 100])
%     pause(0.1);
end