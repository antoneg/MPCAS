function positions = InitializePositions(numberOfParticles,numbOfVariables,xMin,xMax)
positions = zeros(numberOfParticles,numbOfVariables);
for i = 1:numberOfParticles
    for j = 1:numbOfVariables
        r = rand;
        positions(i,j) = xMin + r*(xMax - xMin);
    end
end
end