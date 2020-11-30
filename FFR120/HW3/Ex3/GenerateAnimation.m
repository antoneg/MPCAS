clear all
timeSteps = 25000;
nrOfParticles = 1000;
gridSize = 100;
activePassiveRatio = 0.022;
nrOfActiveParticles = round(activePassiveRatio*nrOfParticles);

data = load('0.03pi222.mat');
particleData = data.particleData;
clusterData = data.clusterData;
eta = data.eta;

myVideo = VideoWriter('myVideoFile'); %open video file
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
open(myVideo)

trace = [];
for t = 1:10:timeSteps
    particles = particleData(t,:,:);
    particles = reshape(particles,[nrOfParticles,5]);   
    
    pxsActive = particles(1:nrOfActiveParticles,1);
    pysActive = particles(1:nrOfActiveParticles,2);
    
    pxsPassive = particles(nrOfActiveParticles+1:nrOfParticles,1);
    pysPassive = particles(nrOfActiveParticles+1:nrOfParticles,2);
    
    plot(pxsActive,pysActive,'bo');
    hold on
    ylim([1, gridSize])
    xlim([1, gridSize])
    
    plot(pxsPassive,pysPassive,'ko');
    hold on
    ylim([1, gridSize])
    xlim([1, gridSize])
    
    %plot a trail
    if t < 1000
        tTrace = [1:10:t];
    else
        tTrace = [t-1000:10:t];
    end
    for tIndx = tTrace 
    particlesTrace = particleData(tIndx,:,:);
    particlesTrace = reshape(particlesTrace,[nrOfParticles,5]);   
    
    traceX = particlesTrace(1:nrOfActiveParticles,1);
    traceY = particlesTrace(1:nrOfActiveParticles,2);
    plot(traceX,traceY,'b.', 'MarkerSize', 0.1);
    hold on
    end
    
    title(['t = ', num2str(t), ', \eta = ',num2str(eta/pi), '\pi'])  
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
    hold off
    if(mod(t, 1000) == 0)
    disp(num2str(t));
    end
end
close(myVideo)
