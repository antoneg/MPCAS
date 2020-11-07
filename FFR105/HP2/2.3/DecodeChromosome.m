
function decoded = DecodeChromosome(chromosome, nrOfHiddenNeurons, selecter)
%Selecter 1 = inputweights
%Selecter 2 = outputWeights
%Selecter 2 = hidden thresholds
%Selecter 4 or any other = output thresholds

inputWeightsLimit = 3*nrOfHiddenNeurons;
outputWeightsLimit = 2*nrOfHiddenNeurons + inputWeightsLimit;
hiddenThresholdLimit = nrOfHiddenNeurons + outputWeightsLimit;
outputThresholdLimit = 2 + hiddenThresholdLimit;

inputWeights = chromosome(1:inputWeightsLimit);

outputWeights = chromosome(inputWeightsLimit+1:outputWeightsLimit);

hiddenThresholds = chromosome(outputWeightsLimit+1:hiddenThresholdLimit);

outputThresholds = chromosome(hiddenThresholdLimit+1:outputThresholdLimit);

if selecter == 1
    decoded = inputWeights;
elseif selecter == 2
    decoded = outputWeights;
elseif selecter == 3
    decoded = hiddenThresholds;
else
    decoded = outputThresholds;
end
end