% InsertBestIndividual: This function should take as input (i) a population and (ii) the best
% individual in the most recently evaluated generation (which should be stored in connection with
% the evaluation of the population) and (iii) the number of copies nc of the best individual that
% are to be inserted (normally one or two). The function should then insert the best individual in
% the nc first positions in the population (replacing the individuals that have been placed there
% during selection, crossover, and mutation), and return the modified population.

function modifiedPopulation = InsertBestIndividual(population, bestIndividual, nCopies)
    modifiedPopulation = population;
    for i = 1:nCopies
        modifiedPopulation(i).Chromosome  = bestIndividual;
    end
end