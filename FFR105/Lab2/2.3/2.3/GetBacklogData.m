function backlog = GetBacklogData(chrom, nrOfHiddenNeurons, dataSet, iSlope)

%Decode and construct to matrices
inputWeights = DecodeChromosone(chrom, nrOfHiddenNeurons, 1);
inputWeightMatrix = reshape(inputWeights,nrOfHiddenNeurons,3);

outputWeights = DecodeChromosone(chrom, nrOfHiddenNeurons,2);

outputWeightsMatrix = reshape(outputWeights,2,nrOfHiddenNeurons);

hiddenThresholds = DecodeChromosone(chrom, nrOfHiddenNeurons, 3);
hiddenThresholds = hiddenThresholds';

outputThresholds = DecodeChromosone(chrom, nrOfHiddenNeurons, 4);
outputThresholds = outputThresholds';

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

currentVelocity = 20;
currentBrakeTemp = 500;
currentGear = 7;
distance = 0;
currentPressure = 0;

velocities = [];

noViolation = true;
notFinished = true;

deltaTime = 0.12;

iter = 0;
gearTime = 0;

while noViolation && notFinished
    %Next iteration..
    iter = iter +1;
    
    %Add current velocity to the list.
    velocities(iter) = currentVelocity;
    
    %Alpha
    currentAlpha = GetSlopeAngle(distance,iSlope,dataSet);
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
    if gearTime >= 2
        
        if gearChange > 0.7
            newGear = currentGear + 1;
            gearTime = 0;
        elseif gearChange < 0.3
            newGear = currentGear - 1;
            gearTime = 0;
        else
            newGear = currentGear;
        end
    else
        newGear = currentGear;
    end
    %Dont shift gear if at max or min gear
    if (newGear < 1)
        newGear = 1;
    end
    
    if newGear > 10
        newGear = 10;
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
    
    if (currentVelocity > 25) || (currentVelocity < 1) || (currentBrakeTemp > brakeTempMax)
        noViolation = false;
    end
    
    if(distance >= 1000)
        notFinished = false;
    end
end
end
