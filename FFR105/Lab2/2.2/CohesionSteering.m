function c = CohesionSteering(positions,T,numbOfBoids)
    %centre of density
    
    rho = [];
    c = [];
    xs = positions(:,1);
    ys = positions(:,2);
    
    sumX = sum(xs);
    sumY = sum(ys);

    %Cohesion
    for i = 1:numbOfBoids
        sumX = sumX - positions(i,1);
        sumY = sumY - positions(i,2);
        
        rho = [sumX; sumY] * 1/( numbOfBoids - 1 );
        c(i) = (rho - positions(i))/(T^2); 
    end  

end