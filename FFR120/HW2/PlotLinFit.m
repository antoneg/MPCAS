function tau = PlotLinFit(burnedTrees, gridSize, tweak, plotType)
relativeFireSize = burnedTrees;
relativeFireSize = relativeFireSize./(gridSize^2); % relative fire size
relativeFireSize = sort(relativeFireSize, 'descend');
cCDF = [];
for c = 1:size(relativeFireSize,1)
    cCDF(c) = c/size(relativeFireSize,1);
end

linFitX = [];
linFitY = [];

for i = 1:size(relativeFireSize,1)
    if (i/(size(relativeFireSize,1))) < tweak
    else
        linFitX(end+1) = relativeFireSize(i);
        linFitY(end+1) = cCDF(i);
    end
end

xmin = linFitX(end);
p = polyfit(log(linFitX),log(linFitY),1);
z = polyval(p,log(linFitX));


loglog(linFitX,exp(z), plotType)
xlim([xmin 1]);
xlabel('Relative fire size');
ylabel('cCDF');

y1 = log(exp(z(1)));
y2 = log(exp(z(end)));

x1 = log(linFitX(1));
x2 = log(linFitX(end));

yDiff = y2-y1;
xDiff = x2 - x1;

slope = yDiff/xDiff;

tau = 1-slope;

end