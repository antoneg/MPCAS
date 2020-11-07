totPatts = 70; %Total patterns. I just change this for every p=[12,24,48,70,120], because i'm lazy. 
errors = 0;

for trial = 1:100000 %for every trial...

    %Lets begin with generating random patterns! Every pattern is a column
    %vector in a matrix called allPatts. 
    allPatts = randi([0, 1], [120,totPatts]);
    allPatts(allPatts == 0) = -1;

    %Generate a random pattern-vector-index to get a random feeding pattern.
    randFeedInx = randi(totPatts);
    feedPattern = allPatts(:,randFeedInx);
    feedPattern;

    %.. and a random neuron's initial state (with a random row index) from the feeding pattern.
    randNeuronIndx = randi(120);
    initState = feedPattern(randNeuronIndx);

    %Calculate all the relevant weights. Instead of calculating the
    %complete weight matrix, only the row wich will be used for the one neuron, 
    %with index randNeuronIndx, is calculated.
    
    weightRow = zeros(1,120);
    for patts = 1:totPatts
        v = allPatts(:,patts);
        wr = v(randNeuronIndx) * v';
        weightRow = weightRow + wr;
    end
    
    %This is just removed in the other assignment. 
    weightRow(randNeuronIndx) = 0;

    %Calculate updated state of neuron.
    newStateXi = weightRow * feedPattern;

    %Sign the new state to 1 or -1.
    if (newStateXi < 0)
        newStateXi = -1;
    else
        newStateXi = 1;
    end

    %Count errors
    if(initState ~= newStateXi)
        errors = errors +1;
    end
end
%And finally! 
pError = errors/100000;
pError

