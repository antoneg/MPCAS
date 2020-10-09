
function res = NewtonRaphson(coeffsVec, startPoint, T)
    if (size(coeffsVec,2) < 3)
        error("The degree of the polynomial must be 2 or larger.");
    end
    resVec = [];
    resVec(:,1) = startPoint;
    vecIndx = 2;
    derivOnce = PolynomialDifferentiation(coeffsVec, 1);
    derivTwice = PolynomialDifferentiation(coeffsVec, 2);
    xi = startPoint;
    while true
        firstDerivResult = Polynomial(xi, derivOnce);
        secondDerivResult = Polynomial(xi, derivTwice);
        nextXi = NewtonRaphsonStep(xi, firstDerivResult, secondDerivResult);
        resVec(:,vecIndx) = nextXi;
        vecIndx = vecIndx +1; 
         if(xi-nextXi < T)
             break
         else
            xi = nextXi;
         end
    end
    res = resVec;
end

