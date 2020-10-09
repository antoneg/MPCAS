function iSelected = TournamentSelect(fitness, pTournament, tournamentSize)

     populationSize = size(fitness,1);
     noWinner = true;
     
     
     competitors = zeros(tournamentSize,2);
     
     for i = 1:tournamentSize
       randFitnessIndx = 1 + fix(rand*populationSize);
       competitors(i,1) = randFitnessIndx;
       competitors(i,2) = fitness(randFitnessIndx);
     end
     
     competitors = sortrows(competitors,2);
     competitors = flip(competitors);
     
     tmpIndx = 1;
     while noWinner
        r = rand;
        contestorIndx = competitors(tmpIndx,1);
        if (r<pTournament)
            iSelected = contestorIndx;
            noWinner = false;
        else
            tmpIndx = tmpIndx + 1;
        end
        if(tournamentSize == tmpIndx) %Last standing, winner! (I guess this is correct? Another idea would be to iterate from the beginning again.)
            iSelected = competitors(tmpIndx,1);
            noWinner = false;
        end
     end
%      
% 
%      if (r < pTournament)
%          if (fitness(iTmp1) > fitness(iTmp2))
%             iSelected = iTmp1;
%          else
%             iSelected = iTmp2;
%          end      
%      else
%         if (fitness(iTmp1) > fitness(iTmp2))
%             iSelected = iTmp2;
%         else
%             iSelected = iTmp1;
%         end
%      end
 end