function fitness = EvaluateIndividual(chrom, nrOfHiddenNeurons, dataSet)

%First decode the chromosome.
inputWeights = DecodeChromosome(chrom, nrOfHiddenNeurons, 1);
inputWeightMatrix = reshape(inputWeights,nrOfHiddenNeurons,3);

outputWeights = DecodeChromosome(chrom, nrOfHiddenNeurons,2);

outputWeightsMatrix = reshape(outputWeights,2,nrOfHiddenNeurons);

hiddenThresholds = DecodeChromosome(chrom, nrOfHiddenNeurons, 3);
hiddenThresholds = hiddenThresholds';

outputThresholds = DecodeChromosome(chrom, nrOfHiddenNeurons, 4);
outputThresholds = outputThresholds';
% ---------------
fitness=0;
nrOfSlopes = 0;

mass = 20000;
vMax = 25;
vMin = 1;
alphaMax = 10;
Cb = 3000;
Ch = 40;
brakeTempMax = 750;
tau = 30;
ambientTemp = 283;
deltaTime = 0.12;
gearUpLimit = 0.7;
gearDownLimit = 0.3;
minGear = 1;
maxGear = 10;
slopeLength = 1000;

if dataSet == 1
    nrOfSlopes = 10;
else
    nrOfSlopes = 5;
end
%For every slope..
for iSlope = 1:nrOfSlopes
    
    
    
    currentVelocity = 20;
    currentBrakeTemp = 500;
    currentGear = 7;
    distance = 0;
    currentPressure = 0;
    
    velocities = [];
    
    noViolation = true;
    notFinished = true;
    
    iter = 0;
    
    penalty = 1; % Penalty = distance/slopeLength if distance < slopeLength. But inittially set to 1.
    %localFitness = mean(velocities)*distance*penalty
    gearTime = 0;
    localFitness = 0;
    % ...
    while noViolation && notFinished
        %Next iteration..
        iter = iter +1;
        
        %Add current velocity to the list.
        velocities(iter) = currentVelocity;
        
        %Alpha
        currentAlpha = GetSlopeAngle(distance,iSlope,dataSet);
        
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
        
        %Update
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
    %End of while
    
    if(distance < slopeLength)
        penalty = distance/slopeLength;
    end
    
    meanVelocity = mean(velocities);
    localFitness = distance*meanVelocity*penalty;
    
    fitness = fitness + localFitness;
end
%End of slopes
fitness = fitness/nrOfSlopes;
end