data = load('1.mat');
graphM = data.graphMatrix;
meanDegree = CalculateMeanDegree(graphM);
disp('_____________________________________')
disp('Net1');
disp(['avrg dist: ', num2str(data.avrgDist)])
disp(['diameter: ', num2str(data.diam)])
disp(['CC: ', num2str(data.cc)])
disp(['N: ', num2str(size(graphM,1))])
disp(['Mean Degree: ', num2str(meanDegree)])
disp('_____________________________________')

disp('_____________________________________')
data = load('2.mat');
graphM = data.graphMatrix;
meanDegree = CalculateMeanDegree(graphM);
disp('Net2');
disp(['avrg dist: ', num2str(data.avrgDist)])
disp(['diameter: ', num2str(data.diam)])
disp(['cc: ', num2str(data.cc)])
disp(['N: ', num2str(size(graphM,1))])
disp(['Mean Degree: ', num2str(meanDegree)])
disp('_____________________________________')

disp('_____________________________________')
data = load('3.mat');
graphM = data.graphMatrix;
meanDegree = CalculateMeanDegree(graphM);
disp('Net3');
disp(['avrg dist: ', num2str(data.avrgDist)])
disp(['diameter: ', num2str(data.diam)])
disp(['cc: ', num2str(data.cc)])
disp(['N: ', num2str(size(graphM,1))])
disp(['Mean Degree: ', num2str(meanDegree)])
disp('_____________________________________')