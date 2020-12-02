function PlotTheoreticalPred(n, p)
xs = (1:n-1);
ys = [];
for k = 1:n-1
    pk = nchoosek(n-1,k) * (p^k)*(1-p)^(n-1-k);
    ys(k) = pk;
end
plot(xs, ys, 'b');
end
