clear all
nrOfParticles = 100;
eta = 0.002*pi;
T0 = 1;

timeSteps = 2000;
gridSize = 100; 
R = 1;

particles = InitializeParticles(nrOfParticles, gridSize, eta); 
distances = zeros(nrOfParticles,nrOfParticles);
particleData = [];
clusterData = [];

for t = 1:timeSteps
    
    [distances ,particles] = UpdatePositions(particles, eta, gridSize, T0);

     particles = RemoveOverlaps(particles, distances, R);
     clusters = GetClusters(particles, distances, R);

    if(mod(t, 100) == 0)
%     figure(1)        
%     PlotParticles(particles)
%     hold on
%     PlotClusters(clusters, particles)
%     hold off
%     xlim([1, gridSize])
%     ylim([1, gridSize])
   
     disp(num2str(t));
    end
        
  particleData(t,:,:) = particles;
  clusterData(t,:,:) = clusters;
end
save('lowEta.mat');