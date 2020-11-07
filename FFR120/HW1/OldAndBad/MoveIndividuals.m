function updatedIndividuals = MoveIndividuals(groupContainer, dProb)
updatedIndividuals = containers.Map('KeyType','double','ValueType','any');
allKeys = keys(groupContainer);
nrOfIndividuals = size(allKeys,2);
updatedIndividuals = groupContainer;
if nrOfIndividuals > 0
for i = 1:nrOfIndividuals
    currentKey = allKeys(i);
    currentKey = currentKey{1,1};
    location = groupContainer(currentKey);
    velX = 0;
    velY = 0;
    currentX = location(1); % x
    currentY = location(2); % Y
    %maybe move with a probability?
    %For x-pos
    r = rand;
    if r < dProb
        %Move von neuman step
        rAxis = rand;
        %Just decide that this implies x-asis
        if rAxis < 0.5
            if(currentX == 0)
                velX = 1;
            elseif(currentX == 100)
                velX = -1;
            else
                rDir = rand;
                %Just decide this implies +1
                if rDir < 0.5
                    velX = 1;
                else
                    velX = -1;
                end
                %                 m = randi([-1 ,1],1)
                %                 m(~m) = -1
                
            end
        else
            
            if(currentY == 0)
                velY = 1;
            elseif(currentY == 100)
                velY = -1;
            else
                rDir = rand;
                %Just decide this implies +1
                if rDir < 0.5
                    velY = 1;
                else
                    velY = -1;
                end
                %                 m = randi([-1 ,1],1)
                %                 m(~m) = -1
                
            end
        end
        
    end
    newX = currentX + velX;
    newY = currentY + velY;
    updatedIndividuals(currentKey) =[newX, newY];
end
end
end