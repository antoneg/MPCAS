function s = SeparationSteering(positions, T, numbOfBoids)
xs = positions(:,1);
ys = positions(:,2);

for i = 1:numbOfBoids
    sumX = 0;
    sumY = 0;
    
   for j = 1:numbOfBoids
    sumX = sumX + xs(i) - xs(j);
    sumY = sumY + ys(i) - ys(j); 
   end
   s(i) = [sumX ; sumY] * (1/(T^2));
end
   
end