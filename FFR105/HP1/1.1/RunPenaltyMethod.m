
function RunPenaltyMethod
    T = 10^(-6);
    n = 0.0001;
    startingPoints = [1;2];
    muIterations = 4; %[1,10,100,1000] 
    for i = 0:(muIterations-1)
        minXs = RunGradientDescent(startingPoints,10^i,n,T);
        x1 = minXs(1,1);
        x2 = minXs(2,1);

        fprintf('%4d %15.3f %15.3f',(10^i),x1,x2);
        fprintf('\n');
                 
    end
end
