allData = load('allData.mat');

bProbList = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];

allRecData = allData.allRecData;
allInfData = allData.allInfData;
kSize = 30;

allAvrData = zeros(9,kSize);
allXs = zeros(kSize,9);
allBs = zeros(kSize,9);
for b = 1:9
    avrData = zeros(1,kSize);
    for r = 1:10
        
        tmpData = zeros(1,1,kSize);
        
        tmpRecData = zeros(1,1,kSize);
        tmpRecData = allRecData(b,r,1:kSize);
        
        tmpInfData = zeros(1,1,kSize);
        tmpInfData = allInfData(b,r,1:kSize);
        
        tmpData = tmpRecData + tmpInfData;
        
        tmpData = reshape(tmpData, 1, kSize);
        avrData = avrData + tmpData;
    end
    avrData = avrData./10; %avr over runs
    avrData = avrData./1000; % perent rec
    bp = bProbList(b);
    
    allAvrData(b,:) = avrData;
    xs = [];
    xs = [1:kSize]*0.002;
    xs = bp./xs;
    allXs(:,b) = xs;
    allBs(:,b) = bp;
  

end


%Plots
figure(1)
% plot(allXs(:,6), allAvrData(6,:))
% hold on
plot(allXs(:,9), allAvrData(9,:))
xlabel('K(\beta/\gamma)')
ylabel('% recovered')
% legend('\beta = 0.6', '\beta = 0.3')
title('% recovered as function of \beta/\gamma')
hold off

allAvrData = allAvrData';
figure(2)
surf(allBs,allXs,allAvrData)
xlabel('\beta')
ylabel('K(\beta/\gamma)')
zlabel('% recovered')
ylim([0 100]);



