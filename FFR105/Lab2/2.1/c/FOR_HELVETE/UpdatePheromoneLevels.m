function updatedPhermoneLevels = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho)
  
updatedPhermoneLevels = (1-rho)*pheromoneLevel;
    updatedPhermoneLevels = updatedPhermoneLevels + deltaPheromoneLevel;
   
end

% function newPheromoneLevel = UpdatePheromoneLevels(pheromoneLevel, deltaPheromoneLevel, rho)
%     size(pheromoneLevel,1)
%     size(pheromoneLevel,2)
%     size(deltaPheromoneLevel,1)
%     size(deltaPheromoneLevel,2)
%     newPheromoneLevel = (1 - rho) * pheromoneLevel + deltaPheromoneLevel;
% end