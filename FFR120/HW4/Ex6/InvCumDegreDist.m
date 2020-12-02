function InvCumDegreDist(M)


[distList, degreList] = GetDistList(M);
n = size(M,1);
ys = zeros(1,n);

for d = 1:n
    for j = 1:n
        if degreList(j) >= (d-1)  
        ys(d) = ys(d) + 1; 
        end
    end
end
ys = ys./n;

loglog((0:n-1), ys, 'go');
title(['Inverse cumulative degree distribution'])
xlim([0 n])
ylim([0 1.1])
xlabel('k')
ylabel('ICD')
hold off
end