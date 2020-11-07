function backlog = GetBacklogData(chrom, nrOfHiddenNeurons, dataSet, iSlope)

%Decode chromosomes
inputWeights = DecodeChromosome(chrom, nrOfHiddenNeurons, 1);
inputWeightMatrix = reshape(inputWeights,nrOfHiddenNeurons,3);

outputWeights = DecodeChromosome(chrom, nrOfHiddenNeurons,2);

outputWeightsMatrix = reshape(outputWeights,2,nrOfHiddenNeurons);

hiddenThresholds = DecodeChromosome(chrom, nrOfHiddenNeurons, 3);
hiddenThresholds = hiddenThresholds';

outputThresholds = DecodeChromosome(chrom, nrOfHiddenNeurons, 4);
outputThresholds = outputThresholds';
% ----------------- 

backLog = [];

mass = 20000;
vMax = 25;
vMin = 1;
alphaMax = 10;
Cb = 3000;
Ch = 40;
brakeTempMax = 750;
tau = 30;
ambientTemp = 283;
gearUpLimit = 0.7;
gearDownLimit = 0.3;
minGear = 1;
maxGear = 10;
gearTimeLimit = 2;
slopeLength = 1000;

currentVelocity = 20;
currentBrakeTemp = 500;
currentGear = 7;
distance = 0;
currentPressure = 0;

noViolation = true;
notFinished = true;

deltaTime = 0.12;
iter = 0;
gearTime = 0;

while noViolation && notFinished
    %Next iteration..
    iter = iter +1;
    
    %Alpha
    currentAlpha = GetSlopeAngle(distance,iSlope,dataSet);
    
    %Add to backlog
    backlog(iter,:) = [distance; currentAlpha; currentPressure; currentGear; currentVelocity; currentBrakeTemp]; 
   
    %Calculate current acting forces
    engineBrakeForce = EngineBreakForce(currentGear, Cb);
    brakeForce = FoundationBrakeForce(mass, currentPressure, currentBrakeTemp, brakeTempMax);
    gravityForce = GravityForce(mass, currentAlpha);
    acc = Acceleration(mass, gravityForce, brakeForce, engineBrakeForce);
    
    %Prepare the inputs to the network
    vInput = currentVelocity/vMax;
    aInput = currentAlpha/alphaMax;
    tInput = currentBrakeTemp/brakeTempMax;
    
    inputVector = [vInput;aInput;tInput];
    
    %Feed inputs to network, (forward propagation).
    
    hiddenLocalfield = (inputWeightMatrix*inputVector)-hiddenThresholds;
    hiddenNeurons = SigmoidActivation(hiddenLocalfield);
    
    ouputLocalField = outputWeightsMatrix * hiddenNeurons - outputThresholds;
    output = SigmoidActivation(ouputLocalField);
    
    %Get output
    newPressure = output(1);
    gearChange = output(2);
    
    %Desired gear change
    if gearTime >= gearTimeLimit
        
        if gearChange > gearUpLimit
            newGear = currentGear + 1;
            gearTime = 0;
        elseif gearChange < gearDownLimit
            newGear = currentGear - 1;
            gearTime = 0;
        else
            newGear = currentGear;
        end
    else
        newGear = currentGear;
    end
    %Dont shift gear if at max or min gear
    if (newGear < minGear)
        newGear = minGear;
    end
    
    if newGear > maxGear
        newGear = maxGear;
    end
    
    %New brake temp
    newBrakeTemp = UpdateBrakeTemperature(currentPressure, currentBrakeTemp, tau, deltaTime, Ch, ambientTemp);
    if currentBrakeTemp > brakeTempMax
        noViolation = false;
    end
    
    
    %Distance traveled and next x.
    distance = DistanceIncrement(distance, currentVelocity,deltaTime,currentAlpha );
    gearTime = gearTime + deltaTime;
    
    
    %New velocity!
    newVelocity = VelocityIncrement(acc, deltaTime,currentVelocity);
    
    %Update states
    currentPressure = newPressure;
    currentGear = newGear;
    currentBrakeTemp = newBrakeTemp;
    currentVelocity = newVelocity;
    gearTime = gearTime + deltaTime;
    
    %Check for violations
    
    if (currentVelocity > vMax) || (currentVelocity < vMin) || (currentBrakeTemp > brakeTempMax)
        noViolation = false;
    end
    
    if(distance >= slopeLength)
        notFinished = false;
    end
end
end
