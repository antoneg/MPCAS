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
nrOfIndividuals = 200;
timeSteps = 100;
dProb = 0.5;
%Construc individuals with inital positions and state
% individual indx, posx, posy. 
tileTracker = containers.Map;
for i = 1:nrOfIndividuals
    rx = randi([1,100],1,1);
    ry = randi([1,100],1,1);
    susceptibles(i,:) = [i;rx;ry];  
    %Keep track on tiles with individuals. 
    tileNr = (rx-1)*10 + ry;
    if (isKey(tileTracker, tileNr))
        tileIndividuals = tileTracker(tileNr);
        tileIndividuals(end) = i;      
        tileTracker = containers.Map(tileNr,tileIndividuals);
    else
        tileTracker = containers.Map(tileNr,i);
    end
end
population = susceptibles;
    % A random individual gets infected. Add to that list and remove from
    % other.
    infected = [];
    rInfect = randi([1,nrOfIndividuals],1,1);
    infected(1,:) = susceptibles(rInfect,:);
    susceptibles(rInfect,:) = [];
    
    
%     %Add to infected tiles.
%     susceptibles(rInfect,2) = sx;
%     susceptibles(rInfect,3) = sy;
% 
%     %Keep track of tiles that have infected individuals.
%     tileNr = (sx-1)*10 + sy;
%     infectedTiles = [tileNr];

for i = 1:timeSteps
    figure(100);
    
    %Move all
    susceptibles = MoveIndividuals(susceptibles, dProb);
    infected = MoveIndividuals(infected, dProb);
    recoverd = MoveIndividuals(recovered, dProb);
    
    allInd = [susceptibles;infected;recoverd];
    
    %Update tile tracker
    tileTracker = UpdateTileTracker(allInd, tileTracker);
    
%     %Keep track of infected tiles. 
%     infectedTiles = UpdateInfectedTiles(infected);
    
    
    % Infect others and update infected.
     infected = InfectOthers(tileTracker, infected, susceptibles);
    
    scatter(susceptibles(:,2), susceptibles(:,3), 'o')
    
    
    axis([0 100 0 100])
    pause(0.1);
end