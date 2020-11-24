nrOfParticles = 100;
eta = 0.2*pi;
T0 = 1;

timeSteps = 1000;
gridSize = 100; 
R = 1;

particles = InitializeParticles(nrOfParticles, gridSize, eta); 


for t = 1:timeSteps

    particles = UpdatePositions(particles, eta, gridSize, T0);
    particles = RemoveOverlaps(particles);
    
    if(mod(t, 100) == 0)
            figure(1)
    PlotParticles(particles)
    xlim([1, gridSize])
    ylim([1, gridSize])
    
        disp(num2str(t));
    end
end