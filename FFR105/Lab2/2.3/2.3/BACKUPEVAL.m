function fitness = EvaluateIndividual(chrom, nrOfHiddenNeurons, x)
%for each timestamp, feed to the network
slopeLenght = 1000;
noViolation = true;

%Decode and construct to matrices
inputWeights = DecodeChromosone(chrom, nrOfHiddenNeurons, 1);
inputWeightMatrix = reshape(inputWeights,nrOfHiddenNeurons,3);

outputWeights = DecodeChromosone(chrom, nrOfHiddenNeurons,2);

outputWeightsMatrix = reshape(outputWeights,2,nrOfHiddenNeurons);

hiddenThresholds = DecodeChromosone(chrom, nrOfHiddenNeurons, 3);
hiddenThresholds = hiddenThresholds';

outputThresholds = DecodeChromosone(chrom, nrOfHiddenNeurons, 4);
outputThresholds = outputThresholds';

for t = 1:10
    mass = 20000;
    vMax = 25;
    vMin = 1;
    alphaMax = 10;
    Cb = 3000;
    Ch = 40;
    brakeTempMax = 750;
    tau = 30;
    ambientTemp = 283;
    
    initialVelocity = 20;
    initialBrakeTemp = 500;
    initialGear = 7;
    
    currentVelocity = initialVelocity;
    currentBrakeTemp = initialBrakeTemp;
    currentGear = 7;
    distance = 0;
    currentPressure = 0;
    
    velocities = [];
    
    noViolation = true;
    notFinished = true;
    
    deltaTime = 0.12;
    
    fitness=0;
    
    iter = 1;
    penaly = 0;
    gearTime = 0;
    localFitness = 0;
    while noViolation && notFinished
        
        iter = iter +1;
        velocities(iter) = currentVelocity;
        
        
        vInput = currentVelocity/vMax;
        currentAlpha = GetSlopeAngle(distance,t,1);
        aInput = currentAlpha/alphaMax;
        tInput = currentBrakeTemp/brakeTempMax;
        
        inputVector = [vInput;aInput;tInput];
        
        %forward propagation
        
        hiddenLocalfield = (inputWeightMatrix*inputVector)-hiddenThresholds;
        hiddenNeurons = SigmoidActivation(hiddenLocalfield);
        
        ouputLocalField = outputWeightsMatrix * hiddenNeurons - outputThresholds;
        output = SigmoidActivation(ouputLocalField);
        
        newPressure = output(1);
        gearFlex = output(2);
        
        %distance (and alpha x)!
        distance = distance + currentVelocity*deltaTime;
        if(distance >= 1000)
            notFinished = false;
        end
        
        if gearTime >= 2
            
            if gearFlex > 0.7
                newGear = currentGear + 1;
                gearTime = 0;
            elseif gearFlex < 0.3
                newGear = currentGear - 1;
                gearTime = 0;
            else
                newGear = currentGear;
            end
        end   
        
        
        if (newGear < 1)
            newGear = 1;
        end
        
        if newGear > 10
            newGear = 10;
        end
        
        
        
        %new velocity!
        engineBrakeForce = EngineBreakForce(currentGear, Cb);
        brakeForce = FoundationBrakeForce(mass, currentPressure, currentBrakeTemp, brakeTempMax);
        gravityForce = GravityForce(mass, currentAlpha);
        acc = Acceleration(mass, gravityForce, brakeForce, engineBrakeForce);
        nextV = DeltaVelocity(acc, deltaTime);
        
        
        %new brake temp!
        currentBrakeTemp = UpdateBrakeTemperature(currentPressure, currentBrakeTemp, tau, deltaTime, Ch, ambientTemp);
        if currentBrakeTemp > brakeTempMax
            noViolation = false;
            %              disp("currentBrakeTemp is big ");
            %              disp("Brake Temp: " + currentBrakeTemp);
            %              disp("Distance: " + distance);
            %              disp("Mean v: " + mean(velocities));
            
        end
        
        gearTime = gearTime + deltaTime;
        currentPressure = newPressure;
        currentGear = newGear;
        currentVelocity = currentVelocity + nextV;
        if (currentVelocity > 25) || (currentVelocity < 1)
            noViolation = false;
            %             disp("vel is big ");
            %              disp("vel: " + currentVelocity);
            %              disp("Distance: " + distance);
            %              disp("Mean v: " + mean(velocities));
        end
    end
    
    localFitness = (mean(velocities))*distance;
    fitness = fitness + localFitness;
end
fitness = fitness/10;
end