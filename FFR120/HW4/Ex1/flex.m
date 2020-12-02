clear all

p = 0.1;
n = 200;
M = zeros(n,n);
fullM = zeros(n,n);
nrOfEdges = 0;

for i = 1:n
    for j = i:n
        if i ~= j
            if rand < p
                M(i,j) = 1;
                nrOfEdges = nrOfEdges + 1;
                fullM(i,j) = 1;
                fullM(j,i) = 1;
            end
        end
    end
end
figure(1)
PlotTheoreticalPred(n, p);
hold on
PlotDegreDist(fullM, n, p);
legend('Theoretical prediction','Simulation')
title(['Degree distrubution & theoretical prediction : n = ', num2str(n), ', p = ', num2str(p)])
xlabel('K')
ylabel('P(K)')
figure(3)
plot(graph(fullM))
title(['Graph : n = ', num2str(n), ', p = ', num2str(p)])
figure(4)
PlotDegreDist(fullM, n, p);
title(['Degree distrubution : n = ', num2str(n), ', p = ', num2str(p)])
xlabel('K')
ylabel('P(K)')
figure(5)
PlotTheoreticalPred(n, p);
title(['Theoretical prediction : n = ', num2str(n), ', p = ', num2str(p)])
xlabel('K')
ylabel('P(K)')

