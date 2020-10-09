 
function res = PolynomialDifferentiation(coeffsVec,k)
    
    if(k>=size(coeffsVec,2))
        res = [];
    elseif (k == 0)
        res = coeffsVec;
    else
    currentCoeffsVec = coeffsVec;
        for i = 1:k
            coeffsSize = size(currentCoeffsVec,2);
            exponent = 0;
            tmpVec = zeros(1,coeffsSize);
            for j = 1:coeffsSize
                tmpVec(1,j) = currentCoeffsVec(1,j)*exponent;
                exponent = exponent+1;
            end
        %Keep every element except first. 
        tmpVec = tmpVec(2:coeffsSize);
        currentCoeffsVec = tmpVec;
       end
   res = currentCoeffsVec;
    end
end

    
