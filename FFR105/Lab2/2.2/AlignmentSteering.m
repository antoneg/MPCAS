function l = AlignmentSteering(vs, T, numbOfBoids)
    l = [];
    vX = vs(:,1);
    vY = vs(:,2);
    
    sumVx = sum(vX);
    sumVy = sum(vY);  

    for i = 1:numbOfBoids
        sumVx = sumVx - (vs(i,1));
        sumVy = sumVy - (vs(i,2));

        l(i) = ([sumVx; sumVy]) * ( 1/(T*(numbOfBoids - 1)) );
    end
end