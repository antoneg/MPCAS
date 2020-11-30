function distances = GetDistances(particles, indx)
nrOfParticles = size(particles,1);
distances = zeros(nrOfParticles,1);
fromX = particles(indx, 1);
fromY = particles(indx, 2);

for i = 1:nrOfParticles
        toX = particles(i,1);
        toY = particles(i,2);
        xDiff = fromX - toX;
        yDiff = fromY - toY;
        distances(i) = norm([xDiff, yDiff]); 
end

end