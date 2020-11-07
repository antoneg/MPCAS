function tileTracker = UpdateTileTracker(allIndividuals, oldTileTracker)

tileTracker = oldTileTracker;
for i = 1:size(allIndividuals,1);
    
    indIndx = allIndividuals(i,1);
    x = allIndividuals(i,2);
    y = allIndividuals(i,3);
    
    tileNr = (x-1)*10 + y;
    if (isKey(tileTracker, tileNr))
        tileIndividuals = tileTracker(tileNr);
        tileIndividuals(end) = indIndx;
        tileTracker = containers.Map(tileNr,tileIndividuals);
    else
        tileTracker = containers.Map(tileNr,[indIndx]);
    end
end
end