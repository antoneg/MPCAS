function resultYs = EvaluatePoints(chrom, nrOfVars, consts)
dataPoints = LoadFunctionData();
nrOfPoints = size(dataPoints,1);
nrOfInstructions = size(chrom,1);
resultYs = zeros(nrOfPoints,1);
for i = 1:nrOfPoints
    vars = zeros(1,nrOfVars);
    vars(1) = dataPoints(i,1);
    for instrIndx = 1:nrOfInstructions
        instruction = chrom(instrIndx,:);
        tmpVars = DecodeInstruction(instruction, nrOfVars, vars, consts);
        vars = tmpVars;
    end
    resultYs(i) = vars(1);
end
end


