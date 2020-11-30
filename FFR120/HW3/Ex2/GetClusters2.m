function clusters = GetClusters2(particles, distances, R)
nrOfParticles = size(particles, 1);
globalVisited = zeros(1,nrOfParticles);
% Every particle, i, is part of a cluster.
for i = 1:nrOfParticles
    pDists = distances(i,:);
    pCluster = [];
    visited = zeros(1,nrOfParticles);
    
    visited(i) = 1; 
    pCluster(1) = i;
    c = 2;
    if globalVisited(i) == 0
    for j = 1:nrOfParticles
        d = pDists(j);
        
        %.. j is part of the cluster
        if (d <= (2*(R+0.15))) && (j ~= i) %(skip to itself)
            pCluster(1,c) = j;
            visited(j) = 1; 
            c = c+1;
            globalVisited(i) = 1;
            globalVisited(j) = 1;
        end
    end

    queue = pCluster;
    while size(queue,2) > 0
        pIndx = queue(1);
        for q = 1:nrOfParticles
            d = distances(pIndx,q);
            if (d <= (2*(R+0.15))) && (pIndx ~= q) && visited(q) == 0% as long as d < rexp, not to itself, or already visited
                queue(end + 1) = q;
                pCluster(end + 1) = q;
                globalVisited(q) = 1;
                visited(q) = 1;
            end
       end
        
        queue(1) = [];
    end

    end
    clusterSize = size(pCluster,2);
    nrOfZeros = nrOfParticles - clusterSize;
    clusters(i,:) = [pCluster,(zeros(1,nrOfZeros))];
end
end
