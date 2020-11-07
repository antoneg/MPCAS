function evalList = EvaluateParticles(f,positions)
for i = 1:(size(positions,1))
    vars = positions(i,:);
    evalList(i,1) = vars(1);
    evalList(i,2) = vars(2);
    evalList(i,3) = f(vars(1), vars(2));
end
end

