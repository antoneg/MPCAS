function pop = InitializePopulation(popSize, nrOfHiddenNeurons)
min = -10;
max = 10;
%Each gene is one weight, or one threshold.
nrGenes = 3*nrOfHiddenNeurons + 2*nrOfHiddenNeurons + nrOfHiddenNeurons + 2; %inputweights, outputweights, thresholds for hidden, threshlds for output

for i = 1:popSize
    chromosome = min + (max-min).*rand(1,nrGenes);
    pop(i,:) = chromosome;
end
end