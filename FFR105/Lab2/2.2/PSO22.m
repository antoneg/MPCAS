%plot

%fcontour(f);

%Global variables
N = 35; %20-40
xMin = -5;
xMax = 5;
%numbOfVariables = 2;
alpha = 1;
deltaT = 1;
c1 = 2;
c2 = 2;

vMax = 10; % ANVÄÖND DEETTA

f = @(x,y) (((x^2) + y - 11)^2 ) + ((x + (y^2) - 7)^2);

%Three columns [x; y; value]
xPb = zeros(N,3) + Inf;
xSb = zeros(1,3) + Inf;
evaluationList = zeros(N,3);


% Initialize positions anc velocities
xs = InitializePositions(N,numbOfVariables,xMin,xMax);
vs = InitializeVelocities(N,numbOfVariables, alpha, deltaT, xMin,xMax);


its = 0;
while(true)

%Evaluate particles
evaluationList = EvaluateParticles(f,xs);



%Update best positions
xPb = UpdateParticlesBest(xPb, evaluationList);
xSb = UpdateSwarmBest(xPb, xSb);


%KANSKE TA BORT SIG SJÄLV FRÅN FÖRMLÄRNÖ?
%Update velocities
vs = UpdateVelocities(vs, c1, c2, xPb, xSb, xs, N, deltaT);
xs = UpdatePositions(xs, vs, deltaTime);

%b = mod(a,m) a by m
if mod(its,100000) == 0
    
    disp("Iteration: " + its);
    disp("Res: " + xSb(1,3));
    disp("X: " + xSb(1,1));
    disp("Y: " + xSb(1,2));
end
its = its +1;
end



%Update positions
%xs = UpdatePositions()




