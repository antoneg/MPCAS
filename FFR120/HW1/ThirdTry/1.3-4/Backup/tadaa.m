allDataMiddle = load('allDataDefaultBeta.mat');
allDataBiggerBeta = load('allDataBiggerBeta.mat');
allDataSmallBeta = load('allDataSmallBeta.mat');

recDataMiddle = allDataMiddle.allRecData;
recDataMiddle(:,1000,2)
avrgRecDataMiddle = zeros(60,1);

recDataSmall = allDataSmallBeta.allRecData;
recDataSmall(:,1000,2)
avrgRecDataSmall = zeros(60,1);
%------------
infDataMiddle = allDataMiddle.allInfData;
infDataMiddle(:,1000,2)
avrgInfDataMiddle = zeros(60,1);

infDataSmall = allDataSmallBeta.allInfData;
infDataSmall(:,1000,2)
avrgInfDataSmall = zeros(60,1);

for i = 1:10
avrgRecDataMiddle = recDataMiddle(:,1000,i) + avrgRecDataMiddle;
end

for i = 1:10
avrgRecDataSmall = recDataSmall(:,1000,i) + avrgRecDataSmall;
end
%-------
for i = 1:10
avrgInfDataMiddle = infDataMiddle(:,1000,i) + avrgInfDataMiddle;
end

for i = 1:10
avrgInfDataSmall = infDataSmall(:,1000,i) + avrgInfDataSmall;
end
ysMid = avrgRecDataMiddle./10; %Avrg
ysMid = ysMid/1000 %Percent

ysMid2 = avrgInfDataMiddle./10; %Avrg
ysMid2 = ysMid2/1000 %Percent

ysMid = ysMid + ysMid2;

xsMid = [0:59]*0.001;
xsMid = 0.6./xsMid;


% ---------------- 

ysSmall = avrgRecDataSmall./10;
ysSmall = ysSmall/1000;

ysSmall2 = avrgInfDataSmall./10;
ysSmall2 = ysSmall2/1000;

ysSmall = ysSmall + ysSmall2;

xsSmall = [0:59]*0.001;
xsSmall = 0.3./xsSmall;

 plot(xsMid', ysMid')
  hold on
  
  plot(xsSmall', ysSmall')
 hold off
 
 title('Averages over 10 runs, each for 60 values of gamma')
 ylabel('Percent recovered')
 xlabel('\beta/\gamma')
 legend('\beta = 0.6', '\beta = 0.3')

% betaMiddle = load('yoyo3.mat');
% betaSmall = load('yoyo2.mat');
% betaBig = load('yoyo3.mat');
% 
% betaMiddleAll = [];
% 
% betaMiddle1 = betaMiddle.allRecData(:,1000);
% betaMiddle2 = betaMiddle.allRecData1(:,1000);
% betaMiddle3 = betaMiddle.allRecData2(:,1000);
% betaMiddle4 = betaMiddle.allRecData3(:,1000);
% betaMiddle5 = betaMiddle.allRecData4(:,1000);
% betaMiddle6 = betaMiddle.allRecData5(:,1000);
% betaMiddle7 = betaMiddle.allRecData6(:,1000);
% betaMiddle8 = betaMiddle.allRecData7(:,1000);
% betaMiddle9 = betaMiddle.allRecData8(:,1000);
% betaMiddle10 = betaMiddle.allRecData9(:,1000);
% 
% 
%  ajaj = betaMiddle1 + betaMiddle2 + betaMiddle3 + betaMiddle4 + betaMiddle5 + betaMiddle6 + betaMiddle7 + betaMiddle8 + betaMiddle9 + betaMiddle10;
%  ajaj = ajaj./10;
% 
% 
% 
% 
% plot([1:30]*0.002, ajaj, 'ro')
%  hold on
% % plot([1:30]*0.002, betaMiddle2, 'go')
% % hold on
% % plot([1:30]*0.002, betaMiddle3, 'go')
% % hold on
% % plot([1:30]*0.002, betaMiddle4, 'go')
% % hold on
% % plot([1:30]*0.002, betaMiddle5, 'go')
% % hold on
% % plot([1:30]*0.002, betaMiddle6, 'go')
% % hold on
% % plot([1:30]*0.002, betaMiddle7, 'go')
% % hold on
% % plot([1:30]*0.002, betaMiddle8, 'go')
% % hold on
% % plot([1:30]*0.002, betaMiddle9, 'go')
% % hold on
% % plot([1:30]*0.002, betaMiddle10, 'go')