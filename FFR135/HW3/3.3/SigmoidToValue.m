function val = SigmoidToValue(x)
    sigVal = 1/(1+exp(-x));
    r = rand;
    if sigVal >= r
        val = 1;
    else
        val = -1;
    end
end