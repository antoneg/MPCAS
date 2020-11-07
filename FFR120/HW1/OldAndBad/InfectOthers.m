function [updatedSus, updatedInf, updatedRec] = InfectOthers(susMap, infMap, recMap, tileTracker, bProb, yProb)
     updatedSus = containers.Map('KeyType','double','ValueType','any');
     updatedInf = containers.Map('KeyType','double','ValueType','any');
     updatedRec = containers.Map('KeyType','double','ValueType','any');
    updatedSus = susMap;
    updatedInf = infMap;
    infKeys = keys(infMap);
    nrOfInf = size(infKeys,2);
    if nrOfInf > 0
        for i = 1:nrOfInf
            infKey = infKeys(1,i);
            infKey = infKey{1,1};
            infLocation = infMap(infKey);
            infX = infLocation(1);
            infY = infLocation(2);
            
            tileNr = (infX-1)*10 + infY;
            tileNr
            %onödigt?
            if isKey(tileTracker, tileNr)
                tileKeys = tileTracker(tileNr);
                tileKeys
%                 size(tileKeys,1)
%                 size(tileKeys,2)
                nrOfTileKeys = size(tileKeys,2);
                for j = 1:nrOfTileKeys
                    sKey = tileKeys(j);
                    if isKey(susMap, sKey)
                        %place in infected and remove from sus
                        sLocation = susMap(sKey);
                        updatedInf(sKey) = sLocation;
                        remove(updatedSus, sKey);
                    end
                end
            end
            
        end
    end
    
end