%  T = 2*10^5 
%  p=7 
%  N=200, 
%  and β = 2

%generate 7 random patterns:
mAvr = 0;
BETA = 2;
totPatterns = 45; % or 7

% for 100 trials, to calculate m average
for m = 1:100
 
    %random patterns
    patterns = randi([0, 1], [200,totPatterns]); 
    patterns(patterns == 0) = -1;

    %pick first pattern
    firstPattern = patterns(:,1);
    stateVector = firstPattern;

    %calculate weights
    wij = zeros(200,200);
    for p = 1:totPatterns
        v = patterns(:,p);
        vt = v';
        wij = wij + (v*vt);
    end

    for i = 1:200
        wij(i,i) = 0;
    end
    wij = wij * (1/200);
    
    %begin calculating for T
    sumTs = 0;
    for T = 1:(10^3) %this combined with the inner loop will give 2*10^5 updates.
        sumNs = 0;
        
        %begin calculating for a statevector
        for i = 1:200
            %calculate b, the local field
            b = wij(i,:) * stateVector; 
            %the stochastic update rule gives:
            pOfb = 1/(1+exp(-2*BETA*b));
            r = rand();
            if(r < pOfb)
                newState = 1;
            else
                newState = -1;
            end
            stateVector(i,1) = newState;
            
            sumNs = sumNs + (newState * firstPattern(i,:));
        end       
        sumTs = sumTs + sumNs;
    end
    mAvr = mAvr + sumTs;  
end
res = mAvr/(2*10^7); %100 * 10^3 * 200 = 2*10^7
res