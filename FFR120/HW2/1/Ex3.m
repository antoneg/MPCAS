
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

burnedTrees = SET2_fire;
gridSize = 128;
tweak = 0.2;

%A rank-frequency plot with the fire data and the linear fit used to find
%the exponent tau;
figure(1)
PlotLogLog(burnedTrees, gridSize, 'r.');
hold on
tau = PlotLinFit(burnedTrees, gridSize, tweak, 'b-');
legend('Simulation', ['Linear fit with \tau = ' num2str(tau,3)])
title(['Fire sim & linear fit (for RFS <', num2str(tweak), ')'])
hold off
tau

%A rank-frequency plot comparing the fire data and the
%synthetic power law data.
figure(2)
PlotLogLog(burnedTrees, gridSize, 'r.');
hold on
GenerateAndPlotSynthetic(tau, burnedTrees, 'g.')
legend('Simulation', ['Synthetic data with \tau = ' num2str(tau,3)])
title(['Fire sim & synthetic data (for RFS <', num2str(tweak), ')'])
hold off
