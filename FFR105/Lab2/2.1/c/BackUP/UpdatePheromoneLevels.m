function updatedPhermoneLevels = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho)
    updatedPhermoneLevels = (1-rho)*pheromoneLevel;
    updatedPhermoneLevels = updatedPhermoneLevels + deltaPheromoneLevel;
end