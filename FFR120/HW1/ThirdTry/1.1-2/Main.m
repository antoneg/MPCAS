popSize = 1000;
timeSteps = 1000;
dProb = 0.8;
bProb = 0.1;
yProb = 0.02;
initInfected = 100;
plotSelection = 2; % 4: plot nothing, 
                   % 3 plot only 2nd figure, 
                   % 2 plot 1st fig at  t = 100 and 2nd fig, 
                   % 1 plot 1st fig at every 100 timesteps and 2nd fig

[susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, yProb, initInfected, plotSelection);





