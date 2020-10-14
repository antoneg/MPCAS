function init = InitializePheromoneLevels(nCities, tau0)
    init = zeros(nCities,nCities) + tau0;
    
    % pheromone levels to itself should be 0. 
%     for i = 1:nCities
%         init(i,i) = 0;
%     end
end