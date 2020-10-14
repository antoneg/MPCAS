function error = CalculateError(resultYs, realYs)
    nrOfDataPoints = size(realYs,1);
    
    sum = 0;
    for i = 1:nrOfDataPoints
        diff = resultYs(i) - realYs(i);
        diff = diff^2;
        sum = sum + diff;
    end
    meanDiff = sum/nrOfDataPoints;
    error = sqrt(meanDiff);
end