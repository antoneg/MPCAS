function infectedTiles = UpdateInfectedTiles(infected)
    nrOfInfected = size(infected,1);
    infectedTiles = [];    
    for i = 1:nrOfInfected
        x = infected(i,2);
        y = infected(i,3);
        tileNr = (x-1)*10 + y;
        infectedTiles(i) = tileNr;
    end
end