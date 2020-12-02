function PlotDegreDist(M, n, p)
    edgesTotalList = zeros(n-1,1);
    for i = 1:(size(M,1))
        nodeRow = M(i,:);
        nodeRow = nodeRow(nodeRow~=0);
        nrOfEdges = size(nodeRow,2);
        
        edgesTotalList(nrOfEdges) = edgesTotalList(nrOfEdges)+1;
    end    
    plot((1:n-1), (edgesTotalList./n), 'r')

end