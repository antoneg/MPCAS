function particles = InitializeParticles(nrOfParticles)
    %xpos, ypos
    particles = zeros(nrOfParticles,4);
    xs = randi([-100,100],nrOfParticles,1);
    ys = randi([-100,100],nrOfParticles,1);
    
    particles(:,1) = xs;
    particles(:,2) = ys;
    particles(:,4) = 1;
    
    %Hardcoded, this feels bad. 
   for i = 0:nrOfParticles-1
       particles(i+1,3) = i;
   end
end