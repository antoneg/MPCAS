clear all
Ms = [2,4,8,16];
 for currentRun = 1:4
    patterns = LoadPatterns();
    eMax = 1000;
    k = 100;
    M = Ms(currentRun);
    weights = zeros(M,9);
    n = 0.01;
    hiddenThres = zeros(M,1);
    visableThres = zeros(9,1);
    
    %Init weights range [-1, 1]  and thresholds -1 or 1
    weights = -1 + 2.*rand(M,9);
    hiddenThres = randi([0 1], M,1).*2 -1
    visableThres = randi([0 1], 9,1).*2 -1
    h = zeros(M,k);
    v = zeros(9,k);
    DLVs = [];
   
    for e = 1:eMax
        shuffledPatterns = patterns(:,:,randperm(14));
        nrOfPats = randi([1,14],1,1);
        deltaWeights = zeros(M,9);
        deltaHiddenThresholds = zeros(M,1);
        deltaVisableThresholds = zeros(9,1);
        for u = 1:nrOfPats
            pat = shuffledPatterns(:,:,u);
   
            v0 = pat(:);
            hLocalFld = (weights*v0)-hiddenThres; 
            
            for i = 1:M
                r = rand;
                hVec(i) = SigmoidToValue(hLocalFld(i));
            end
            h0 = hVec;
            h0 = h0';
            for t = 1:k
                if t == 1
                    hTmp = h0;
                else
                    hTmp = h(:,(t-1));
                end

                for j = 1:9
     
                vLocalField(j) = dot(hTmp,(weights(:,j))) - visableThres(j); 
                end
                
                for j = 1:9
                    vVec(j) = SigmoidToValue(vLocalField(j));
                end
                vVec = vVec';
                
                v(:,t) = vVec';
                
                hLocalField = (weights*v(:,t))- hiddenThres; 
                for i = 1:M
                    hVec(i) = SigmoidToValue(hLocalField(i));
                end
                
                hVec = hVec';
                h(:,t) = hVec;
                
            end
            deltaWeights(:,:,u) = ComputeDeltaWeights(n,weights,v0,v(:,k),hiddenThres);                    
            deltaHiddenThresholds(:,u) = ComputeDeltaHiddenThresholds(n,weights,v0,v(:,k),hiddenThres);   
            deltaVisableThresholds(:,u) = ComputeDeltaVisableThresholds(n, v0, v(:,k));                  
        end
        for u = 1:nrOfPats
            weights = weights + deltaWeights(:,:,u);
            hiddenThres = hiddenThres +deltaHiddenThresholds(:,u);
            visableThres = visableThres + deltaVisableThresholds(:,u); 
            
        end
        %Calculate  Kullback-Leibler divergence
        matches = 0;
        patternFreq = zeros(1,14);
        for i2 = 1:1000
            rndPat = GenerateRandomPattern();
            res = RunNetwork(weights, hiddenThres, visableThres, rndPat, M);
            for p = 1:14
                target = patterns(:,:,p);
                target = target(:);
                if res == target
                    matches = matches + 1;
                    patternFreq(p) = patternFreq(p) + 1;
                end
            end
        end
        D = KullbackLeiblerDiv(nrOfPats, patternFreq);
        DLVs(e) = D;
    end
    %Plot  Kullback-Leibler divergence
    figure(1)
    if currentRun == 1
        plot(1:eMax, DLVs,'r');
        hold on
    elseif currentRun == 2
        plot(1:eMax, DLVs,'g');
        hold on
    elseif currentRun == 3
        plot(1:eMax, DLVs, 'b');
        hold on
    else
        plot(1:eMax, DLVs, 'c');
        hold on
    end
    legend("2 hidden", "4 hidden", "8 hidden", "16 hidden")
end

%Test on distorted pattern and plot
figure(2)
distPattern = [1;-1;1;0;0;0;0;0;0];
feedPattern = distPattern;
firstImgPattern = [255,0,255];
for i = 1:10
    
    newPattern = RunNetwork(weights, hiddenThres, visableThres, feedPattern, M);
    feedPattern = newPattern;
   
    
    imgData = [];
    for j = 1:3
        if newPattern(j) == 1
            imgData(j) = 255;
        else
            imgData(j) = 0
        end
    end
    subplot(2,10,i), imshow(mat2gray(imgData));
    subplot(2,10,10+i), imshow(mat2gray(firstImgPattern));
    newPattern = [];
end



