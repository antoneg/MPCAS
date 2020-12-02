clear all

gIndx = 3;

graphData = GetGraphs(gIndx);
graphMatrix = sparse(graphData(:,1),graphData(:,2),1);
graphMatrix = full(graphMatrix);
[diam, avrgDist] = DistanceAnalysis(graphMatrix);
cc = ClusterCoeffAnalysis(graphMatrix);
 
fprintf('Average dist: %.5f \n',avrgDist);
fprintf('Diameter: %.1f \n',diam);
fprintf('Clustering coefficient: %.6f \n',cc);
fprintf('Nr of nodes: %.6f \n',size(graphMatrix,1));
figure(1)
PlotDegreDist(graphMatrix)
figure(2)
InvCumDegreDist(graphMatrix);
figure(3)
plot(graph(graphMatrix))
title(['Network ', num2str(gIndx)])

save(num2str(gIndx)) 


