
%Plot
f = @(x,y) (((x^2) + y - 11)^2 ) + ((x + (y^2) - 7)^2);
a = 0.01;
flog = @(x,y)log(a + ((((x^2) + y - 11)^2 ) + ((x + (y^2) - 7)^2)));
figure
fcontour(flog)

%Global variables
nrOfnrOfParticles = 35; %20-40
xMin = -5;
xMax = 5;
vMax = 10;
numbOfVariables = 2;
alpha = 1;
deltaTime = 1;
inertiaWeight = 1.4;
inertiaWeighReduction = 0.9;
c1 = 2;
c2 = 2;
exitLimit = 10^(-11);

%Three columns [x; y; value]
particleBestList = zeros(nrOfnrOfParticles,3) + Inf;
swarmBest = zeros(1,3) + Inf;
evaluationList = zeros(nrOfnrOfParticles,3);

% Initialize positions and velocities
positions = InitializePositions(nrOfnrOfParticles,numbOfVariables,xMin,xMax);
velocities = InitializeVelocities(nrOfnrOfParticles,numbOfVariables, alpha, deltaT, xMin,xMax);

iteration = 0;
while( swarmBest(1,3) > exitLimit)
    
    %Evaluate particles
    evaluationList = EvaluateParticles(f,positions);
    
    %Update best positions
    particleBestList = UpdateParticlesBest(particleBestList, evaluationList);
    swarmBest = UpdateSwarmBest(particleBestList, swarmBest);
    
    %Update velocities
    velocities = UpdateVelocities(velocities, c1, c2, particleBestList, swarmBest, positions, nrOfnrOfParticles, deltaT, vMax, inertiaWeight);
    positions = UpdatePositions(positions, velocities, deltaTime);
    
    
    iteration = iteration +1;
    inertiaWeight = inertiaWeight*inertiaWeighReduction;
end
disp("Iteration: " + iteration);
fprintf('Res: %.6f \n',swarmBest(1,3));
fprintf('X: %.6f \n',swarmBest(1,1));
fprintf('Y: %.6f \n',swarmBest(1,2));




