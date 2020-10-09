function deltaTau = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
%paths är rader tydligen, lol
%haha, det är pathlength också!!
numbOfAnts = size(pathLengthCollection,1);
deltaTau = zeros(50,50);

for k = 1:numbOfAnts
    distance = pathLengthCollection(k);  
    path = pathCollection(k,:);


    for i = 1:49
        
        from = path(i);
        to = path(i+1);
        deltaTau(to,from) = deltaTau(to,from) + (1/distance);
        % deltaTau(from,to) = deltaTau(from,to) + (1/distance);
        
    end
    from = path(50);
    to = path(1);
    deltaTau(to,from) = deltaTau(to,from) + (1/distance);
    % deltaTau(from,to) = deltaTau(from,to) + (1/distance);
end

end


