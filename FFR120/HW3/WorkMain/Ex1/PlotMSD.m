
timeSteps = 100;
runs = 1000;
nrOfParticles = 4;

data = load('MSDdata.mat');
particleData = data.particleData;
for p = 1:nrOfParticles
    tot = 0;
    avr = [];
    pData = particleData(p,:,:);
    pData = reshape(pData,[runs,timeSteps]);
    for i = 1:timeSteps
        tot = sum(pData(:,i));
        avr(i) = tot./runs;
    end
    loglog([1:timeSteps], avr);
    hold on
end

