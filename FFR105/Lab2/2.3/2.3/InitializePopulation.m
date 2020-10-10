function pop = InitializePopulation(popSize, nrOfHiddenNeurons)
    min = -1;
    max = 1;
    %Each gene is one weight, or one threshold.
    %Maybe init thresh to values 0 and 1
    nrGenes = 3*nrOfHiddenNeurons + 2*nrOfHiddenNeurons + nrOfHiddenNeurons; 

for i = 1:popSize
    chromosone = min + (max-min).*rand(1,nrGenes);
    pop(i,:) = chromosone;
end
end