function mutatedChromosome = Mutate(chromosome,mutationProbability)
tmpChromosome = chromosome;
for i = 1:50
    r = rand;
    if(r<mutationProbability)
        gene1 = tmpChromosome(i);
        
        r2 = randi([1,50],1,1);
        gene2 = tmpChromosome(r2);
        
        tmpChromosome(i) = gene2;
        tmpChromosome(r2) = gene1;
    end
end
mutatedChromosome = tmpChromosome;
end
