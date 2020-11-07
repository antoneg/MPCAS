function deltaHt = ComputeDeltaHiddenThresholds(nu,weights, v0, vK, hdTh)

    leftField = (weights*v0) - hdTh;
    leftTerm = tanh(leftField);
  
    rightField = (weights*vK) - hdTh;
    rightTerm = tanh(rightField);
    
    deltaHt = -nu*(leftTerm-rightTerm);
end