clear all;
close all;
populationSize = 200;
cityPositions = LoadCityLocations;

tournamentSelectionParameter = 0.8;
mutationProbability = 0.02;
numberOfGenerations = 1000;
tournamentSize = 10;
nrOfCopies = 2;

fitness = zeros(populationSize,1);
population = zeros(populationSize,50);

tspFigure = InitializeTspPlot(cityPositions,[0 20 0 20]);
connection = InitializeConnections(cityPositions);


for i = 1:populationSize
    population(i,:) = randperm(50);
end

bestIndividualIndex = 0;
bestFitness = 0;

for iGeneration = 1:numberOfGenerations
    
    %Evaluation
    for i = 1:populationSize
        fitness(i) = EvaluateIndividual(population(i,:), cityPositions);
        if (fitness(i) > bestFitness)
            bestFitness = fitness(i);
            bestIndividualIndex = i;
            bestChromosome = population(bestIndividualIndex,:);
            PlotPath(connection,cityPositions,bestChromosome);
        end
    end
    tempPopulation = population;
    
    %Tournament
    for i = 1:populationSize
        winnerIndx = TournamentSelect(fitness,tournamentSelectionParameter, tournamentSize);
        tempPopulation(i,:) = population(winnerIndx,:);
    end
    
    %Mutation
    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = Mutate(originalChromosome,mutationProbability);
        tempPopulation(i,:) = mutatedChromosome;
    end
    
    %Elitism
    tempPopulation = InsertBestIndividual(tempPopulation, bestChromosome, nrOfCopies);
    population = tempPopulation;
    
end

distance = 1/bestFitness;
display("Best distance: " + distance);

