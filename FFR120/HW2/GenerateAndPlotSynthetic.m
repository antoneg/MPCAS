function GenerateAndPlotSynthetic(tau, relativeFireSizes, plotType)
nrOfDataPoints = size(relativeFireSizes,1);

syntheticData = [];
% tauExp = -1/(tau-1);
% % ymin = 0.695;
for i = 1:nrOfDataPoints
    ri = rand;
    syntheticData(i) = (1/128^2)*(1-ri)^(-(1/(tau-1)));
end
% % 
syntheticData = sort(syntheticData, 'descend'); %This is X_i
xAxis = syntheticData;
yAxis = [];
for i = 1:nrOfDataPoints
    yAxis(i) = i/nrOfDataPoints;
end
% % 
xmin = xAxis(end);
loglog(xAxis,yAxis,plotType);
xlim([xmin 1]);
xlabel('Relative fire size');
ylabel('cCDF');

end