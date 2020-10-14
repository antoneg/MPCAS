function allowedList = AllowedNodes(tabuList)
    %size hmm
    allowedList = [];
    allowedIndx = 1;
    for i = 1:size(tabuList,2)
        if(tabuList(i) == 1)
            allowedList(allowedIndx) = i;
            allowedIndx = allowedIndx +1;
        end
    end
end