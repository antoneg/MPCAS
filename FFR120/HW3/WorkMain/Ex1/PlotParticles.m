function PlotParticles(particles, t)
%Max 7 coulors.
colours = ["r.", "g.", "b.", "m.", "c.", "y.", "b."];
coloursEnd = ["ro", "go", "bo", "mo", "co", "yo", "bo"];
for i = 1:size(particles,1)
    x = particles(i,1);
    y = particles(i,2);
    v = particles(i,3);
   
    if t ~= 50
        c = colours(i);
        plot(x, y, c);
        hold on
    else
        c = coloursEnd(i);
        plot(x, y, c);
        hold on
    end
end

end