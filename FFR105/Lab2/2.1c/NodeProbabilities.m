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
% tabuListSizeCol = size(tabuList,2)
% tabuListSizeRow = size(tabuList,1)

taus = pheromoneLevel(allowedNodes,currentNode);
nus = visibility(allowedNodes, currentNode);
% tabuList
% taus
% nus

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
    
    tau = ( pheromoneLevel(nextNode, currentNode) )^alpha;
    nu = ( visibility(nextNode, currentNode) )^beta;
    
    
    prob = (tau*nu) /tauNuSum;
    if(tauNuSum == 0)
        error("Division by zero")
    end
    probList(i,1) = nextNode;
    probList(i,2) = prob;
    %After a high number of iterations, some pheromone levels will be
    %too small for matlab to handle, producing NaN as a result of the calculation is 0/0. When this happens, the number of
    %nodes left to visit seems to be small.   If threre's only one possible node left, this will not matter.
    %However in cases where nodes left > 1, it will matter. Thus, these
    %will be set to prob=0 here. Function RouletteSelection takes this into
    %account.
    %
    % Sorry for wall of text, have a nice day :D
    

        

       
    
end


end