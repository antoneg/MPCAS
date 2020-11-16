
gridSize = 128;

SET1 = load('set1.mat');
SET2 = load('set2.mat');

SET1_fire = SET1.plotData(:,1);
SET2_fire = SET2.plotData(:,1);

denseLike = load('denseLike.mat');
SET1_denseLike = denseLike.SET1_recreatedClusters;
SET2_denseLike = denseLike.SET2_recreatedClusters;

p1 = SET1.p;
f1 = SET1.f;

p2 = SET2.p;
f2 = SET2.f;

figure(1)
PlotLogLog(SET1_fire, gridSize,'r.');
hold on
PlotLogLog(SET1_denseLike, gridSize, 'g.');
legend('Simulation', 'Random forest with similar density')
title(['p = ' num2str(p1) ', f = ' num2str(f1)] );

figure(2)
PlotLogLog(SET2_fire, gridSize,'r.');
hold on
PlotLogLog(SET2_denseLike, gridSize, 'g.');
legend('Simulation', 'Random forest with similar density')
title(['p = ' num2str(p2) ', f = ' num2str(f2) ]);
