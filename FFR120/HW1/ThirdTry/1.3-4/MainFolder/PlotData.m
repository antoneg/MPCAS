myData = load('myData.mat');
allRecData = myData.allRecData;
allInfData = myData.allInfData;

notSus = zeros(9,41);
tot = [];
for b = 1:9
    tmp1 = zeros(1,41);
    tmp2 = zeros(1,41);
    for r = 1:10
        tmp1 = allRecData(b,r,:); 
        tmp1 = reshape(tmp1,1,41);
        
        tmp2 = allInfData(b,r,:); 
        tmp2 = reshape(tmp2,1,41);
        notSus(b,:) = notSus(b,:) + tmp1 + tmp2;
    end
end

notSus = notSus./10;
notSus = notSus./1000;


xs = [0.1:0.1:0.9];
ys = [1:3:123];
figure(1)
plot(ys, notSus(7,:),'b');
hold on
plot(ys, notSus(4,:), 'g');
hold on
plot(22, 0.0835,'bo');
plot(16, 0.0638,'go');

xlabel('\beta/\gamma');
ylabel('% recovered of 1000 agents at the end of simulations');
legend('\beta = 0.7', '\beta = 0.4');
title('% recovered for two betas averaged over 10 runs, as a funtion of \beta/\gamma ');


figure(2)
[X,Y] = meshgrid(xs,ys);
zs = notSus;
zs = zs';
surf(X,Y,zs);
xlabel('\beta');
ylabel('\beta/\gamma');
zlabel('% recovered');
title('3D plot of % recovered (averaged over 10 runs) as a funtion of K for different betas');




