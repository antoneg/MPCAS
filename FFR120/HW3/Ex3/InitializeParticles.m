function particles = InitializeParticles(nrOfParticles, gridSize, eta, activePassiveRatio)
    particles = zeros(nrOfParticles, 4);
    activeCount = ceil(activePassiveRatio*nrOfParticles);
    vs = zeros(nrOfParticles, 1);
    rxs = randi([1, gridSize], nrOfParticles, 1);
    rys = randi([1, gridSize], nrOfParticles, 1);
    vs(:,1) = 0.05; % all have speed 1
    
    r1 = rand(nrOfParticles);
    r2 = rand(nrOfParticles);
    
    if rand < 0.5
    rxs = rxs+r1(:,1);
   
    else
        rxs = rxs-r1(:,1);
    end
    
    if rand < 0.5
        rys = rys+r2(:,1);
    else
        rys = rys-r2(:,1);
    end
     
    %for random initial directions
    etaMin = -pi/2;
    etaMax = pi/2;
    rDirs = (etaMax-etaMin).*rand(nrOfParticles,1) + etaMin;
      
    particles(:,1) = rxs;
    particles(:,2) = rys;
    particles(:,3) = vs;
    particles(:,4) = rDirs;
    particles(1:activeCount,5) = 1; %active
    particles(activeCount+1:end, 5) = 0; %passive
    
end