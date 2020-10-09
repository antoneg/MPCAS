function visab = GetVisibility(cityLocation)
    nCities = size(cityLocation,1);
    visab = zeros(nCities,nCities);
    
    for i = 1:nCities
        from = cityLocation(i,:);
        for j = 1:nCities
            to = cityLocation(j,:);
            visab(i,j) = 1/(norm(from-to)); 
        end
    end
    
end