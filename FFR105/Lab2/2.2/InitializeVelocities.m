function v = InitializeVelocities(numberOfBoids,numbOfVariables, alpha, deltaTime, xMin,xMax)
        v = zeros(numberOfBoids,numbOfVariables);
    
   for i = 1:numberOfBoids
       for j = 1:numbOfVariables
       r = rand;
       factor1 = alpha/deltaTime;
       
       term1 = -(xMax - xMin)/2;
       term2 = r*(xMax - xMin);
       factor2 = term1 + term2;       
       
       v(i,j) =  factor1 * factor2;
       end
   end
end