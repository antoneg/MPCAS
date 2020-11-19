clear all

gridSizes = [8, 16, 32, 64, 128, 256, 512];
nrOfGridSized = size(gridSizes,2);

data = [];
p = 0.001;
f = 0.01;
timeSteps = 100000;
plotSetting = 0;
saveName = 'none';
saveD = false;
plotCounterLimit = 0;

%Returning different list sizes, so no loop.
data512 = ForestFireSim(p ,f, 512, 10000, plotSetting, saveName, saveD, plotCounterLimit);
data256 = ForestFireSim(p ,f, 256, timeSteps, plotSetting, saveName, saveD, plotCounterLimit);
data128 = ForestFireSim(p ,f, 128, timeSteps, plotSetting, saveName, saveD, plotCounterLimit);
data64 = ForestFireSim(p ,f, 64, timeSteps, plotSetting, saveName, saveD, plotCounterLimit);
data32 = ForestFireSim(p ,f, 32, timeSteps, plotSetting, saveName, saveD, plotCounterLimit);
data16 = ForestFireSim(p ,f, 16, timeSteps, plotSetting, saveName, saveD, plotCounterLimit);
data8 = ForestFireSim(p ,f, 8, timeSteps, plotSetting, saveName, saveD, plotCounterLimit);

save('ex4data.mat');

