clear all
graphMMatrix = GetGraphs(4); %4smallworld
% graphMMatrix = [0 1 0 0 0 0; 1 0 0 1 0 1; ]
nrOfNodes = size(graphMMatrix,1);
graphSmallWorld = graph(graphMMatrix);
 allShortestPaths = zeros(nrOfNodes,nrOfNodes);
 
 totShortestDists = 0;
 currentMax = 0; 
 for i = 1:nrOfNodes
 distList = BreadthFirstSearch(i, graphMMatrix);
 localMax = max(distList);
 if localMax > currentMax
    currentMax = localMax;
 end
 totShortestDists = totShortestDists + sum(distList);
 end
 avrPathLen = (totShortestDists)/(nrOfNodes*(nrOfNodes-1));
 fprintf('Average dist  in small world: %.5f \n',avrPathLen);
 fprintf('Max distance in small world: %.1f \n',currentMax);
 plot(graph(graphMMatrix))
