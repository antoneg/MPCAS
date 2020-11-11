popSize = 1000;
timeSteps = 1000;
dProb = 0.8;
bProb = 0.9; %big beta

initInfected = 10;
plotSelection = 4;  % 4: plot nothing,
                    % 3: plot only 2nd figure,
                    % 2: plot 1st fig at  t = 100 and 2nd fig,
                    % 1: plot 1st fig at every 100 timesteps and 2nd fig

runs = 10;
innerRuns = 60;
allRecData = zeros(innerRuns,timeSteps,runs);
allInfData = zeros(innerRuns,timeSteps,runs);
allSusData = zeros(innerRuns,timeSteps,runs);
for r = 1:runs
     disp(r);
    for i = 1:innerRuns 
        y = i*0.001 - 0.001;
        [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
        
        allRecData(i,:,r) = recData;
        allSusData(i,:,r) = susData;
        allInfData(i,:,r) = infData;      
    end
end

% 
% allRecData = zeros(3,1000);
% allInfData = zeros(3,1000);
% allSusData = zeros(3,1000);
% 
% allRecData1 = zeros(3,1000);
% allInfData1 = zeros(3,1000);
% allSusData1 = zeros(3,1000);
% 
% 
% allRecData2 = zeros(3,1000);
% allInfData2 = zeros(3,1000);
% allSusData2 = zeros(3,1000);
% 
% allRecData3 = zeros(3,1000);
% allInfData3 = zeros(3,1000);
% allSusData3 = zeros(3,1000);
% 
% allRecData4 = zeros(3,1000);
% allInfData4 = zeros(3,1000);
% allSusData4 = zeros(3,1000);
% 
% allRecData5 = zeros(3,1000);
% allInfData5 = zeros(3,1000);
% allSusData5 = zeros(3,1000);
% 
% allRecData6 = zeros(3,1000);
% allInfData6 = zeros(3,1000);
% allSusData6 = zeros(3,1000);
% 
% allRecData7 = zeros(3,1000);
% allInfData7 = zeros(3,1000);
% allSusData7 = zeros(3,1000);
% 
% allRecData8 = zeros(3,1000);
% allInfData8 = zeros(3,1000);
% allSusData8 = zeros(3,1000);
% 
% allRecData9 = zeros(3,1000);
% allInfData9 = zeros(3,1000);
% allSusData9 = zeros(3,1000);
% for i = 1:30
%     y = i*0.002;
%     [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
%     
%     allRecData(i,:) = recData;
%     allSusData(i,:) = susData;
%     allInfData(i,:) = infData;
%     
%     allInfData(i,1000) + allRecData(i,1000)
%     i
% end
% 
% 
% for i = 1:30
%     y = i*0.002;
%     [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
%     
%     allRecData1(i,:) = recData;
%     allSusData1(i,:) = susData;
%     allInfData1(i,:) = infData;
%     
%     allInfData1(i,1000) + allRecData1(i,1000)
%     i
% end
% 
% for i = 1:30
%     y = i*0.002;
%     [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
%     
%     allRecData2(i,:) = recData;
%     allSusData2(i,:) = susData;
%     allInfData2(i,:) = infData;
%     
% end
% 
% for i = 1:30
%     y = i*0.002;
%     [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
%     
%     allRecData3(i,:) = recData;
%     allSusData3(i,:) = susData;
%     allInfData3(i,:) = infData;
%     
% end
% 
% for i = 1:30
%     y = i*0.002;
%     [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
%     
%     allRecData4(i,:) = recData;
%     allSusData4(i,:) = susData;
%     allInfData4(i,:) = infData;
%     
% end
% 
% for i = 1:30
%     y = i*0.002;
%     [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
%     
%     allRecData5(i,:) = recData;
%     allSusData5(i,:) = susData;
%     allInfData5(i,:) = infData;
%     
% end
% 
% for i = 1:30
%     y = i*0.002;
%     [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
%     
%     allRecData6(i,:) = recData;
%     allSusData6(i,:) = susData;
%     allInfData6(i,:) = infData;
%     
% end
% 
% for i = 1:30
%     y = i*0.002;
%     [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
%     
%     allRecData7(i,:) = recData;
%     allSusData7(i,:) = susData;
%     allInfData7(i,:) = infData;
%     
% end
% 
% for i = 1:30
%     y = i*0.002;
%     [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
%     
%     allRecData8(i,:) = recData;
%     allSusData8(i,:) = susData;
%     allInfData8(i,:) = infData;
%     
% end
% 
% for i = 1:30
%     y = i*0.002;
%     [susData, infData, recData] = DiseaseAnalysis(popSize, timeSteps, dProb, bProb, y, initInfected, plotSelection);
%     
%     allRecData9(i,:) = recData;
%     allSusData9(i,:) = susData;
%     allInfData9(i,:) = infData;
%     
% end

disp("END");
save('allDataBiggerBeta.mat');

