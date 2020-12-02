function cc = ClusterCoeffAnalysis(graphMMatrix)

graphMatrixCubed = graphMMatrix^3;
nrOfTriangles = trace(graphMatrixCubed);

nrOfTriangles = nrOfTriangles/6; %2*3 permutations and direction

nrOfTriples = 0;
for i = 1:size(graphMMatrix,1)
    rowNodes = graphMMatrix(i,:);
    edges = sum(rowNodes);   
    nrOfTriples = nrOfTriples + (edges*(edges-1)/2);
end

cc = (nrOfTriangles*3)/nrOfTriples;


end