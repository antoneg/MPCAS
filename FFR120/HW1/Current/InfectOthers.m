function updatedInfected = InfectOthers(tileTracker, infected, susceptibles)
    keySet = keys(tileTracker);
    
    for i = 1:size(infected,1)
        ind = infected(i,1);
        x = infected(i,2);
        y = infected(i,3);
        
        tileNr = (x-1)*10+y;
        if(isKey(tileTracker, tileNr))
            onSameTile = tileTracker(tileNr);
            for j = 1:size(onSameTile)
                victimInd = onSameTile(j);
                du = find()
            end
        else
        end

    end
    
end