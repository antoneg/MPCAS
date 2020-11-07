function updatedPhermoneLevels = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho)
updatedPhermoneLevels = ((1-rho)*pheromoneLevel) + deltaPheromoneLevel;
end

