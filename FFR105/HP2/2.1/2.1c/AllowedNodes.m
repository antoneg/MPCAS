%This function returns what nodes are not in the tabulist for a given node.
function allowedList = AllowedNodes(tabuList)

allowedList = [];
allowedIndx = 1;
for i = 1:size(tabuList,2)
    if(tabuList(i) == 1)
        allowedList(allowedIndx) = i;
        allowedIndx = allowedIndx +1;
    end
end
end