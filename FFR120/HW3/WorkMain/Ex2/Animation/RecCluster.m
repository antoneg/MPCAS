function [updatedVisited, cluster] = RecCluster(particles, distances, R, pIndx, visited)
    %look for neigbours to i
    cluster = [];
    updatedVisited = visited;
    nrOfParticles = size(particles,1);
    j = 1;
    for i = 1:nrOfParticles
        d = distances(i);
        
        if (d <= (2*(R+0.15))) && (pIndx ~= i) && (updatedVisited(i) == 0)
            updatedVisited(i) = 1;
            % add i to cluster
           cluster(j) = i;         
           [updatedVisited, recClus] =  RecCluster(particles, distances, R, i, updatedVisited);

           cluster = [i,recClus]; %hmm
           
           j = size(cluster,1) + 1; 
        end
    end
end