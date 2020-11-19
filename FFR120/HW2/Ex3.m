
clear all;

SET1 = load('set1.mat');
SET2 = load('set2.mat');
SET1_fire = SET1.plotData(:,1);
SET2_fire = SET2.plotData(:,1);

p1 = SET1.p;
f1 = SET1.f;

p2 = SET2.p;
f2 = SET2.f;

% burnedTrees = SET1_fire;
% gridSize = 128;
% tweak = 0.00014;

burnedTrees = SET1_fire;
p = p1;
f = f1;
gridSize = 128;
tweak = 0.25;

%A rank-frequency plot with the fire data and the linear fit used to find
%the exponent tau;
figure(1)
PlotLogLog(burnedTrees, gridSize, 'r.');
hold on
tau = PlotLinFit(burnedTrees, gridSize, tweak, 'b-');
legend('Simulation', ['Linear fit with \tau = ' num2str(tau,4) ])
title(['Fire sim & linear fit (excluding ', num2str(tweak*100), '% of the data (larger RFS)' '. p = ' num2str(p) ', f = ' num2str(f)])
hold off
tau

%A rank-frequency plot comparing the fire data and the
%synthetic power law data.
figure(2)
PlotLogLog(burnedTrees, gridSize, 'r.');
hold on
GenerateAndPlotSynthetic(tau, burnedTrees, 'g.')
legend('Simulation', ['Synthetic data with \tau = ' num2str(tau,4)])
title(['Fire sim & synthetic data based on \tau = ' num2str(tau,4) ' .p = ' num2str(p) ', f = ' num2str(f)])
hold off
