function acc = Acceleration(mass, gravityForce, brakeForce, engineBrakeForce)
acc = (gravityForce - brakeForce -engineBrakeForce)/mass;
end

