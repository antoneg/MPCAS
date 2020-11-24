clear all;
nrOfParticles = 4;
particles = InitializeParticles(nrOfParticles);

timeSteps = 50;

omega = 0;
Dt = 0.22;
Dr = 0.16;

for t = 1:timeSteps
    % Plot
    PlotParticles(particles, t);
    %Move
    particles = UpdatePositions(particles, omega, Dt, Dr);
end
    xlim([-100 100])
    ylim([-100 100])
    xlabel('x[\mum]')
    ylabel('y[\mum]')
    title("t = 50[s]")
    legend("v = 0", "v = 1", "v = 2", "v = 3")


