function M = EnlargeGraph(graphMatrix, m)
M = graphMatrix;
% tmpM = graphMatrix;


n = size(M,1);
%spawn new node
M(:,end+1) = zeros(n,1);
M(end+1,:) = zeros(n+1,1);
% n = size(M,1);
i = n+1;
[distList, degreList] = GetDistList(graphMatrix);
for newConncs = 1:m
        
    %new nodes indx
    
   j = RouletteSelection(distList);
   % tmpM %Remove j from next selection (since we dont want node i connect to node j more than once)
   distList(j) = 0; %Dont pick the same connection again
    
    M(i,j) = 1;
    M(j,i) = 1;
end
end