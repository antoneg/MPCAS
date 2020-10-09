function node = GetNode(tabuList, pheromoneLevel, visibility, alpha, beta)

 probList = [];
 tabuListSize = size(tabuList,2);
 currentNode = tabuList(tabuListSize);
 
 allowedList = AllowedNodes(tabuList);
 for i = 1:(50-tabuListSize)
    allowedNode = allowedList(i);
    probList(i,1) =  allowedNode;
    probList (i,2) = NodeProbability(currentNode,allowedNode, pheromoneLevel, visibility, allowedList, alpha, beta); 
 end
    node = RouletteSelection(probList);
    
end
