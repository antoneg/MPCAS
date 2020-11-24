clear all;

runs = 1000;

timeSteps = 100;
omega = 0;
Dt = 0.5;
Dr = 0.2;

nrOfParticles = 4;

dataP1 = [];
dataP2 = [];
dataP3 = [];
dataP4 = [];
particleData = [];
for r = 1:runs

    particles = InitializeParticles(nrOfParticles);
    
    
    for p = 1:nrOfParticles
    
    x1Start = particles(1,1);
    y1Start = particles(1,2);
    
    x2Start = particles(2,1);
    y2Start = particles(2,2);
    
    x3Start = particles(3,1);
    y3Start = particles(3,2);
    
    x4Start = particles(4,1);
    y4Start = particles(4,2);
    
    
    for t = 1:timeSteps
        
        particles = UpdatePositions(particles, omega, Dt, Dr);
        
        for p = 1:nrOfParticles
        x = particles(t,1);
        y = particles(t,2);
        sqD = 
        end
        
        x1 = particles(1,1);
        y1 = particles(1,2);
        sqD1 = (x1-x1Start)^2 + (y1-y1Start)^2;
        dataP1(r,t) = sqD1;
        
        x2 = particles(2,1);
        y2 = particles(2,2);
        sqD2 = (x2-x2Start)^2 + (y2-y2Start)^2;
        dataP2(r,t) = sqD2;
        
        x3 = particles(3,1);
        y3 = particles(3,2);
        sqD3 = (x3-x3Start)^2 + (y3-y3Start)^2;
        dataP3(r,t) = sqD3;
        
        x4 = particles(4,1);
        y4 = particles(4,2);
        sqD4 = (x4-x4Start)^2 + (y4-y4Start)^2;
        dataP4(r,t) = sqD4;
        
    end
    
end
save('MSDdata.mat');


