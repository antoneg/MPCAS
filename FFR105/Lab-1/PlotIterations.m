
function PlotIterations(xs, coeffsVec)
    
    f = poly2sym(flip(coeffsVec));
    fplot(f);
    hold on
    for i = 1:size(xs,2)
        x = (xs(:,i));
        y = Polynomial(x,coeffsVec);
        scatter(x,y);
        hold on
    end
end