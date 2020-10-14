function probList = NodeProbabilities(currentNode, tabuList, pheromoneLevel, visibility, alpha, beta)
probList = [];
%     tabuListSize = size(tabuList,2);
%     currentNode = tabuList(tabuListSize);
%
%     allowedNodes = AllowedNodes(tabuList);
%
%     ps = pheromoneLevel.^alpha;
%     vs = visibility.^beta;
%
%     ws = ps.*vs;
%
%
%    w = ws(currentNode,allowedNodes);
%
%    wSum = sum(w);
%
%     for i = 1:50-tabuListSize
%          nextNode = allowedNodes(i);
%
%
%          tau = ( pheromoneLevel(currentNode, nextNode) )^alpha;
%          nu = ( visibility(currentNode, nextNode) )^beta;
%
%
%          n = tau*nu;
%          d = wSum;
%         format long, p = n/d;
%          probList(i,1) = nextNode;
%          probList(i,2) = p;
%
%
%     end
allowedNodes = [];

tabuListSize = size(tabuList,2);
%currentNode = tabuList(tabuListSize);
allowedNodes = AllowedNodes(tabuList);


taus = pheromoneLevel(currentNode, allowedNodes);
nus = visibility(currentNode, allowedNodes);

tausAlpha = taus.^alpha;
nusBeta = nus.^beta;

tausXnus =  tausAlpha.*nusBeta;

tauNuSum = sum(tausXnus);

nodesLeft = size(allowedNodes,2);


for i = 1:(nodesLeft)
    nextNode = allowedNodes(i);
    %         if(nextNode == 1)
    %
    %             pheromoneLevel(currentNode, nextNode)
    %             visibility(currentNode, nextNode)
    %
    %         end
    
    tau = ( pheromoneLevel(currentNode, nextNode) )^alpha;
    nu = ( visibility(currentNode, nextNode) )^beta;
    
    probList(i,1) = nextNode;
    prob = (tau*nu) /tauNuSum;
    
    %After a high number of iterations, some pheromone levels will be
    %too small for matlab to handle, producing NaN as a result of the calculation is 0/0. When this happens, the number of
    %nodes left to visit seems to be small.   If threre's only one possible node left, this will not matter.
    %However in cases where nodes left > 1, it will matter. Thus, these
    %will be set to prob=0 here. Function RouletteSelection takes this into
    %account.
    %
    % Sorry for wall of text, have a nice day :D
    
    if isnan(prob)
        probList(i,2) = 0;
    else
        probList(i,2) = prob;
    end
    
    
    
    
    
end

%     checkSum = sum(probList(:,2));
%     for j = 1:nodesLeft
%         if isnan(checkSum)
%             currentNode
%             allowedNodes
%             probList
%         end
%     end

end