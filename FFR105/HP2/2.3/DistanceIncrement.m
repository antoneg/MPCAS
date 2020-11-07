function newDistance = DistanceIncrement(distance, velocity,deltaTime,alpha)
newDistance = distance + (velocity*deltaTime*cosd(alpha));
end