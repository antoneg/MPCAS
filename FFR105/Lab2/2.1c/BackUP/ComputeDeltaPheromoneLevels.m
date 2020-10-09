function deltaTau = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection)
   %paths är rader tydligen, lol
   %haha, det är pathlength också!!
    numbOfAnts = size(pathLengthCollection,1);
    deltaTau = zeros(50,50);
    
for k = 1:numbOfAnts
    distance = pathLengthCollection(k);
    
    path = pathCollection(k,:);
    
    for i = 1:50
        if(i ~= 50)
            from = path(i);
            to = path(i+1);
            deltaTau(from,to) = deltaTau(from,to) + (1/distance);
           % deltaTau(to,from) = deltaTau(from,to);
        else
            from = path(50);
            to = path(1);
            deltaTau(from,to) = deltaTau(from,to) + (1/distance);
            %deltaTau(to,from) = deltaTau(from,to);
        end
    end
end

% function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,  pathLengthCollection)
%     numberOfPaths = size(pathCollection, 1);
%     numberOfNodes = size(pathCollection, 2) - 1;
%     numberOfNodes
%     deltaPheromoneLevel = zeros(numberOfNodes);
%     
%     for k = 1:numberOfPaths
%         path = pathCollection(k, :);
%         pathLength = pathLengthCollection(k);
%         
%         numberOfNodesInPath = size(path, 2);
%         traversedEdges = zeros(numberOfNodes);
%         
%         for i = 1:numberOfNodesInPath - 1
%             fromNode = path(i);
%             toNode = path(i + 1);
%             traversedEdges(fromNode, toNode) = 1;
%             traversedEdges(toNode, fromNode) = 1;
%         end
%         
%         for i = 1:numberOfNodes
%             for j = i+1:numberOfNodes
%                 if traversedEdges(i, j) == 1
%                     deltaPheromoneLevel(i, j) = deltaPheromoneLevel(i, j) + 1 / pathLength;
%                     deltaPheromoneLevel(j, i) = deltaPheromoneLevel(i, j);
%                 end
%             end
%         end
%     end
% end