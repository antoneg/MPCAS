function f = GravityForce(mass, alpha)
    g = 9.82;
    f = mass * g *sind(alpha);
end