clear all;

runs = 1000;

timeSteps = 100;
omega = 0;
Dt = 0.22;
Dr = 0.16;

nrOfParticles = 4;
plotParticles = true;
plotAtRandomR = randi([1,runs],1,1);

particleData = [];
figure(1);
for r = 1:runs
    
    particles = InitializeParticles(nrOfParticles);
    initPositions = zeros(nrOfParticles,2);
    
    for p = 1:nrOfParticles
        initPositions(p,1) = particles(p,1);
        initPositions(p,2) = particles(p,2);
    end
    
    for t = 1:timeSteps
        
        if plotParticles
            if (t <= 50) && (plotAtRandomR == r)
                PlotParticles(particles, t);
            end
        end
        
        particles = UpdatePositions(particles, omega, Dt, Dr);
        
        for p = 1:nrOfParticles
            x = particles(p,1);
            y = particles(p,2);
            xStart = initPositions(p,1);
            yStart = initPositions(p,2);
            sqD = (x-xStart)^2 + (y-yStart)^2;
            particleData(p,r,t) = sqD;
        end
    end
end
xlim([-120, 120])
ylim([-120, 120])
save('MSDdata.mat');


