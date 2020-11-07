function updatedIndividuals = MoveIndividuals(individuals, dProb)
updatedIndividuals = [];
nrOfIndividuals = size(individuals,1);
for i = 1:nrOfIndividuals
    velX = 0;
    velY = 0;
    currentX = individuals(i,2);
    currentY = individuals(i,3);
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
    updatedIndividuals(i,:) = [i;newX;newY];
end
end