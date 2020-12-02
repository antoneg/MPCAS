clear all
%Initiate an Erdos-Renyi graph
p = 0.1;
n = 100;
graphMatrix = zeros(n,n);
m = 10;
timeSteps = 2000;

for i = 1:n
    for j = i:n
        if i ~= j
            if rand < p
            graphMatrix(i,j) = 1;
            graphMatrix(j,i) = 1;
            end
        end        
    end
end

figure(1)
plot(graph(graphMatrix));
[distList, degreList] = GetDistList(graphMatrix);

for t = 1:timeSteps
    graphMatrix = EnlargeGraph(graphMatrix, m);
end

figure(2)
PlotTheoreticalPred(m, graphMatrix)
hold on

InvCumDegreDist(m, graphMatrix)
title(['N = ', num2str(n), ', M = ', num2str(m), ', time steps = ', num2str(timeSteps)])
xlim([0 size(graphMatrix,1)])
ylim([0 1.1])
xlabel('k')
ylabel('ICD')
legend('Theoretical prediction', 'Simulation')
hold off

figure(3)
plot(graph(graphMatrix));
