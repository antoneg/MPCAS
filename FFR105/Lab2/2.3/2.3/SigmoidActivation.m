function neurons = SigmoidActivation(localFields)
    L = 1;
    k = 1;
    x0 = 0;
   
   nrOfneurons = size(localFields,1);
   
   neurons = zeros(nrOfneurons,1);
   
   for i = 1:nrOfneurons
   neuronLocalField = localFields(i);
   neurons(i) = L/(1+exp(-k*(neuronLocalField-x0)));
   end
end