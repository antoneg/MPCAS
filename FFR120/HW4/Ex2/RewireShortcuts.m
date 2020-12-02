function updatedM = RewireShortcuts(M, p, c)
updatedM = M;
nrOfNodes = size(M,1);
nrOfEdges = nrOfNodes*c;
for n = 1:nrOfEdges
    samdeIndex = true;
    if rand < p
        while samdeIndex
            i = randi(nrOfNodes);
            j = randi(nrOfNodes);
            if i ~= j
                samdeIndex = false;
            end
        end
        updatedM(i,j) = 1;
        updatedM(j,i) = 1;
    end
    
end
end