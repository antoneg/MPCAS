function iSelected = TournamentSelect(fitness, pTournament, tournamentSize)
    if(tournamentSize < 2)
        error("Tournament with at least 2 individuals!")
    end
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
        if(tournamentSize == tmpIndx) %Iterate from the beginning again.
            tmpIndx = 1;
        end
     end

 end