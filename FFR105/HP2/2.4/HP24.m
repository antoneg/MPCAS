functionData = LoadFunctionData();

nrOfOperators = 4;
nrOfVars = 6;
nrOfConsts = 2;
nrOfRegs = nrOfVars + nrOfConsts;
consts = [-2,3];

tournamentSelectionParameter = 0.75;
crossoverProbability = 0.7;
mutationProbability = 0.04;

maxInstructionLimit = 50;

nrOfGenerations = 50000;
populationSize = 100;
population = InitializePopulation(populationSize,5,25,nrOfOperators,nrOfVars,nrOfConsts); %fix this hehe

fitness = [];
bestChrom = [];
bestChromIndx = 0;
bestFitness = 0;
%Standard ga..
for g = 1:nrOfGenerations
    
    
    for i = 1:populationSize
    currentChrom = population(i).Chromosome;
    fitness(i) = EvaluateIndividual(currentChrom,nrOfVars, consts);  
    
    if fitness(i) > bestFitness
        bestFitness = fitness(i);
        bestChrom = currentChrom;
        bestChromIndx = i;
    end
    end
    
    tempPopulation = population;
    
    meanFitness = mean(fitness);

for i = 1:2:populationSize
    i1 = TournamentSelect(fitness,tournamentSelectionParameter,5);
    i2 = TournamentSelect(fitness,tournamentSelectionParameter,5);
    chromosome1 = population(i1).Chromosome ;
    chromosome2 = population(i2).Chromosome ;
    
    
    topTen = sort(fitness);
    topTen = topTen(90:100);
    
    meanTopTen = mean(topTen);
    crossoverProbability = (1/meanTopTen );
    
    r = rand;
    if (r < crossoverProbability)
        newChromosomePair = Cross(chromosome1,chromosome2);
        tempPopulation(i).Chromosome = newChromosomePair(1).Chromosome ;
        tempPopulation(i+1).Chromosome  = newChromosomePair(2).Chromosome ;
    else
        tempPopulation(i).Chromosome  = chromosome1;
        tempPopulation(i+1).Chromosome  = chromosome2;
    end
end % Loop over population

for i = 1:populationSize
    originalChromosome = tempPopulation(i).Chromosome ;
    mutatedChromosome = Mutate(originalChromosome,mutationProbability,nrOfOperators,nrOfVars, nrOfRegs);
    tempPopulation(i).Chromosome  = mutatedChromosome;
end

tempPopulation = InsertBestIndividual(tempPopulation, bestChrom, 1);
population = tempPopulation;

if(mod(g,10)) == 0
disp("Iteration: " + g)
if size(bestChrom,1) < maxInstructionLimit
disp("ERROR: " + (1/bestFitness))
else 
    penalty = 50/size(bestChrom,1);
    e = (1/bestFitness)/penalty;
    disp("ERROR (long chrom): " + e)
end

disp("Fitness: " + (bestFitness))
disp("Size: " + (size(bestChrom,1)))
disp("_________________________")
end
end
%Saved best chrom using csvwrite



