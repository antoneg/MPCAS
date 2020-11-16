clear all;

% p f
gridSize = 128;
plotSetting = 1;
saveName = 'nothing';

% Uncomment to run and see plot

ForestFireSim(0.001 ,0.9, gridSize, 100000, 0, 'set1', true, 10);
%ForestFireSim(0.5 ,0.001, gridSize, 100000, plotSetting, 'set2', true, 2);
%ForestFireSim(0.01 ,0.01, gridSize, 10000, plotSetting, 'set3', true, 10);
%ForestFireSim(0.001 ,0.01, gridSize, 10000, plotSetting, 'set4', true, 5);
%ForestFireSim(0.01 ,0.001, gridSize, 10000, plotSetting, 'set5', true, 5);

