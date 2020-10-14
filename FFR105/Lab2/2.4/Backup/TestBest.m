bestChrom = BestHaha();
nrOfOperators = 4;
nrOfVars = 6;
nrOfConsts = 2;
nrOfRegs = nrOfVars + nrOfConsts;
consts = [-2,3];

f = EvaluateIndividual(bestChrom, nrOfVars, nrOfConsts, consts)

dataPoints = LoadFunctionData();
    nrOfPoints = size(dataPoints,1);
    nrOfInstructions = size(bestChrom,1);
    resultYs = zeros(nrOfPoints,1);
    realYs = dataPoints(:,2);
    for i = 1:nrOfPoints
        vars = zeros(1,nrOfVars);
        vars(1) = dataPoints(i,1);
        for instrIndx = 1:nrOfInstructions         
            instruction = bestChrom(instrIndx,:);                   
            tmpVars = DecodeInstruction(instruction, nrOfVars, nrOfConsts, vars, consts);
            vars = tmpVars;
        end
          resultYs(i) = vars(1);         
    end
       error = CalculateError(resultYs, realYs);
       error
       
       xs = dataPoints(:,1);
       scatter(xs, resultYs)
       
       scatter()