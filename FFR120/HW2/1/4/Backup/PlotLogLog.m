function PlotLogLog(burnedTrees, gridSize, plotType)
relativeFireSize = burnedTrees;
relativeFireSize = relativeFireSize./(gridSize^2); % relative fire size
relativeFireSize = sort(relativeFireSize, 'descend');

%cCDF
cCDF = relativeFireSize;

nrOfrelativeFireSize = size(relativeFireSize,1);
for i = 1:nrOfrelativeFireSize
    cCDF(i) = i/nrOfrelativeFireSize;
end

xmin = relativeFireSize(end);
plot(relativeFireSize, cCDF, plotType)
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')
xlim([xmin 1])
xlabel('Relative fire size')
ylabel('cCDF')
end