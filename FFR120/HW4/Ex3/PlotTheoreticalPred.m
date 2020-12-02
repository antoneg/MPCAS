function PlotTheoreticalPred(m, M)
n = size(M,1);
xs = (0:n-1);
ys = [];
gamma = 3;

for k = 1:n
    fk = 2*(m^2)*(k-1)^(-gamma+1);
    ys(k) = fk;
end
loglog(xs, ys, 'r');
end
