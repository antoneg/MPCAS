function PlotAgents(plotSelection,susceptiblePop, recoveredPop, infectedPop, t)
if (plotSelection ~= 3) || (plotSelection ~= 4)
    figure(100);
    
    if(size(recoveredPop,1) > 0)
        recXs = recoveredPop(:,3);
        recYs = recoveredPop(:,4);
        if plotSelection == 1
            if mod(t, 100) == 0
                plot(recXs, recYs, 'g.');
                hold on
            end
        elseif plotSelection == 2
            if t == 100
                plot(recXs, recYs, 'g.');
                hold on
            end
        else
        end
        
    end
    
    if size(susceptiblePop,1) > 0
        susXs = susceptiblePop(:,3);
        susYs = susceptiblePop(:,4);
        if plotSelection == 1
            if mod(t, 100) == 0
                
                plot(susXs, susYs, 'b.');
                hold on
            end
        elseif plotSelection == 2
            if t == 100
                plot(susXs, susYs, 'b.');
                hold on
            end
        else
        end
        
    end
    
    if size(infectedPop,1) > 0
        infXs = infectedPop(:,3);
        infYs = infectedPop(:,4);
        if plotSelection == 1
            if mod(t, 100) == 0
                plot(infXs, infYs, 'r.');
                hold on
            end
        elseif plotSelection == 2
            if t == 100
                plot(infXs, infYs, 'r.');
                hold on
            end
        end
    else
    end
    
    if plotSelection == 1
        if mod(t,100) == 0
            title(['t=' num2str(t)]);
        end
    elseif plotSelection == 2
        if t == 100
            title(['t=' num2str(t)]);
        end
    else
    end
    axis([0 100 0 100]);
    xlabel('x');
    ylabel('y');
    hold off
end
end