clear all
gridSize = 128;

data = load('skitData.mat');
burnedTrees = data.plotData(:,1);
trees = data.plotData(:,2);

allTrees = trees; %Use this for later

% ---------Plot log log graph from sim------------
burnedTrees = burnedTrees./(gridSize^2); % relative fire size
burnedTrees = sort(burnedTrees, 'descend');

%cCDF
cCDF = burnedTrees;

nrOfBurnedTrees = size(burnedTrees,1);
for i = 1:nrOfBurnedTrees
    cCDF(i) = i/nrOfBurnedTrees;
end

figure(200)
xmin = burnedTrees(end);
plot(burnedTrees, cCDF, 'r.')
set(gca, 'YScale', 'log')
set(gca, 'XScale', 'log')
xlim([xmin 1])
xlabel('Relative fire size')
ylabel('cCDF')
hold on % Hold on for next