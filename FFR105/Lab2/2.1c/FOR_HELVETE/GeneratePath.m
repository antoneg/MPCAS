
function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
    tabuList = ones(1,50);
    probList = [];
    startNode = randi(50);
    currentNode = startNode;
    tabuList(startNode) = 0;
  

    path(1) = startNode;
    
    
    
    
    
    
    for i = 1:49 %49 walks       
        probList = NodeProbabilities(currentNode, tabuList, pheromoneLevel, visibility, alpha, beta);
        
        nextNode = RouletteSelection(probList, currentNode);
        path(i+1) = nextNode;
        tabuList(nextNode) = 0;
    
        currentNode = nextNode;
    end
end