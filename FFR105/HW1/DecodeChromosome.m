function x = DecodeChromosome(chromosome,nVariables,variableRange)
    
    nGenes = size(chromosome,2);  
    nGenesPerVar = fix(nGenes/nVariables); 
     
    %Each variable can be seen as a columnvector containing the
    %corresponding genes.  
    variableVectors = reshape(chromosome,nGenesPerVar,nVariables);
      
    for i = 1:nVariables
        x(i) = 0.0;
        for j = 1:nGenesPerVar
            x(i) = x(i) + variableVectors(j,i)*2^(-j);
        end
       x(i) = -variableRange + 2*variableRange*x(i)/(1 - 2^(-nGenesPerVar));
    end
end