function [maxDist, avrgDist] = DistanceAnalysis(graphMatrix)

nrOfNodes = size(graphMatrix,1);
 
 totShortestDists = 0;
 maxDist = 0; 
 for i = 1:nrOfNodes
 distList = BreadthFirstSearch(i, graphMatrix);
%  disp([num2str(100*i/nrOfNodes), '% completed'])
 localMax = max(distList);
 if localMax > maxDist
    maxDist = localMax;
 end
 totShortestDists = totShortestDists + sum(distList);
 end
 
 avrgDist = (totShortestDists)/(nrOfNodes*(nrOfNodes-1));

end