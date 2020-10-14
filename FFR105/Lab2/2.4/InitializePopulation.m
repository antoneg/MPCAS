function population = InitializePopulation(populationSize,minInstructions,maxInstructions,nrOfOperators,nrOfOVars,nrOfConsts);
% nrOfOperators = 4;
% nrOfOVars = 3;
% nrOfConsts = 3;
population = [];
for i = 1:populationSize
 nrOfInstructions = minInstructions + fix(rand*(maxInstructions-minInstructions+1));
 
 
 for j = 1:nrOfInstructions
        operator = randi([1,nrOfOperators],1,1);
        destination = randi([1,nrOfOVars],1,1);
        operand1 = randi([1,(nrOfOVars+nrOfConsts)],1,1);
        operand2 = randi([1,(nrOfOVars+nrOfConsts)],1,1);

        tmpChromosome(j,1) = operator;
        tmpChromosome(j,2) = destination;
        tmpChromosome(j,3) = operand1;
        tmpChromosome(j,4) = operand2;
 end

 tmpIndividual = struct('Chromosome',tmpChromosome);
 population = [population tmpIndividual];
end