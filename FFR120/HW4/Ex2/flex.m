n = 20;
c = 4; % Even number
p = 0.2;

M = zeros(n,n);

for i = 1:size(M,1)    
    for j = 1:(c/2)
       if i-j <= 0
        M(i, n + (i-j) ) = 1;  
       else
       M(i,i-j) = 1;
       end
       if i + j >= n+1
        M(i,i+j-n) = 1;
       else           
       M(i,i+j) = 1;
       end
    end
end
figure(1)
plot(graph(M), 'Layout', 'circle')
title(['Circular graph with no shortcuts: n = ', num2str(n), ', c = ', num2str(c), ', p = ', num2str(p)])
M = RewireShortcuts(M, p, c);
figure(2)
plot(graph(M), 'Layout', 'circle')
title(['Circular graph with shortcuts: n = ', num2str(n), ', c = ', num2str(c), ', p = ', num2str(p)])

