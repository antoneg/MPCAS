clear all
timeSteps = 2000;
nrOfParticles = 100;
gridSize = 100;
data = load('smallPi.mat');
particleData = data.particleData;
clusterData = data.clusterData;

myVideo = VideoWriter('myVideoFile'); %open video file
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
open(myVideo)

% for t2 = 1:10:4000
%     tmpCluster = clusterData(t2,:,:);
%     tmpCluster = reshape(tmpCluster,[nrOfParticles,nrOfParticles]);
%     tmpCluster = OptimizeClusterData(tmpCluster);
%     clusterData(t2,:,:) = tmpCluster;
%     if(mod(t2, 1000) == 0)
%         disp(num2str(t2))
%     end
% end
% % 
for t = 1:10:40000
    particles = particleData(t,:,:);
    particles = reshape(particles,[nrOfParticles,4]);
    clusters = clusterData(t,:,:);
    
    clusters = reshape(clusters,[nrOfParticles,nrOfParticles]);    
    
    pxs = particles(:,1);
    pys = particles(:,2);
    
    plot(pxs,pys,'ko', 'MarkerSize', 4);
    hold on
    ylim([1, gridSize])
    xlim([1, gridSize])
    
    
    
    for i = 1:nrOfParticles
        localCluster = clusters(i,:);
        localCluster = localCluster(localCluster ~= 0);
        
        
        clusterSize = size(localCluster,2);
        
        if clusterSize >= 2
        for j = 1:clusterSize
            pIndx = localCluster(j);
            
            
            x = particles(pIndx,1);
            y = particles(pIndx,2);
            if clusterSize == 2
                plot(x,y,'ro', 'MarkerSize', 4);
            elseif clusterSize == 3
                plot(x,y,'bo', 'MarkerSize', 4);
            elseif clusterSize == 4
                plot(x,y,'go', 'MarkerSize', 4);
            elseif clusterSize == 5
                plot(x,y,'mo', 'MarkerSize', 4);
            elseif clusterSize == 6
                plot(x,y,'yo', 'MarkerSize', 4);
            end
            hold on
            ylim([1, gridSize])
            xlim([1, gridSize])
        end
        end
        
    end
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
    hold off
end
close(myVideo)