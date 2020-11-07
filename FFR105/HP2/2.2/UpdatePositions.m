function newPositions = UpdatePositions(positions, velocities, deltaTime)
newPositions = positions + (velocities*deltaTime);
end