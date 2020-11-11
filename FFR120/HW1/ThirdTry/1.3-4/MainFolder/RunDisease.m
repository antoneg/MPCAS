popSize = 1000;
timeSteps = 1000;
dProb = 0.8;
bProbList = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];
bProbListSize = size(bProbList,2);


initInfected = 10;
plotSelection = 4;  % 4: plot nothing,
                    % 3: plot only 2nd figure,
                    % 2: plot 1st fig at  t = 100 and 2nd fig,
                    % 1: plot 1st fig at every 100 timesteps and 2nd fig

runs = 10;


ks = [1:3:123];
kRuns = size(ks,2);


allRecData = zeros(bProbListSize,runs,kRuns);
allInfData = zeros(bProbListSize,runs,kRuns);
allSusData = zeros(bProbListSize,runs,kRuns);

for bi = 1:bProbListSize
    bProb = bProbList(bi);  
    disp("bProb: " + bProb);
    for r = 1:runs
        disp("r: " + r);
        for k = 1:kRuns
            kVal = ks(k);
            y = bProb/kVal;
            [susData, infData, recData] = OPTDiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
            allRecData(bi,r,k) = recData(1000);
            allSusData(bi,r,k) = susData(1000);
            allInfData(bi,r,k) = infData(1000);
        end
    end
end


disp("END");
save('myData.mat');

