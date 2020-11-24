clear all
nrOfParticles = 100;
% eta = 0.002*pi;
T0 = 1;
timeSteps = 20000;
gridSize = 100; 
R = 1;

etas = [2*pi, 0.2*pi, 0.002*pi];
fileNames = ["bigPi","mediumPi","smallPi"];
for r = 1:size(etas,2)
eta = etas(r);

particles = InitializeParticles(nrOfParticles, gridSize, eta); 
distances = zeros(nrOfParticles,nrOfParticles); %not really zeros but just for init
particleData = [];
clusterData = [];

for t = 1:timeSteps
    
    [distances ,particles] = UpdatePositions(particles, eta, gridSize, T0);

     particles = RemoveOverlaps(particles, distances, R);
     clusters = GetClusters2(particles, distances, R);

    if(mod(t, 100) == 0)
%      figure(1)        
%      PlotParticles(particles)
%      hold on
%      PlotClusters(clusters, particles)
%      hold off
%      xlim([1, gridSize])
%      ylim([1, gridSize])
   
     disp(num2str(t));
     disp(num2str(r));
    end
  particleData(t,:,:) = particles;
  clusterData(t,:,:) = clusters;
end
fName = fileNames(r);
save(fName);
end