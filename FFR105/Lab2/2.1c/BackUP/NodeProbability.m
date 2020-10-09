function prob = NodeProbabilities(currentNode,nextNode, pheromoneLevel, visibility, allowedList, alpha, beta)
% % 
  allowedListSize = size(allowedList,2);
  tau = ( pheromoneLevel(currentNode, nextNode) )^alpha;
  nu = ( visibility(currentNode, nextNode) )^beta;
 
  numerator = tau*nu;
%  
  denominatorSum = 0;
%  
%  pherVec = pheromoneLevel(currentNode,:);
%  visVec = visibility(currentNode,:);
%  
%  pherVec = pherVec.^alpha;
%  visVec = visVec.^beta;
%  
%  for i = 1:allowedListSize
%     allowedNodeIndex = allowedList(i);
%     denominatorSum = denominatorSum + pherVec(allowedNodeIndex)*visVec(allowedNodeIndex);
%  end
% %  denominatorSum = sum(pherVec.*visVec);
%  
%  prob = numerator/denominatorSum;
 
for i = 1:(allowedListSize)
    alternativeNode = allowedList(i);
    
    tau2 = ( pheromoneLevel(currentNode, alternativeNode) )^alpha;
    nu2 = ( visibility(currentNode, alternativeNode) )^beta;
    
    denominatorSum = denominatorSum + (tau2*nu2);
end

prob = numerator/denominatorSum;


end