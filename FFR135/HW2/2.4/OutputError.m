function delta = OutputError(t,o,b)
    delta =(t-o)*(1-(tanh(b))^2);
end