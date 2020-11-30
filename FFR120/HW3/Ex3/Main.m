clear all
nrOfParticles = 1000;
eta = 0.03*pi;
T0 = 1;
timeSteps = 25000;
gridSize = 100;
R = 1;
activePassiveRatio = 0.022;
Rc = 4;

particles = InitializeParticles(nrOfParticles, gridSize, eta, activePassiveRatio);
distances = zeros(nrOfParticles,nrOfParticles); %not really zeros but just for init
particleData = [];
clusterData = [];

for t = 1:timeSteps   
    [distances ,particles] = UpdatePositions(particles, eta, gridSize, T0, Rc,activePassiveRatio);   
%     distances = CalculateDistances(particles);  
    particles = RemoveOverlaps(particles, distances, R);  
    
    if(mod(t, 100) == 0)       
        disp(num2str(t));
    end
    particleData(t,:,:) = particles;
    %   clusterData(t,:,:) = clusters;
end
% fName = fileNames(r);
save("0.03pi.mat");
% end