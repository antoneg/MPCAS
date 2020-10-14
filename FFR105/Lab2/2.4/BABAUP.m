function fitness = BABAUP(chrom, nrOfVars, nrOfCons, consts)
    dataPoints = LoadFunctionData();
    nrOfPoints = size(dataPoints,1);
    nrOfInstructions = size(chrom,1);
    resultYs = zeros(nrOfPoints,1);
    realYs = dataPoints(:,2);
    for i = 1:nrOfPoints
        vars = zeros(1,nrOfVars);
        vars(1) = dataPoints(i,1);
        for instrIndx = 1:nrOfInstructions         
            instruction = chrom(instrIndx,:);                   
            tmpVars = DecodeInstruction(instruction, nrOfVars, nrOfCons, vars, consts);
            vars = tmpVars;
        end
          resultYs(i) = vars(1);         
    end
       error = CalculateError(resultYs, realYs);
        
       penalty = 1;
       if(size(chrom,1)>50)
        penalty = 50/(size(chrom,1));
       end
       
       fitness = (1/error)*penalty;     
end