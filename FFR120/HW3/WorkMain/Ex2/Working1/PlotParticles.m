function PlotParticles(particles)
    nrOfParticles = size(particles,1);
    
    for i = 1:nrOfParticles
        x = particles(i,1);
        y = particles(i,2);

         plot(x,y,'ro', 'MarkerSize', 4);
%         plot(x,y,'ro');
        hold on
    end
     hold off
end