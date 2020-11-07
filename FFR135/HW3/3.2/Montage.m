
%---- PlotAndCompareImages ------------------
load('matlab.mat');

network = net2; %Just change this (net1, net2).
compIndexes = [];
for i = 1:10
    out = Inf; % -> entry to while loop
    while((out) ~= i)
        r = randi([1,10000],1,1);
        validOut = tValid(r);
        out = double(validOut);
    end
    compIndexes(i) = r;
end
for i = 1:10

    compIndx = compIndexes(i);
    feed = xValid(:,compIndx);   
    target = xValidTmp(:,:,1,compIndx);
    
    output = predict(network,feed);     
    output2d = reshape(output,28,28);
    
    %plot target and output
    subplot(2,10,i), imshow(mat2gray(target));
    subplot(2,10,10+i), imshow(mat2gray(output2d));
end
%---- PlotAndCompareImages END ------------------