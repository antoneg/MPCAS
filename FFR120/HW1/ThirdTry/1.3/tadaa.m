betaMiddle = load('yoyo.mat');
betaSmall = load('yoyo2.mat');
betaBig = load('yoyo3.mat');

betaMiddleAll = [];

betaMiddle1 = betaMiddle.allRecData(:,1000);
betaMiddle2 = betaMiddle.allRecData1(:,1000);
betaMiddle3 = betaMiddle.allRecData2(:,1000);
betaMiddle4 = betaMiddle.allRecData3(:,1000);
betaMiddle5 = betaMiddle.allRecData4(:,1000);
betaMiddle6 = betaMiddle.allRecData5(:,1000);
betaMiddle7 = betaMiddle.allRecData6(:,1000);
betaMiddle8 = betaMiddle.allRecData7(:,1000);
betaMiddle9 = betaMiddle.allRecData8(:,1000);
betaMiddle10 = betaMiddle.allRecData9(:,1000);


% ajaj = betaMiddle1+betaMiddle2+betaMiddle3+betaMiddle4+betaMiddle5+betaMiddle6+betaMiddle7+betaMiddle8+betaMiddle9+betaMiddle10;
% ajaj = ajaj/30;



plot([1:30]*0.002, betaMiddle1, 'ro')
hold on
plot([1:30]*0.002, betaMiddle2, 'ro')
hold on
plot([1:30]*0.002, betaMiddle3, 'ro')
hold on
plot([1:30]*0.002, betaMiddle4, 'ro')
hold on
plot([1:30]*0.002, betaMiddle5, 'ro')
hold on
plot([1:30]*0.002, betaMiddle6, 'ro')
hold on
plot([1:30]*0.002, betaMiddle7, 'ro')
hold on
plot([1:30]*0.002, betaMiddle8, 'ro')
hold on
plot([1:30]*0.002, betaMiddle9, 'ro')
hold on
plot([1:30]*0.002, betaMiddle10, 'ro')