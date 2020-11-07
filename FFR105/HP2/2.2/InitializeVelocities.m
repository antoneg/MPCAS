function velocities = InitializeVelocities(numberOfParticles,numbOfVariables, alpha, deltaTime, xMin,xMax)
velocities = zeros(numberOfParticles,numbOfVariables);

for i = 1:numberOfParticles
    for j = 1:numbOfVariables
        r = rand;
        factor1 = alpha/deltaTime;
        
        term1 = -(xMax - xMin)/2;
        term2 = r*(xMax - xMin);
        factor2 = term1 + term2;
        
        velocities(i,j) =  factor1 * factor2;
    end
end
end