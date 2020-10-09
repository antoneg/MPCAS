function x = InitializePositions(numberOfBoids,numbOfVariables,xMin,xMax)
    x = zeros(numberOfBoids,numbOfVariables);
    
   for i = 1:numberOfBoids
       for j = 1:numbOfVariables
       r = rand;
       x(i,j) = xMin + r*(xMax - xMin);
       end
   end
    
end