function startToGoals = BreadthFirstSearch(start, mGraph)
    nrOfNodes = size(mGraph,1);
    startToGoals = zeros(nrOfNodes,1);
    d = 0; 
    discovered = zeros(1,nrOfNodes);
    discovered(start) = 1;
    queue = [];
    queue(end + 1) = start;

    depthCounter = 0;
    while size(queue,2) > 0 % hmm
      
        v = queue(1);             
        startToGoals(v) = d;
       
        %do not add discovered to queue
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
% function startToGoals = BreadthFirstSearch(start, mGraph)
%     nrOfNodes = size(mGraph,1);
%     
%     visited = zeros(nrOfNodes,1);
%     startToGoals = zeros(nrOfNodes,1);
%    
%     
%     dChecker = [1];
%     d = 0; 
%     
%     globalLen = [];
%     globalLen(1) = 0;
%     discovered = zeros(1,nrOfNodes);
%     discovered(start) = 1;
%     queue = [];
%     queue(end + 1) = start;
%     depthTracker = [];
%     depthTracker(1) = 1;
%     depthCounter = 0;
%     while size(queue,2) > 0 % hmm
%       
%         v = queue(1);
%              
%         startToGoals(v) = d;
%        
%         vsNeigbours = mGraph(v,:);
%         notDiscorvered = not(discovered);  %do not add discovered to queue       
%         toQ = vsNeigbours & notDiscorvered; %if neigbour and not discovered, add to queue
%         discovered = toQ | discovered;   %update discovered             
%         indxsToQueue = find(toQ);     
%         queue = [queue, indxsToQueue];        
%         queue(1) = [];
%         
%         nextLocalDepth = length(indxsToQueue);
%         prevLocalD = nextLocalDepth;
%         if depthCounter == 0 
%            depthCounter = length(queue);
%            d = d+1;
%            
%         end
%         depthCounter = depthCounter - 1;
%         
%     end
% end
% function startToGoals = BreadthFirstSearch(start, mGraph)
%     nrOfNodes = size(mGraph,1);
%     
%     visited = zeros(nrOfNodes,1);
%     startToGoals = zeros(nrOfNodes,1);
%    
%     
%     dChecker = [1];
%     d = 0; 
%     
%     globalLen = [];
%     globalLen(1) = 0;
%     discovered = zeros(1,nrOfNodes);
%     discovered(start) = 1;
%     queue = [];
%     queue(end + 1) = start;
%     depthTracker = [];
% 
%     while size(queue,2) > 0 % hmm
%       
%         v = queue(1);
%         
%         
%         startToGoals(v) = d;
%         
%         if globalLen(1) <= 0
%             d = d+1;
%             globalLen(1) = [];
%         end
%         globalLen(1) = globalLen(1) - 1 ;
%         % DO SOMETHING HERE ABOUT THE DEPTH
%         vsNeigbours = mGraph(v,:);
%         notDiscorvered = not(discovered);  %do not add discovered to queue
%         
%         toQ = vsNeigbours & notDiscorvered; %if neigbour and not discovered, add to queue
%         discovered = toQ | discovered;   %update discovered 
%         
%         %------
%         currentDepth = startToGoals(v);
%         
%         
%         %------
%         
%         
%         indxsToQueue = find(toQ);
%         localLen = size(indxsToQueue,2);
%         globalLen(end+1) = localLen;
% 
%         queue = [queue, indxsToQueue];
%         
%         queue(1) = [];
%     end
% end