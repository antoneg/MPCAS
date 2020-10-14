function probList = NodeProbabilities(currentNode, tabuList, pheromoneLevel, visibility, alpha, beta)
probList = [];
allowedNodes = [];

tabuListSize = size(tabuList,2);

allowedNodes = AllowedNodes(tabuList);

taus = pheromoneLevel(allowedNodes,currentNode);
nus = visibility(allowedNodes, currentNode);

tausAlpha = taus.^alpha;
nusBeta = nus.^beta;

tausXnus =  tausAlpha.*nusBeta;
tauNuSum = sum(tausXnus);

nodesLeft = size(allowedNodes,2);

for i = 1:(nodesLeft)
    nextNode = allowedNodes(i);
    
    tau = ( pheromoneLevel(nextNode, currentNode) )^alpha;
    nu = ( visibility(nextNode, currentNode) )^beta;   
    
    prob = (tau*nu) /tauNuSum;

    probList(i,1) = nextNode;
    probList(i,2) = prob;
end

end