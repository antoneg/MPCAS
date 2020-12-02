%This function returns all distances from a start node, A, to all nodes
%in a graph.
function startToGoals = BreadthFirstSearch(start, mGraph)
    nrOfNodes = size(mGraph,1);
    startToGoals = zeros(nrOfNodes,1);
    d = 0; 
    discovered = zeros(1,nrOfNodes);
    discovered(start) = 1;
    queue = [];
    queue(end + 1) = start;
    depthCounter = 0;
    while size(queue,2) > 0
      
        v = queue(1);             
        startToGoals(v) = d;
       
        %do not add already discovered to queue
        %if neigbour and not discovered, add to queue
        %update discovered   
        vsNeigbours = mGraph(v,:);
        notDiscorvered = not(discovered);        
        toQ = vsNeigbours & notDiscorvered; 
        discovered = toQ | discovered;             
        indxsToQueue = find(toQ);     
        queue = [queue, indxsToQueue];        
        queue(1) = [];

        if depthCounter == 0 
           depthCounter = length(queue);
           d = d+1;           
        end
        depthCounter = depthCounter - 1;        
    end
end
