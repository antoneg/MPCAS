function mutatedChromosome = Mutate(chromosome,mutationProbability)

     nGenes = size(chromosome,2);
     mutatedChromosome = chromosome;
     
     for j = 1:nGenes
            r = rand;
         if (r < mutationProbability)
           mut = -10 + (10-(-10))*rand; 
            mutatedChromosome(j) = mut;
         end
     end
end
