clear all;

% p f
gridSize = 128;
plotSetting = 0;
timeSteps = 100000;
p = 0.001;
f = 0.01;

ForestFireSim(0.001 ,0.9, gridSize, timeSteps, plotSetting, 'set1', true, 10);
ForestFireSim(0.001 ,0.01, gridSize, timeSteps, plotSetting, 'set2', true, 5);
ForestFireSim(0.001 ,0.45, gridSize, timeSteps, plotSetting, 'set3', true, 5);

