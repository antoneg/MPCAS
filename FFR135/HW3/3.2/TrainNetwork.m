% ---- Autoencoder 1 



%--------------------Train net1 and net2 ------------------------

%Train the networks and save after training.

[xTrain, tTrain, xValid, tValid, xTest, tTest] = LoadMNIST(3);
trainingSetSize = 50000;
validSetSize = 10000;

xTrainTmp = xTrain;
xTrain = zeros(784,trainingSetSize);
size(xTrainTmp,4)
for i = 1:trainingSetSize 
    img = xTrainTmp(:,:,i);
    imgVector = img(:);
    xTrain(:,i) = imgVector;
end
xTrainNormed = normalize(xTrain,'range');
xTrain = xTrainNormed;


xValidTmp = xValid;
xValid = zeros(784,validSetSize);
for i = 1:validSetSize
    img = xValidTmp(:,:,i);
    imgVector = img(:);
    xValid(:,i) = imgVector;
end
xValidNormed = normalize(xValid,'range');
xValid = xValidNormed;


    options = trainingOptions('adam', ...
    'InitialLearnRate', 0.00100,...
    'MaxEpochs',800, ...    
    'MiniBatchSize',8192, ...  
    'ValidationData',{xValid,xValid}, ...   
    'Shuffle', 'every-epoch',... 
    'Plots','training-progress');
    
layers1 = [
     sequenceInputLayer(784)
     fullyConnectedLayer(50, 'WeightsInitializer', 'glorot')
     reluLayer
     
     fullyConnectedLayer(2, 'WeightsInitializer', 'glorot')
     reluLayer
     
     
     fullyConnectedLayer(784, 'WeightsInitializer', 'glorot')
     reluLayer
     
     
    regressionLayer];

layers2 = [
     sequenceInputLayer(784)
     fullyConnectedLayer(50, 'WeightsInitializer', 'glorot')
     reluLayer
     
     fullyConnectedLayer(4, 'WeightsInitializer', 'glorot')
     reluLayer
     
     
     fullyConnectedLayer(784, 'WeightsInitializer', 'glorot')
     reluLayer
     
     
    regressionLayer];

net1 = trainNetwork(xTrain, xTrain, layers1, options);

net2 = trainNetwork(xTrain, xTrain, layers2, options);

save;
     %---------- END TRAINING----------
