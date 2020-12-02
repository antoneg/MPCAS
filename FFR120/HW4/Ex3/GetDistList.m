function [distList, degreList] = GetDistList(M)
n = size(M,1);
distList = zeros(n,1);
totNrOfConnections = 0;

for i = 1:n
    nodeRow = M(i,:);
    nodeRow = nodeRow(nodeRow~=0);
    nrOfEdges = size(nodeRow,2);
    distList(i) = nrOfEdges;
    totNrOfConnections = totNrOfConnections + nrOfEdges;
end
%     distList = sortrows(distList,2);
degreList = distList;
distList(:) = distList(:)./totNrOfConnections;
end