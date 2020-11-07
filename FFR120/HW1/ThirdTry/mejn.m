%Individual indx, tile, x, y, state(s,i,r <=> 0,1,2)
population = [];
popSize = 1000;
timeSteps = 1000;
dProb = 0.8;
bProb = 0.6;
yProb = 0.025;
initInfected = 10;
%Keep track on what individuals are at a given tile.
tileTracker = containers.Map('KeyType','double','ValueType','any');

%Initialize population (with no infections) and tileTracker. MAKE FUNCTION
%OF THIS

for i = 1:popSize
    x = randi([25,75],1,1); 
    y = randi([25,75],1,1);
    tileNr = (x-1)*100+y;
    population(i,:) = [i,tileNr,x,y,1];
    if isKey(tileTracker, tileNr)
        tileIndividuals = tileTracker(tileNr);
        tileIndividuals(end+1) = i;
        tileTracker(tileNr) = tileIndividuals;
    else
        tileTracker(tileNr) = [i];
    end
end

%Initial infections
for i = 1:initInfected
% rIndx = randi([1,popSize],1,1);
population(i,5) = 2;
end

for t = 1:timeSteps
    figure(100);
    %Plot population
    susceptiblePop = TrimPopulation(population, 1);
    infectedPop = TrimPopulation(population, 2);
    recoveredPop = TrimPopulation(population, 3);
    
    if(size(recoveredPop,1) > 0)
        recXs = recoveredPop(:,3);
        recYs = recoveredPop(:,4);
        if mod(t, 100) == 0
            scatter(recXs, recYs, 'g');
            hold on
        end
    end
    
    if size(susceptiblePop,1) > 0
        susXs = susceptiblePop(:,3);
        susYs = susceptiblePop(:,4);
        if mod(t, 100) == 0
            
            scatter(susXs, susYs, 'b');
            hold on
        end
    end
    
    if size(infectedPop,1) > 0
        infXs = infectedPop(:,3);
        infYs = infectedPop(:,4);
        if mod(t, 100) == 0           
            scatter(infXs, infYs, 'r');
        end
    end
    
    
    axis([0 100 0 100]);
    
    hold off
   
   %Save data for final plot
   nrOfSus = size(susceptiblePop,1);
   nrOfInf = size(infectedPop,1); 
   nrOfRec = size(recoveredPop,1);
   susData(t) = nrOfSus;
   infData(t) = nrOfInf;
   recData(t) = nrOfRec;
   
    %Infect and Recover
    population = InfectRecover(population, infectedPop, tileTracker, bProb, yProb);
    
    %Move all individuals (update population and tileTracker)
    [population, tileTracker] = MoveIndividuals(population, tileTracker, dProb);
end

figure(200)
scatter([1:timeSteps], susData, 'b');
hold on
scatter([1:timeSteps], infData, 'r');
hold on
scatter([1:timeSteps], recData, 'g');
