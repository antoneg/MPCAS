clear all;
p = 0.001;
f = 0.01;
gridSize = 128;
timeSteps = 100000;
plotSetting = 0;
saveName = 'skitData';
plotData = ForestFireSim(p ,f, gridSize, timeSteps, plotSetting, saveName);

