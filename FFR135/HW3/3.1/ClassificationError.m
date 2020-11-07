function cError = ClassificationError(targets, outputs)
    sumAccurate = sum(targets==outputs);
    cError = 1 - sumAccurate/size(targets,1);
end