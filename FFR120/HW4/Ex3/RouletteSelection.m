function indx = RouletteSelection(distList)
    nrOfNodes = size(distList,1);
    indx = 0;
    runningSum = 0;
    i = 0;
    r = rand;
    while indx == 0
        i = i+1;
        p = distList(i);
        runningSum = runningSum + p;
        if runningSum > r
            indx = i;
        end
        if i == nrOfNodes
            i = 0;
        end
    end
end