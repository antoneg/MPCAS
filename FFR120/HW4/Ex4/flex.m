clear all
graphMMatrix = GetGraphs(4);
graphMatrixCubed = graphMMatrix^3;
nrOfTriangles = trace(graphMatrixCubed);

nrOfTriangles = nrOfTriangles/6;

nrOfTriples = 0;
for i = 1:size(graphMMatrix,1)
    rowNodes = graphMMatrix(i,:);
    edges = sum(rowNodes);   
    nrOfTriples = nrOfTriples + (edges*(edges-1)/2);
end

val = (nrOfTriangles*3)/nrOfTriples;
fprintf('Clustering coefficient: %.6f',val);

plot(graph(graphMMatrix))
title('Small world')

