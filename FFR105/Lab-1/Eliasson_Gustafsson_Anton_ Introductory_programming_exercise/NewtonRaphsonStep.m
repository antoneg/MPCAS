
function res = NewtonRaphsonStep(xj, xjPrime, xjDoublePrime)
    if(xjDoublePrime == 0)
       error("Second derivative in newton step is 0 -> (Division by 0).");
    end
    res = xj-(xjPrime/xjDoublePrime);
end

