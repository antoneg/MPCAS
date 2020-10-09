% A function PolynomialDifferentiation (in the file PolynomialDifferentiation.m)
% which takes, in order, a vector with the n+ 1 coefficients of an n
% th-degree polynomial
% a0, a1, . . . , an and the order k of the derivative as input and returns the n + 1 − k
% coefficients of the k
% th derivative of the polynomial.
% Example: if the input polynomial is 1+ 2x+ 3x
% 2 and k = 1, the input coefficients are
% (1, 2, 3), and the output coefficients should be (2, 6) If, instead, k = 2, the output
% coefficients should instead be (6) (a vector with one element). If k ≥ 3, an empty
% vector should be returned.

%Prov alternativet att se sambandet mellan k och coeffssize? 
function res = PolynomialDifferentiation(coeffsVec,k)
   
    if(k>=size(coeffsVec,1))
        res = [];
    else

   currentCoeffs = coeffsVec;
   for i = 1:k
    coeffsSize = size(currentCoeffs,1);
    e = 0;
    tmpVec = zeros(coeffsSize,1);
    for j = 1:coeffsSize
        tmpVec(j,1) = currentCoeffs(j,1)*e;
        e = e+1;
    end
    %rightshift the coeefsvec
    tmpVec = tmpVec(2:coeffsSize);
    currentCoeffs = tmpVec;

   end
   res = currentCoeffs;
    end
end

    
