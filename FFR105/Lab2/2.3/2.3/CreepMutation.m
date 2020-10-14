function mutatedChromosome = CreepMutation(chromosome,creepMutationProbability,creepRange)
    
     nGenes = size(chromosome,2);
     
     mutatedChromosome = chromosome;
     for j = 1:nGenes
            r = rand;
         if (r < creepMutationProbability)
            currentGene = chromosome(j);
            min = -creepRange;
            max = creepRange;
           
            creepMutVal = (max-min).*rand(1,1) + min;
            mutatedChromosome(j) = creepMutVal + currentGene;
         end
     end
end
