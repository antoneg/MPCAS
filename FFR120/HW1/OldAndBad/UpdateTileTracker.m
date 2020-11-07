function updatedTileTracker = UpdateTileTracker(susMap, infMap, recMap)
%This is awkward hehe

updatedTileTracker = containers.Map('KeyType','double','ValueType','any');


susKeys = keys(susMap);
nrOfSus = size(susKeys,2);

 infKeys = keys(infMap);
 nrOfInf = size(infKeys,2);
 
 recKeys = keys(recMap);
 nrOfRec = size(recKeys,2);

if nrOfSus > 0
    for s = 1:nrOfSus 
       sKey = susKeys(1,s); 
       sKey = sKey{1,1};       
        
       sLocation = susMap(sKey);
       sx = sLocation(1);
       sy = sLocation(2);
       
       tileNr = (sx-1)*10 + sy;
       if(isKey(updatedTileTracker, tileNr))
           sInds = updatedTileTracker(tileNr);
           sInds(end) = sKey;
           updatedTileTracker(tileNr) = sInds;
       else
           sInds = [sKey];
           updatedTileTracker(tileNr) = sInds;
       end
       
    end
end

if nrOfInf > 0
    for i = 1:nrOfInf 
       iKey = infKeys(1,i); 
       iKey = iKey{1,1};       
        
       iLocation = infMap(iKey);
       ix = iLocation(1);
       iy = iLocation(2);
       
       tileNr = (ix-1)*10 + iy;
       if(isKey(updatedTileTracker, tileNr))
           iInds = updatedTileTracker(tileNr);
           iInds(end) = iKey;
           updatedTileTracker(tileNr) = iInds;
       else
           iInds = [iKey];
           updatedTileTracker(tileNr) = iInds;
       end
       
    end
end


if nrOfRec > 0
    for i = 1:nrOfRec 
       rKey = recKeys(1,r); 
       rKey = rKey{1,1};       
        
       rLocation = recMap(rKey);
       rx = rLocation(1);
       ry = rLocation(2);
       
       tileNr = (rx-1)*10 + ry;
       if(isKey(updatedTileTracker, tileNr))
           rInds = updatedTileTracker(tileNr);
           rInds(end) = rKey;
           updatedTileTracker(tileNr) = rInds;
       else
           rInds = [rKey];
           updatedTileTracker(tileNr) = rInds;
       end
       
    end
end
% 
%        key = allKeys(1,s);
% 
% %         key = key{1,1};
%        key = key{1,1};
% 
% for i = 1:size(allIndividuals,1);
%     
%     indIndx = allIndividuals(i,1);
%     x = allIndividuals(i,2);
%     y = allIndividuals(i,3);
%     
%     tileNr = (x-1)*10 + y;
%     if (isKey(tileTracker, tileNr))
%         tileIndividuals = tileTracker(tileNr);
%         tileIndividuals(end) = indIndx;
%         tileTracker = containers.Map(tileNr,tileIndividuals);
%     else
%         tileTracker = containers.Map(tileNr,[indIndx]);
%     end
% end
end