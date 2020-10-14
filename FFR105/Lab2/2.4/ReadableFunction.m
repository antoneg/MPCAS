function gx = ReadableFunction(chrom, nrOfVars, nrOfCons, consts)
    dataPoints = LoadFunctionData();
    nrOfPoints = size(dataPoints,1);
    nrOfInstructions = size(chrom,1);
%     resultYs = zeros(nrOfPoints,1);
%     realYs = dataPoints(:,2);
    for i = 1:nrOfPoints     
        vars(1) = sym('x');
        for v = 2:nrOfVars
            vars(v) = 0;
        end
        for instrIndx = 1:nrOfInstructions         
            instruction = chrom(instrIndx,:);                   
            tmpVars = DecodeInstruction(instruction, nrOfVars, nrOfCons, vars, consts);
            vars = tmpVars;
        end         
    end
        gx = vars(1);
        gx = simplify(gx);
end