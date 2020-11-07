function deltaW = ComputeDeltaWeights(nu,weights, v0, vK, hdTh)

    deltaW = [];
    for n = 1:9
    
    vn0 = v0(n);
    vnk = vK(n);
    
    leftField = (weights*v0) - hdTh;
    leftTerm = tanh(leftField);
    leftTerm = leftTerm*vn0;
    
    rightField = (weights*vK) - hdTh;
    rightTerm = tanh(rightField);
    rightTerm = rightTerm*vnk;
    
    deltaWColumn = nu*(leftTerm-rightTerm);
    
  
    deltaW(:, n) = deltaWColumn;
    
    end
end