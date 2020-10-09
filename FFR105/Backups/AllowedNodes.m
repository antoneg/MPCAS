function allowedList = AllowedNodes(tabuList)
    %size hmm
    allowedListIndex = 1;
    for i = 1:50
        if any(tabuList(:) == i)
            continue
        else
            allowedList(allowedListIndex) = i;
            allowedListIndex = allowedListIndex + 1;
        end
    end
end