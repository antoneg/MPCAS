data = load('ex4data.mat');

data8 = data.data8;
data16 = data.data16;
data32 = data.data32;
data64 = data.data64;
data128 = data.data128;
data256 = data.data256;

burnedTrees8 = data8(:,1);
burnedTrees16 = data16(:,1);
burnedTrees32 = data32(:,1);
burnedTrees64 = data64(:,1);
burnedTrees128 = data128(:,1);
burnedTrees256 = data256(:,1);

figure(1)
tau8 = PlotLinFit(burnedTrees8, 8, 1, 'b-');
hold on
tau16 = PlotLinFit(burnedTrees16, 16, 1, 'b-');
hold on
tau32 = PlotLinFit(burnedTrees32, 32, 1, 'b-');
hold on
tau64 = PlotLinFit(burnedTrees64, 64, 1, 'b-');
hold on
tau128 = PlotLinFit(burnedTrees128, 128, 1, 'b-');
hold on
tau256 = PlotLinFit(burnedTrees256, 256, 1, 'b-');
hold off

% yAxis = [tau8, tau16, tau32, tau64, tau128, tau256 ];
% xAxis = [(1/8), (1/16), (1/32), (1/64), (1/128), (1/256)];

yAxis = [tau8, tau16, tau32, tau64, tau128, tau256 ];
xAxis = [(1/8), (1/16), (1/32), (1/64), (1/128), (1/256)];

figure(2)
plot(xAxis, yAxis, 'r');
hold on
coefs = polyfit(xAxis, yAxis, 1);
coefs(1)
coefs(2)
coefs

syms fs(x) %slope function
fs(x) = coefs(1)*x + coefs(2);
fplot(fs)
hold on
plot(0,coefs(2), 'bo');
hold on 
text(0, coefs(2), num2str(coefs(2)));
xlim([0 0.14])
ylim([coefs(2) yAxis(1)])

xlabel('1/N');
ylabel('\tau')
title('Plot over \tau as function of 1/N, where \tau is calculated using all data points')

