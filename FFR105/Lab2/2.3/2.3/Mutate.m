function mutatedChromosome = Mutate(chromosome,mutationProbability)

     nGenes = size(chromosome,2);
     mutatedChromosome = chromosome;
     for j = 1:nGenes
            r = rand;
         if (r < mutationProbability)
           mut = -1 + (1-(-1))*rand; 
            mutatedChromosome(j) = mut;
         end
     end
end
