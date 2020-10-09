function v = LocalFieldB(thresholds,weights,xs,neuronSize)
   
    v = zeros(neuronSize,1);

    for j = 1:neuronSize
        rowWeights = weights(j,:);
        thresJ = thresholds(j);
        vj = -thresJ + (rowWeights*xs);
        v(j) = vj;
    end
end