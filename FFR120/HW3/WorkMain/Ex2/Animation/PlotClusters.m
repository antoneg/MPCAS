function  PlotClusters(clusters, particles)
        nrOfParticles = size(particles,1);
    
    for i = 1:nrOfParticles
        localCluster = clusters(:,i);
        localCluster = find(localCluster);
        
        for j = 1:size(localCluster,1)
        pIndx = localCluster(j);
            
        x = particles(pIndx,1);
        y = particles(pIndx,2);
        plot(x,y,'bo', 'MarkerSize', 4);
        end

    end
    
end