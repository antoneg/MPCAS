function [updatedPopulation, updatedTileTracker] = MoveIndividuals(population, tileTracker, dProb)
updatedPopulation = population;
updatedTileTracker = containers.Map('KeyType','double','ValueType','any');;

popSize = size(population,1);

for i = 1:popSize
    rd = rand;
    xVel = 0;
    yVel = 0;
    currentX = population(i,3);
    currentY = population(i,4);
    if rd < dProb
        rDir = randi([1,4],1,1);

        switch(rDir)
            case(1) %up
                if currentY == 100
                    yVel = -1; %in case its at the top
                else
                    yVel = 1;
                end
            case(2) %down
                if currentY == 0 %.. and in case its at bot
                    yVel = 1;
                else
                    yVel = -1;
                end
            case(3) %right
                if currentX == 100
                    xVel = -1;
                else
                    xVel = 1;
                end
            case(4) %left
                if currentX == 0
                    xVel = 1;
                else
                    xVel = -1;
                end
            otherwise 
                error("Wtf, wrong in switch-case");
        end
    end
    newX = currentX + xVel;
    newY = currentY + yVel;
    updatedPopulation(i,3) = newX;
    updatedPopulation(i,4) = newY;
    
    %Updated tileTracker.
    tileNr = (newX-1)*100 + newY;
    ind = population(i,1); %Shouldn't matter tho
    if isKey(updatedTileTracker, tileNr)
        indIndxs = updatedTileTracker(tileNr);
        indIndxs(end + 1) = ind;
        updatedTileTracker(tileNr) = indIndxs;
    else
        updatedTileTracker(tileNr) = [ind];
    end
end
end