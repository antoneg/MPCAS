function init = InitializePheromoneLevels(nCities, tau0)
    init = zeros(nCities,nCities) + tau0;
end