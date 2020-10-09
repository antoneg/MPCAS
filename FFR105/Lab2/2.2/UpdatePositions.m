function newXs = UpdatePositions(xs, vs, deltaTime)
    newXs = xs + (vs*deltaTime);
end