function mutatedChromosome = Mutate(chromosome,mutationProbability,nrOfOperators,nrOfVars, nrOfRegs)

nrOfInstructions = size(chromosome,1);
mutatedChromosome = chromosome;
for i = 1:nrOfInstructions
    for j = 1:4
        
        r = rand;
        if (r < mutationProbability)
            if j == 1
                mutatedChromosome(i,j) = randi([1,nrOfRegs],1,1);
            elseif j == 2
                mutatedChromosome(i,j) = randi([1,nrOfRegs],1,1);
            elseif j == 3
                mutatedChromosome(i,j) = randi([1,nrOfVars],1,1);
            else % ==5
                mutatedChromosome(i,j) = randi([1,nrOfOperators],1,1);
            end
        end
        
    end
end
end
