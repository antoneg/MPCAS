function deltaTau = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
numbOfAnts = size(pathLengthCollection,1);
nrOfNodes = size(pathCollection,2);
deltaTau = zeros(nrOfNodes,nrOfNodes);

for k = 1:numbOfAnts
    distance = pathLengthCollection(k);
    path = pathCollection(k,:);
    
    for i = 1:(nrOfNodes-1)
        
        from = path(i);
        to = path(i+1);
        deltaTau(to,from) = deltaTau(to,from) + (1/distance);
        
    end
    from = path(nrOfNodes);
    to = path(1);
    deltaTau(to,from) = deltaTau(to,from) + (1/distance);
end

end




