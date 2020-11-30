clear all
timeSteps = 20000;
nrOfParticles = 100;
gridSize = 100;
data = load('bigPi.mat');
particleData = data.particleData;
clusterData = data.clusterData;
eta = data.eta;

myVideo = VideoWriter('myVideoFile'); %open video file
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
open(myVideo)

for t = 1:10:timeSteps
    particles = particleData(t,:,:);
    particles = reshape(particles,[nrOfParticles,4]);
    clusters = clusterData(t,:,:);
    
    clusters = reshape(clusters,[nrOfParticles,nrOfParticles]);
    
    pxs = particles(:,1);
    pys = particles(:,2);
    
    plot(pxs,pys,'ko', 'MarkerSize', 5);
    hold on
    ylim([1, gridSize])
    xlim([1, gridSize])
    
    %plot trace
    for backT = 1:3
        if t - 10*backT > 0
            tIndx = t - 10*backT;
            particlesTrace = particleData(tIndx,:,:);
            particlesTrace = reshape(particlesTrace,[nrOfParticles,4]);
            pxsTrace = particlesTrace(:,1);
            pysTrace = particlesTrace(:,2);            
            plot(pxsTrace,pysTrace,'k.');
            hold on
            ylim([1, gridSize])
            xlim([1, gridSize])
        end
    end
    
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
                    plot(x,y,'ro', 'MarkerSize', 5);
                elseif clusterSize == 3
                    plot(x,y,'bo', 'MarkerSize', 5);
                elseif clusterSize == 4
                    plot(x,y,'go', 'MarkerSize', 5);
                elseif clusterSize == 5
                    plot(x,y,'mo', 'MarkerSize', 5);
                elseif clusterSize >= 6
                    plot(x,y,'yo', 'MarkerSize', 5);
                end
                
                hold on
                ylim([1, gridSize])
                xlim([1, gridSize])
            end
        end
        
    end
    title(["t = " num2str(t) " \eta = " num2str(eta/pi)])
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
    hold off
end
close(myVideo)
