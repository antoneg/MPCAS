allData = load('allData.mat');

bProbList = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9];

allRecData = allData.allRecData;
allInfData = allData.allInfData;
% bProbListSize,runs,innerGammaRuns);

% xs = [];
% xs = [1:30]*0.002;
% plotData = zeros(30,1);
% 
% 
% tt = allRecData(6,1,:);
% tt 
% tt = reshape(tt, 1,30);
% tt

allAvrData = zeros(9,30);
allXs = zeros(30,9);
allBs = zeros(30,9);
for b = 1:9
    avrData = zeros(1,30);
    for r = 1:10
        
        tmpData = zeros(1,1,30);
        
        tmpRecData = zeros(1,1,30);
        tmpRecData = allRecData(b,r,:);
        
        tmpInfData = zeros(1,1,30);
        tmpInfData = allInfData(b,r,:);
        
        tmpData = tmpRecData + tmpInfData;
        
        tmpData = reshape(tmpData, 1, 30);
        avrData = avrData + tmpData;
    end
    avrData = avrData./10; %avr over runs
    avrData = avrData./1000; % perent rec
    bp = bProbList(b);
    
    allAvrData(b,:) = avrData;
    xs = [];
    xs = [1:30]*0.002;
    xs = bp./xs;
    from = (b-1)*30 + 1;
    to = b*30;
    allXs(:,b) = xs;
    allBs(:,b) = b;
  
%     x = bProbList; %1x9
%     y = xs; %1x30
%     z = allAvrData; %9x30 
% 
%     [x, y] = meshgrid(x,y);
%     surf(x,y,z)
%     hold on
end
sp = surf(allBs,allXs,allAvrData')
sp

% kuken = zeros(1,18);
% for i = 1:18
%     if mod(18,2)
%         kuken(i-1,:) = allAvrData(i,:);
%         kuken(i,:) = allAvrData(i,:);
%     end
% end


% saft = surf(allAvrData);
% plot3(2,3,5,'.')
% 
% for b = 1:9
%     bx = b*0.1;
%     for ki = 1:30
%         ky = 0.002*ki;
%         ky = bx/ky;
%         z = allAvrData(b, ki);
%         surf(bx,ky,z)
% %         plot3(bx,ky,z,'o')
%         hold on
%     end 
% end

% 
% x = [];
% y = [];
% z = [];
% for b = 1:9
%     bx = b*0.1;
%     for k = 1:30
%         ky = 0.002*k;
%         ky = bx/ky;
%         za = allAvrData(b, k);
%         
%         x(((30*(b-1))+k)) = bx;
%         y(((30*(b-1))+k)) = ky;
%         z(((30*(b-1))+k)) = za;
%     end 
% end
% 
% size(x)
% size(y)
% 
% x = x';
% y = y';
% z = z';
% 
% dt = delaunayTriangulation(x,y) ;
% tri = dt.ConnectivityList ;
% xi = dt.Points(:,1) ; yi = dt.Points(:,2) ;
% F = scatteredInterpolant(x,y,z);
% zi = F(xi,yi) ;
% trisurf(tri,xi,yi,zi) 
% 
% shading interp