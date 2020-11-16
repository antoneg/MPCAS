
gridSize = 128;

SET1 = load('set1.mat');
SET2 = load('set2.mat');

SET1_fire = SET1.plotData(:,1);
SET2_fire = SET2.plotData(:,1);

denseLike = load('denseLike.mat');
SET1_denseLike = denseLike.SET1_recreatedClusters;
SET2_denseLike = denseLike.SET2_recreatedClusters;

p1 = SET1.p;
f1 = SET1.f;

p2 = SET2.p;
f2 = SET2.f;

figure(1)
PlotLogLog(SET1_fire, gridSize,'r.');
hold on
PlotLogLog(SET1_denseLike, gridSize, 'g.');
legend('Simulation', 'Random forest with similar density')
title(['p = ' num2str(p1) ', f = ' num2str(f1)] );

figure(2)
PlotLogLog(SET2_fire, gridSize,'r.');
hold on
PlotLogLog(SET2_denseLike, gridSize, 'g.');
legend('Simulation', 'Random forest with similar density')
title(['p = ' num2str(p2) ', f = ' num2str(f2) ]);

% 
% relativeFireSizes = data.plotData(:,1);
% trees = data.plotData(:,2);
% allTrees = trees; %Use this for later
% 
% % ---------Plot log log graph from sim------------
% burnedTrees = burnedTrees./(gridSize^2); % relative fire size
% burnedTrees = sort(burnedTrees, 'descend');
% 
% %cCDF
% cCDF = burnedTrees;
% 
% nrOfBurnedTrees = size(burnedTrees,1);
% for i = 1:nrOfBurnedTrees
%     cCDF(i) = i/nrOfBurnedTrees;
% end
% 
% figure(200)
% xmin = burnedTrees(end);
% plot(burnedTrees, cCDF, 'r.')
% set(gca, 'YScale', 'log')
% set(gca, 'XScale', 'log')
% xlim([xmin 1])
% xlabel('Relative fire size')
% ylabel('cCDF')
% hold on % Hold on for next
% %----------------------------------
% 
% %Recreate dense like forests and set them on fire---------
% nrOfPreClusters = size(trees, 1);
% nrOfLocations = gridSize^2;
% recreatedClusters = zeros(nrOfPreClusters, 1);
% allTrees = sort(allTrees);
% nrOfPreClusters
% for i = 1:nrOfPreClusters
%     forestDensityProb = (allTrees(i)/(gridSize^2));
%     forestDensityProb
%      locationStatus = zeros(nrOfLocations,2); %0 empty, 1, tree, 2 fire
%      locationStatus(1:nrOfLocations,1) = [1:nrOfLocations];
%     
%     %Initialize forest
%     for l = 1:nrOfLocations
%         r = rand;
%         if r < forestDensityProb
%             locationStatus(l,2) = 1;
%         else
%             locationStatus(l,2) = 0;
%         end
%     end
%     
%     %Get list of treeLocations
% 
%     [emptyLocations, treeLocations, fireLocations] = TrimStatusList(locationStatus);
%  
%     %Select a random tree to strike
%     nrCompTrees = size(treeLocations, 1);
%     rIndx = randi([1, nrCompTrees]);
%     strikeLoc = treeLocations(rIndx);
%     
%     %Burn cluster of trees and retrieve the size of the cluster
%  
%     [cluster, locationStatus] = BurnNeighbours(locationStatus, strikeLoc, gridSize);
% 
%     
%     clusterSize = size(cluster, 2);
%     recreatedClusters(i) = clusterSize;
%     
%     
%     i
% end
% 
% %Repeat procedure
% 
% recreatedClusters = recreatedClusters./(gridSize^2); % relative fire size
% recreatedClusters = sort(recreatedClusters, 'descend');
% 
% %cCDF
% cCDF2 = recreatedClusters;
% 
% % nrOfBurnedTrees = size(burnedTrees,1);
% for i = 1:nrOfPreClusters
%     cCDF2(i) = i/nrOfPreClusters;
% end
% 
% xmin = recreatedClusters(end);
% plot(recreatedClusters, cCDF2, 'g.')
% save('plotData.mat');
