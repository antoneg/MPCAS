function decoded = DecodeChromosone(chromosone, nrOfHiddenNeurons, selecter)

inputWeightsLimit = 3*nrOfHiddenNeurons;  
outputWeightsLimit = 2*nrOfHiddenNeurons + inputWeightsLimit;
hiddenThresholdLimit = nrOfHiddenNeurons + outputWeightsLimit;
outputThresholdLimit = 2 + hiddenThresholdLimit;

inputWeights = chromosone(1:inputWeightsLimit);

outputWeights = chromosone(inputWeightsLimit+1:outputWeightsLimit);

hiddenThresholds = chromosone(outputWeightsLimit+1:hiddenThresholdLimit);

outputThresholds = chromosone(hiddenThresholdLimit+1:outputThresholdLimit);

if selecter == 1
    decoded = inputWeights;
elseif selecter == 2
    decoded = outputWeights;
elseif selecter == 3
    decoded = hiddenThresholds;
else 
    decoded = outputThresholds;
end