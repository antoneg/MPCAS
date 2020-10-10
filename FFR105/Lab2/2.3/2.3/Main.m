% all slopes L, 1000 m long (horizontal distance)

TMAX = 750;
M = 20000;
tau = 30;
Ch = 40;
Tamb = 283;
Cb = 3000;
vMax = 25;
vMin = 1;
alphaMax = 10;
populationSize = 100;

%Initial states
startX = 0;
startV = 25;
gear = 7;
Tb = 500;

nrOfgeneration = 100;
numbOfhiddenNerurons = 5; %3-10


crossoverProbability = 0.3;
tournamentSize = 2;
nEliteCopies = 1;
mutationProbability = 0.025; %0.025
tournamentSelectionParameter = 0.75;

population = InitializePopulation(populationSize, numbOfhiddenNerurons); % this is weights ayy lmao


bestFitness = 0;
bestFitnessIndx = 0;
bestChromosone = [];

for g = 1:nrOfgeneration
for i = 1:populationSize
    currentChromosone = population(i,:);
    fitness(i) = EvaluateIndividual(currentChromosone, numbOfhiddenNerurons);
    
    currentFitness = fitness(i);
    if currentFitness > bestFitness
        bestFitness = currentFitness;
        bestFitnessIndx = i;
        bestChromosone = currentChromosone;
    end
end


tempPopulation = population;

for i = 1:2:populationSize
    i1 = TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
    i2 = TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
    chromosome1 = population(i1,:);
    chromosome2 = population(i2,:);

    r = rand;
    if (r < crossoverProbability)
        newChromosomePair = Cross(chromosome1,chromosome2);
        tempPopulation(i,:) = newChromosomePair(1,:);
        tempPopulation(i+1,:) = newChromosomePair(2,:);
    else
        tempPopulation(i,:) = chromosome1;
        tempPopulation(i+1,:) = chromosome2;
    end
end % Loop over population

for i = 1:populationSize
    originalChromosome = tempPopulation(i,:);
    mutatedChromosome = Mutate(originalChromosome,mutationProbability);
    tempPopulation(i,:) = mutatedChromosome;
end

tempPopulation = InsertBestIndividual(tempPopulation, bestChromosone, 1);
population = tempPopulation;

end % Loop over generations

bestFitness

% 1. Initiera population (alltså vikter för nätverket i form av kromosomer)
% 2. Evaluera population. Kör simulering med vikterna för varje kromosom och spara fitness
% 3. Mutation/cross/tournament'


