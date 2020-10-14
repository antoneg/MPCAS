function pop = InitializePopulation(popSize, nrOfHiddenNeurons)
    min = -10;
    max = 10;
    %Each gene is one weight, or one threshold.
    %Maybe init thresh to values 0 and 1
    nrGenes = 3*nrOfHiddenNeurons + 2*nrOfHiddenNeurons + nrOfHiddenNeurons + 2; %inputweights, outputweights, thresholds for hidden, threshlds for putput 

for i = 1:popSize
    chromosone = min + (max-min).*rand(1,nrGenes);
    pop(i,:) = chromosone;
end
end