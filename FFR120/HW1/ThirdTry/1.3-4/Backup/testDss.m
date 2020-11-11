popSize = 1000;
timeSteps = 1000;
dProb = 0.8;
bProb = 0.6;
yProb = 0.01;
initInfected = 10;
plotSelection = 3; % 4: plot nothing, 


[susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, yProb, initInfected, plotSelection);