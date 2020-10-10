function decoded = DecodeChromosone(chromosone, nrOfHiddenNeurons, selecter)

inputWeightsLimit = 3*nrOfHiddenNeurons;  
outputWeightsLimit = 2*nrOfHiddenNeurons + inputWeightsLimit;
thresholdLimit = nrOfHiddenNeurons + outputWeightsLimit;

inputWeights = chromosone(1:inputWeightsLimit);

outputWeights = chromosone(inputWeightsLimit+1:outputWeightsLimit);

thresholds = chromosone(outputWeightsLimit+1:thresholdLimit);

if selecter == 1
    decoded = inputWeights;
elseif selecter == 2
    decoded = outputWeights;
else
    decoded = thresholds;
end