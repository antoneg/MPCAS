function newXpb = UpdateParticlesBest(xPb, evalList)
    newXpb = xPb;
    for i = 1:(size(xPb,1))
         
        currentBest = xPb(i,3);
        currentVal = evalList(i,3);
        
        if(currentVal < currentBest)
            newXpb(i,1) = evalList(i,1);
            newXpb(i,2) = evalList(i,2);
            newXpb(i,3) = evalList(i,3);         
        end
    end
end