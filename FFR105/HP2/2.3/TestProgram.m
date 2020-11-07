function TestProgram()
%Press run. The slope is random. If you want to change that, 
% and instead try a specific slope - you do that by 
% hardcode iSlope and iData in line 16:
% backlog = GetBacklogData(bestChrom, nrOfHiddenNeurons, iDataSet, iSlope);

bestChrom = GetBestChromosome();
nrOfHiddenNeurons = 5;

iDataSet = randi([1,3],1,1);
if iDataSet == 1
    iSlope = randi([1,10],1,1);
else
    iSlope = randi([1,5],1,1);
end
backlog = GetBacklogData(bestChrom, nrOfHiddenNeurons, iDataSet, iSlope);

xs = backlog(:,1);
alphas = backlog(:,2);
pressures = backlog(:,3);
gears = backlog(:,4);
velocities = backlog(:,5); 
braketemps = backlog(:,6);

% Alpha
nexttile
plot(xs,alphas)
title('Alpha')

% Pressure
nexttile
plot(xs,pressures)
title('Pressure')

% Gear
nexttile
plot(xs,gears)
title('Gear')

% Velocity
nexttile
plot(xs,velocities)
title('Velocity')

% Braketemp
nexttile
plot(xs,braketemps)
title('Brake temperature')
end