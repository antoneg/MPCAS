% all slopes L, 1000 m long (horizontal distance)

TMAX = 750;
M = 20000;
tau = 30;
Ch = 40;
Tamb = 283;
Cb = 3000;
vMax = 25;
vMin = 1;
alphaMax = 10;
populationSize = 100;

%Initial states
startX = 0;
startV = 25;
gear = 7;
Tb = 500;

nrIteration = 3;
numbOfhiddenNerurons = 5; %3-10

for i = 1:nrIteration
    
        %fitness(i) = Evaluate -> get dist by feeding the network
        %save the best
        %selection
        %mutation
        %new population     
 
end
% 1. Initiera population (alltså vikter för nätverket i form av kromosomer)
% 2. Evaluera population. Kör simulering med vikterna för varje kromosom och spara fitness
% 3. Mutation/cross/tournament'

population = InitializePopulation(poplulationSize, numbOfhiddenNerurons); % this is weights ayy lmao
