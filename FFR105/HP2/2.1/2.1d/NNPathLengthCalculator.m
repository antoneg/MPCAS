function pathLen = NNPathLengthCalculator()
    cityLocations = LoadCityLocations();
    pathLen = 0;   

    tabuList = [];
    numNodes = size(cityLocations,1);
    
    startNode = randi(numNodes);
    tabuList(1) = startNode;
      
    %the nearest node
    for j = 1:(numNodes - 1)
    
        fromIndx = tabuList(j);
        from = cityLocations(fromIndx,:);
        minDist = Inf; 
        tmpIndx = 0;
        for i = 1:numNodes 
            if (any(tabuList(:) == i))
                continue;
            else
                to = cityLocations(i,:);
                dist = norm(from - to);
                if(dist < minDist)
                    minDist = dist;
                    tmpIndx = i;
                end
            end
        end
        tabuList(j+1) = tmpIndx; 
        pathLen = pathLen + minDist;
    end
    
    %add last distance
    startNode = tabuList(1);
    endNode = tabuList(numNodes);
    
    from = cityLocations(endNode,:);
    to = cityLocations(startNode,:);
    lastDist = norm(from - to);
    pathLen = pathLen + lastDist;
end
