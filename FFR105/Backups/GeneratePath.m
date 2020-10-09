function path = GeneratePath(pheromoneLevel, visibility, alpha, beta)
    tabuList = [];
    probList = [];
    startNode = randi(50);
    currentNode = startNode;
    tabuList(1) = currentNode;
    path(1) = startNode;
    for i = 1:49 %49 walks
        
        nextNode = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta);
        path(i+1) = nextNode;
        tabuList(i+1) = nextNode;
    end

end