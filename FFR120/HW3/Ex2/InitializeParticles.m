function particles = InitializeParticles(nrOfParticles, gridSize)
    particles = zeros(nrOfParticles, 4);
    
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
    min = -pi/2;
    max = pi/2;
    rDirs = (max-min).*rand(nrOfParticles,1) + min;
      
    particles(:,1) = rxs;
    particles(:,2) = rys;
    particles(:,3) = vs;
    particles(:,4) = rDirs;  
    
end