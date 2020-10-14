function PlotTrainingAndValidation()

points = readmatrix('Points');
size(points,1)
xs = 1:300
%Validation plot
plot(xs, points(:,2),'g')

hold on
%Training plot
plot(xs, points(:,1),'r')
legend("Validation", "Training")

end