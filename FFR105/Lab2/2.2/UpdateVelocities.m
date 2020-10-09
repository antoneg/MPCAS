function newVs = UpdateVelocities(vs, c1, c2, xPb, xSb, xs, numbOfBoids, deltaT)
        newVs = vs;
        
        numbOfVars = size(vs,2);
        
        xPbTemp = xPb(:,1:2);
        xSbTemp = xSb(1,1:2);
        
        for i = 1:numbOfBoids
            for j = 1:numbOfVars
                r = rand;
                q = rand;

                term1 = c1*q*  ( ( xPbTemp(i,j) - xs(i,j) ) / deltaT );
                term2 = c2*r*  ( ( xSbTemp(1,j) - xs(i,j) ) / deltaT );

                newVs(i,j) = vs(i,j) + term1 + term2;
                if( newVs(i,j) > 10)
                    newVs(i,j) = 10;
                end
            end
        end
end