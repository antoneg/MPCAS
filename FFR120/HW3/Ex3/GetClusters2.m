function clusters = GetClusters2(particles, distances, R)
nrOfParticles = size(particles, 1);
globalVisited = zeros(1,nrOfParticles);
% Every particle, i, is part of a cluster.
for i = 1:nrOfParticles
    pDists = distances(i,:);
    pCluster = [];
    visited = zeros(1,nrOfParticles);
    
    visited(i) = 1; %hmm
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
    %now, we must add neigbours neigbours.. we can think pCluster as a queue
    %q
    %to check. 
    queue = pCluster;
%     size(queue,2)
%     queue
    
    while size(queue,2) > 0
        pIndx = queue(1);
        for q = 1:nrOfParticles
%             pIndx
%             q
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
% function clusters = GetClusters2(particles, distances, R)
%     nrOfParticles = size(particles, 1);
%     clusters = [];
%     visited = zeros(nrOfParticles,1);
%
%     for i = 1:nrOfParticles
%         initCl = zeros(nrOfParticles);
%         initCl(i) = i; %always add self to cluster
%         visited(i) = 1;
%         pDists = distances(i,:);
%         [visited, tmpCluster] = RecCluster(particles, pDists, R, i, visited);
%
%         clusterSize = size(tmpCluster,2); %hm
%         nrOfZeros = nrOfParticles-clusterSize;
%
%         if nrOfZeros > 0
%             clusters(i,:) = [tmpCluster,zeros(1,nrOfZeros)];
%         else
%             clusters(i,:) = tmpCluster; %Highly unlikely
%         end
%     end
% end
%     nrOfParticles = size(particles, 1);
%     clusters = zeros(nrOfParticles, nrOfParticles);
%
%     for i = 1:nrOfParticles
%         pDists = distances(i,:);
%         for j = 1:nrOfParticles
%             d = pDists(j);
%             if (d <= (2*(R+0.15))) && (j ~= i)
%                 clusters(i,j) = 1;
%                 clusters(i,:) = clusters(i,:) | (GetClusterCol(particles, distances, R, j));
%             end
%         end
%     end
