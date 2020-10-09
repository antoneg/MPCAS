TargetA = [-1, -1, 1, 1, 1, 1, -1, 1, -1, -1, 1, -1, -1, 1, -1, -1];
TargetB = [1, -1, 1, -1, -1, 1, -1, -1, -1, -1, -1, -1, 1, -1, -1, 1];
TargetC = [1, 1, 1, 1, 1, 1, -1, 1, 1, 1, -1, -1, 1, 1, -1, 1];
TargetD = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1, 1, 1];
TargetE = [1, 1, 1, -1, 1, 1, -1, -1, 1, 1, -1, 1, 1, -1, -1, -1];
TargetF = [1, -1, 1, 1, 1, -1, 1, 1, 1, 1, 1, 1, -1, 1, 1, 1];


target = TargetF; %I just change this
inputs = readmatrix('input_data_numeric.csv');

%initiate random weights and threshold
xmin = -0.2;
xmax = 0.2;
numOfInputs=4;
w = xmin+rand(1,numOfInputs)*(xmax-xmin);
threshold = -1 + rand(1,1)*(2);
%----
n = 0.02;
outputs = zeros(16,1);

for  i = 1:100000
    u = randi(16);
    in = inputs(u,2:5);
    
    %Feed in
    in = in';
    Bi = (w*in)-threshold;
    outputs(u) = tanh((1/2)*Bi);
    
    %Update
    derBi = ( (sech(Bi/2))^2 )* (1/2);
    weightedError = (target(u) - outputs(u))*derBi;
    
    inTmp = in';
    deltaW = n*weightedError*inTmp;
    w = w + deltaW;
    
    
    %Check outputs
    if(mod(i,16) == 0)
        tmpOutputs = outputs';
        for u2 = 1:16
            if tmpOutputs(u2) >= 0
                tmpOutputs(u2) = 1;
            else
                tmpOutputs(u2) = -1;
            end
        end
        
        if target == tmpOutputs
            disp("SUCCESS!");
            break;
        end
    end
end

