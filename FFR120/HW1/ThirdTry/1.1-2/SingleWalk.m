% -----------------Single Walk------------
timeSteps = 100;
xStart = randi([1,100], 1,1);
yStart = randi([1,100], 1,1);

x = xStart;
y = yStart;
dProb = 0.8;


%For a nice plot
xMin = xStart;
xMax = xStart;
yMin = yStart;
yMax = yStart;

figure(100);
text(x,y,'Start');
hold on
for t = 1:timeSteps
    if t == 1
        plot(x,y,'go'); %Start
    elseif t == timeSteps
        plot(x,y,'ro'); %End
        hold on
        text(x,y,'End');
    else
        if (x == xStart) && (y == yStart)
            plot(x,y,'go'); %In case its back to the start position, plot green
        else
            plot(x,y,'bo');
        end
        
    end
    hold on
    
    if x < xMin
        xMin = x;
    end
    if x > xMax
        xMax = x;
    end
    
    if y < yMin
        yMin = y;
    end
    if y > yMax
        yMax = y;
    end
    
    
    %Update position.
    %MOVE AND USE THIS IN FUNCTION LATER!
    rd = rand;
    xVel = 0;
    yVel = 0;
    
    if rd < dProb
        rDir = randi([1,4],1,1);
        switch(rDir)
            case(1) %up
                if y == 100
                    yVel = -1; %in case its at the top
                else
                    yVel = 1;
                end
            case(2) %down
                if y == 0 %.. and in case its at bot
                    yVel = 1;
                else
                    yVel = -1;
                end
            case(3) %right
                if x == 100
                    xVel = -1;
                else
                    xVel = 1;
                end
            case(4) %left
                if x == 0
                    xVel = 1;
                else
                    xVel = -1;
                end
            otherwise
                error("Bad random direction. This should be impossible.");
        end
    end
    x = x + xVel;
    y = y + yVel;
end
axis([(xMin-3) (xMax + 3) (yMin - 3) (yMax + 3)]);
title('Single walk, t = 100')
xlabel('x')
ylabel('y')