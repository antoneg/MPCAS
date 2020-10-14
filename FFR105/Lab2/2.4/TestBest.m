bestChrom = BestHaha();
nrOfOperators = 4;
nrOfVars = 6;
nrOfConsts = 2;
nrOfRegs = nrOfVars + nrOfConsts;
consts = [-2,3];
syms x
% function fn = FunctionOfChromosome(bestChrom, )

    dataPoints = LoadFunctionData();
    nrOfPoints = size(dataPoints,1);
    nrOfInstructions = size(bestChrom,1);
    resultYs = zeros(nrOfPoints,1);
    realYs = dataPoints(:,2);
    vars = [];
    for i = 1:nrOfPoints
        
        vars = [sym('x'),0,0,0,0,0];
        for instrIndx = 1:nrOfInstructions         
            instruction = bestChrom(instrIndx,:);                   
            tmpVars = DecodeInstruction(instruction, nrOfVars, nrOfConsts, vars, consts);
            vars = tmpVars;
        end
        %   resultYs(i) = vars(1);         
    end
         vars(1)
          fn = simplify(vars(1));
          fn
          fplot(fn);
          hold on 
          xs = dataPoints(:,1);
          scatter(xs, realYs);
          hold off
%        error = CalculateError(resultYs, realYs);
%        error
%        
%        xs = dataPoints(:,1);
%        scatter(xs, resultYs)
%        
%        scatter()