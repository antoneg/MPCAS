%  x = [ 0.5000 1.0000 2.0000 5.0000 10.0000 20.0000 50.0000 100.0000];
%  y = [ 0.8447 1.4494 3.5760 10.9288 23.1908 44.6963 114.9254 344.6238];
%  loglog(x,y,'bd');
%  hold on
%  axis([0 100 0 350])
%  p = polyfit(log(x),log(y),1);
%  z = polyval(p,log(x));
%  hold on;
%  loglog(x,exp(z))

clear all;
data = load('plotData.mat');

burnedTrees = data.burnedTrees;
cCDF = data.cCDF;

figure(200)
xmin = burnedTrees(end);
loglog(burnedTrees, cCDF, 'r.')
hold on
  p = polyfit(log(burnedTrees),log(cCDF),1);
  z = polyval(p,log(burnedTrees));
  z
  hold on;
  loglog(burnedTrees,exp(z), 'b')
% set(gca, 'YScale', 'log')
% set(gca, 'XScale', 'log')
xlim([xmin 1])
xlabel('Relative fire size')
ylabel('cCDF')
hold on % Hold on for next

y1 = log(exp(z(1)));
y2 = log(exp(z(end)));
y1
y2
x1 = log(burnedTrees(1));
x2 = log(burnedTrees(end));
x1 
x2

py  = sqrt(((y2-y1)^2) + ((x2-x1)^2));

tau = 1-py;
tau
py
