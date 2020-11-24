function clusters = GetClusters(particles, distances, R)
    
    nrOfParticles = size(particles, 1);
    clusters = zeros(nrOfParticles, nrOfParticles);
    
    for i = 1:nrOfParticles
        pDists = distances(i,:); 
        for j = 1:nrOfParticles
            d = pDists(j);
            if (d <= (2*(R+0.1))) && (j ~= i)
                clusters(i,j) = 1;
            end
        end
    end
end