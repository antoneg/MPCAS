function deltaTau = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
   %paths är rader tydligen, lol
   %haha, det är pathlength också!!
    numbOfAnts = size(pathLengthCollection,1);
 
    deltaTau = zeros(50,50);
for k = 1:numbOfAnts
    distance = pathLengthCollection(k);
    
    path = pathCollection(k,:);
    
    for i = 1:50
        if(i ~= 50)
            from = path(i);
            to = path(i+1);
            deltaTau(from,to) = deltaTau(from,to) + (1/distance);
        else
            from = path(50);
            to = path(1);
            deltaTau(from,to) = deltaTau(from,to) + (1/distance);
        end
    end
end