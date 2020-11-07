
function res = RunGradientDescent(x0,u,n,T)
    xj = x0;
    res = xj;
    gNorm = T; % Just initialized so that it can start looping. 
    while (gNorm>=T)
        x1 = xj(1,1);
        x2 = xj(2,1);
        gradient = ComputeGradient(x1,x2,u);
        tooBigNumb = isnan(gradient);
        if(tooBigNumb)
            error("Gradient is computed to a number that the system translates to infinity.");
        end
        new = xj - n*gradient;
        gNorm = norm(gradient);     
        if(gNorm<T)
            res = new;
        else
            xj = new;
        end
    end
end