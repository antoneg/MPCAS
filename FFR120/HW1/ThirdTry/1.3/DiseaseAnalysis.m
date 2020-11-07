
function  [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, yProb, initInfected, plotSelection)
recData = [];
susData = [];
infData = [];
population = [];

%Keep track on what individuals are at a given tile.
tileTracker = containers.Map('KeyType','double','ValueType','any');

%Individual => [indx, tile, x, y, state(s,i,r <=> 1,2,3)]
%Initialize population (with no infections) and tileTracker. MAKE FUNCTION
%OF THIS
for i = 1:popSize
    x = randi([1,100],1,1);
    y = randi([1,100],1,1);
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
    population(i,5) = 2;
end

for t = 1:timeSteps
    susceptiblePop = TrimPopulation(population, 1);
    infectedPop = TrimPopulation(population, 2);
    recoveredPop = TrimPopulation(population, 3);
    
    %Save data
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

end
