myData = load('myData.mat');
allRecData = myData.allRecData;
allInfData = myData.allInfData;

%Sum rec and inf, and avr.
% allRecData(bi,r,k) = recData(1000);
notSus = zeros(9,41);
tot = [];
for b = 1:9
    tmp1 = zeros(1,41);
    tmp2 = zeros(1,41);
    for r = 1:10
        tmp1 = allRecData(b,r,:); % All
        tmp1 = reshape(tmp1,1,41);
        
        tmp2 = allInfData(b,r,:); % All
        tmp2 = reshape(tmp2,1,41);
        notSus(b,:) = notSus(b,:) + tmp1 + tmp2;
    end
end
notSus
notSus = notSus./10;
notSus = notSus./1000;


xs = [0.1:0.1:0.9];
ys = [1:3:123];
figure(1)
plot(ys, notSus(6,:))
hold on
plot(ys, notSus(4,:))



figure(2)
[X,Y] = meshgrid(xs,ys)
zs = notSus;
zs = zs';
surf(X,Y,zs);

% 
%  p = surf(notSus);
% 
%   p.XData = p.XData.*000.1;
%   p.YData = p.YData.*3;



