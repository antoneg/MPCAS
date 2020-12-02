function meanDegree = CalculateMeanDegree(M)
edges = [];
for i = 1:size(M,1)
    rowNodes = M(i,:);
    edges(i) = sum(rowNodes);
end
meanDegree = mean(edges);
end