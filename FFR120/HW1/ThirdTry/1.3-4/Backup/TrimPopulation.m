function trimmedPop = TrimPopulation(pop, stateDelim)
    trimmedPop = [];
    for i = 1:size(pop,1)
        state = pop(i,5);
        if state == stateDelim
            trimmedPop(end+1,:) = pop(i,:);
        end
    end
end