function pop = InfectRecover(population, infPop, tileTracker, bProb, yProb)
    nrOfInfected = size(infPop,1);
    pop = population;
    for i = 1:nrOfInfected
        infX = infPop(i,3);
        infY = infPop(i,4);
        tileNr = (infX-1)*100+infY;      
        r = rand;
       
        if r < bProb
            victims = tileTracker(tileNr);
            nrOfVictims = size(victims,2);
            
            for v = 1:nrOfVictims
                vIndx = victims(v);
                if pop(vIndx,5) == 3
                   pop(vIndx, 5) = 3;
                else
                pop(vIndx, 5) = 2;
                end
            end
        end
        r2 = rand;
        if r2 < yProb
            recIndx = infPop(i,1);
            pop(recIndx,5) = 3;
 
        end
    end
end