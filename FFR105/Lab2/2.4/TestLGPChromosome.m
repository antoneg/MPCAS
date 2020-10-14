%This takes a few seconds
function TestLGPChromosome()
nrOfVars = 6;
nrOfConsts = 2;
consts = [-2,3];

bestChrom = BestChromosome();
fitness = EvaluateIndividual(bestChrom, nrOfVars, nrOfConsts, consts);

%Points
realPoints = LoadFunctionData();
realYs = realPoints(:,2);
xs = realPoints(:,1);
resultYs = EvaluatePoints(bestChrom, nrOfVars, nrOfConsts, consts);

% Real data points
nexttile
scatter(xs,realYs,'r')
title('Real data points')

% Best fit
nexttile
scatter(xs,resultYs, 'g')
title('Best fit')

error = CalculateError(resultYs, realYs);
gx = ReadableFunction(bestChrom, nrOfVars, nrOfConsts, consts);
disp("Fitness: " + fitness);
disp("Error: " + error);
fprintf('g(x): %s \n', char(gx));

end