
populationSize = 100;
nrOfgenerations = 100;
numbOfhiddenNerurons = 5; %3-10

crossoverProbability = 0.3;
tournamentSize = 2;
nEliteCopies = 1;
mutationProbability = 0.05; 
creepMutationProbability = 0.02;
creepRange = 0.1;
tournamentSelectionParameter = 0.75;

population = InitializePopulation(populationSize, numbOfhiddenNerurons); % this is weights ayy lmao

bestFitness = -Inf;
bestFitnessIndx = 0;
bestChromosone = [];
traingingBest = [];
validationResults = [];
data = zeros(populationSize, 2);

for g = 1:nrOfgenerations
    
    for i = 1:populationSize
        currentChromosone = population(i,:);
        fitness(i) = EvaluateIndividual(currentChromosone, numbOfhiddenNerurons,1);
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
    
    for i = 1:populationSize
        originalChromosome = tempPopulation(i,:);
        mutatedChromosome = CreepMutation(originalChromosome,creepMutationProbability, creepRange);
        tempPopulation(i,:) = mutatedChromosome;
    end
    
    tempPopulation = InsertBestIndividual(tempPopulation, bestChromosone, nEliteCopies);
    population = tempPopulation;
    
    trainingBest(g) = bestFitness;
    validationResults(g) = EvaluateIndividual(bestChromosone, numbOfhiddenNerurons,2);
    
end

csvwrite('BestChromosome', bestChromosone);

%Save the best fitness scores as points
points = [];
xs = 0;
for p = 1:nrOfgenerations
    points(p,1) = trainingBest(p);
    points(p,2) = validationResults(p);
    xs(p) = p;
end

%Validation plot
plot(xs, points(:,2),'g')

hold on
%Training plot
plot(xs, points(:,1),'r')
legend("Validation", "Training")
xlim([0 nrOfgenerations]);
ylim([0 25000]);
