
function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
nrOfNodes = size(visibility,1);

tabuList = ones(1,nrOfNodes); % 1 = allowed, 0 = tabu
probList = [];

startNode = randi(nrOfNodes);
currentNode = startNode;
tabuList(startNode) = 0;
path(1) = startNode;

for i = 1:(nrOfNodes-1)
    probList = NodeProbabilities(currentNode, tabuList, pheromoneLevel, visibility, alpha, beta);
    
    nextNode = RouletteSelection(probList);
    path(i+1) = nextNode;
    tabuList(nextNode) = 0;
    
    currentNode = nextNode;
end
end