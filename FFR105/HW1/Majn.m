populationSize = 30;
numberOfGenes = 40;
crossoverProbability = 0.8;

eliteCopies = 1;
tournamentSize = 2;
nVaribles = 2;

mutationProbability = 0.025;
tournamentSelectionParameter = 0.75;
variableRange = 3.0;
numberOfGenerations = 100;
fitness = zeros(populationSize,1);

population = InitializePopulation(populationSize, numberOfGenes);

for iGeneration = 1:numberOfGenerations

    maximumFitness = 0.0; % Assumes non−negative fitness values!
    xBest = zeros(1,2); % [0 0]
    bestIndividualIndex = 0;
    for i = 1:populationSize
        chromosome = population(i,:);
        x = DecodeChromosome(chromosome, nVaribles, variableRange);
        fitness(i) = EvaluateIndividual(x);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividualIndex = i;
            xBest = x;
        end
    end

 % Printout
disp('xBest');
disp(xBest);
disp('maximumFitness');
disp(maximumFitness);

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

tempPopulation = InsertBestIndividual(tempPopulation,bestIndividualIndex,1);
population = tempPopulation;

end % Loop over generations

 % Print final result
disp('xBest');
disp(xBest);
disp('maximumFitness');
disp(maximumFitness);
