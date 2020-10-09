function probList = NodeProbabilities(currentNode, tabuList, pheromoneLevel, visibility, alpha, beta)
probList = [];

allowedNodes = [];

allowedNodes = AllowedNodes(tabuList);


nodesLeft = size(allowedNodes,2);

tauNuSum = 0;
for i = 1:nodesLeft
    allowedNode = allowedNodes(i);
    
    t = ( pheromoneLevel(allowedNode, currentNode) )^alpha;
    n = ( visibility(allowedNode, currentNode) )^beta;
    
    fac = t*n;
    tauNuSum = tauNuSum + fac;
end

for i = 1:(nodesLeft)
    nextNode = allowedNodes(i);
    
    tau = ( pheromoneLevel(nextNode, currentNode) )^alpha;
    nu = ( visibility(nextNode, currentNode) )^beta;
    
    
    prob = (tau*nu) /tauNuSum;

    probList(i,1) = nextNode;
    probList(i,2) = prob;   
end


end