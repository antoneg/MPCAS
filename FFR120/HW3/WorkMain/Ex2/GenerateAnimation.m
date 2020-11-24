clear all
timeSteps = 2000;
nrOfParticles = 100;
gridSize = 100;
data = load('lowEta.mat');
particleData = data.particleData;
clusterData = data.clusterData;

myVideo = VideoWriter('myVideoFile'); %open video file
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
open(myVideo)

for t = 1:timeSteps
   particles = particleData(t,:,:);
   particles = reshape(particles,[nrOfParticles,4]);
   clusters = clusterData(t,:,:);
   clusters = reshape(clusters,[nrOfParticles,nrOfParticles]);
    
    for i = 1:nrOfParticles
        x = particles(i,1);
        y = particles(i,2);
        plot(x,y,'ro', 'MarkerSize', 4);
        frame = getframe(gcf); %get frame
        writeVideo(myVideo, frame);
    end
   
    for i = 1:nrOfParticles
        localCluster = clusters(:,i);
        localCluster = find(localCluster);
        
        for j = 1:size(localCluster,1)
        pIndx = localCluster(j);
            
        x = particles(pIndx,1);
        y = particles(pIndx,2);
        plot(x,y,'bo', 'MarkerSize', 4);
        frame = getframe(gcf); %get frame
        writeVideo(myVideo, frame);
        end

    end
   t
end
close(myVideo)