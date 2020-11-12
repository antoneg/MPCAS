locationStatus = [1,0; 2,0; 3,1; 4,1; 5,1; 6,1; 7,1; 8,0; 9,1];
gridSize = 3;

cluster = [];

figure(1)
for i = 1:size(locationStatus,1)
    loc  = locationStatus(i,1);
    
    %     x = floor((loc/gridSize)+1);
    %     y = loc - ((x-1)*gridSize);
    row = ceil(loc/gridSize);
    col = mod(loc,gridSize);
    if locationStatus(i,2) == 1
        plot(col, row, 'go')
        hold on
        text(col, row, num2str(loc))
        hold on
      
    end
end

hold off
xlim([0, 130])
ylim([0, 130])

cluster = BurnNeighbours(locationStatus, 5, 3);
cluster