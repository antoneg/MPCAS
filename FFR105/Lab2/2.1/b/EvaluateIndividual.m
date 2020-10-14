function f = EvaluateIndividual(chrom, cityPositions)
    distance = 0;
    nrOfCities = size(cityPositions,1);
    for i = 1:nrOfCities
        %At the end
        if(i == 50)
            aIndx = chrom(1);
            bIndx = chrom(50);
            %Not at the end
        else
            aIndx = chrom(i);
            bIndx = chrom(i+1);
        end

        xA = cityPositions(aIndx,1);
        yA = cityPositions(aIndx,2);

        xB = cityPositions(bIndx,1);
        yB = cityPositions(bIndx,2);

        localdist = sqrt( (xA - xB)^2  + (yA - yB)^2 );

        distance = distance + localdist;

    end
    f = 1/distance;
end