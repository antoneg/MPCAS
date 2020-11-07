%% This file provides the FORMAT you should use for the
%% slopes in HP2.3. x denotes the horizontal distance
%% travelled (by the truck) on a given slope, and
%% alpha measures the slope angle at distance x
%%
%% iSlope denotes the slope index (i.e. 1,2,..10 for the
%% training set etc.)
%% iDataSet determines whether the slope under consideration
%% belongs to the training set (iDataSet = 1), validation
%% set (iDataSet = 2) or the test set (iDataSet = 3).
%%
%% Note that the slopes given below are just EXAMPLES.
%% Please feel free to implement your own slopes below,
%% as long as they fulfil the criteria given in HP2.3.
%%
%% You may remove the comments above and below, as they
%% (or at least some of them) violate the coding standard
%%  a bit. :)
%% The comments have been added as a clarification of the
%% problem that should be solved!).


function alpha = GetSlopeAngle(x, iSlope, iDataSet)

if (iDataSet == 1)                                % Training
    if (iSlope == 1)
        alpha = 4 + sin(x/100) + cos(sqrt(2)*x/50);    % You may modify this!
    elseif iSlope == 2
        alpha = 3 + 2*sin(x/50) + cos(sqrt(2)*x/100) + 1.2*sin(x/150);
    elseif iSlope == 3
        alpha = 5 - sin(x/40) + cos(sqrt(3)*x/200) + cos(sqrt(3)*x/80);
    elseif iSlope == 4
        alpha = 5 - sin(x/400) + cos(sqrt(3)*x/200);
    elseif iSlope == 5
        alpha = 3-sin(x/30) - cos(sqrt(6)*x/100) +  cos(sqrt(2)*x/50);
    elseif iSlope == 6
        alpha = 7 - 0.33*sin(x/64) - 1.2*cos(sqrt(9)*x/70) + 0.3*sin(x/10);
    elseif iSlope == 7
        alpha = 3 + sin(x/70) - cos(sqrt(6)*x/70) + 0.5*sin(x/15);
    elseif iSlope == 8
        alpha = 4 + 0.8*sin(x/300) + 1.6*cos(sqrt(2)*x/75) + sin(x/60);
    elseif iSlope == 9
        alpha = 6.4 - 2*sin(x/150) +  1.3*cos(sqrt(3)*x/40);
    elseif (iSlope== 10)
        alpha = 4+ 0.33*sin(x/69) + cos(sqrt(2)*x/100);  % You may modify this!
    end
    
    
elseif (iDataSet == 2)                            % Validation
    if (iSlope == 1)
        alpha = 7.5 - sin(x/100) + cos(sqrt(3)*x/60);    % You may modify this!
    elseif(iSlope == 2)
        alpha = 5 + sin(x/50) + cos(sqrt(5)*x/50);
    elseif(iSlope == 3)
        alpha = 3 - sin(x/100)*0.333 + cos(sqrt(3)*x/50) + sin(x/100);
    elseif(iSlope == 4)
        alpha = 4 + 1/3*sin(x/203) - 3*cos(sqrt(1)*x/200);
    elseif (iSlope == 5)
        alpha = 6 + 2.5*sin(x/40) + 1/5*cos(sqrt(1)*x/50);    % You may modify this!
    end
    
    
elseif (iDataSet == 3)                           % Test
    if (iSlope == 1)
        alpha = 6 - sin(x/100) - cos(sqrt(7)*x/50);   % You may modify this!     
    elseif(iSlope == 2)
        alpha = 4 + (x/1400) + sin(x/30) + 0.5*cos(sqrt(7)*x/100);
    elseif(iSlope == 3)
        alpha = 1.5 + (x/210) + sin(x/100) - cos(sqrt(3)*x/100);
    elseif(iSlope == 4)
        alpha = 6 - 0.67*sin(x/160) +  2.2*cos(sqrt(3)*x/80);
    elseif (iSlope == 5)
        alpha = 4 + (x/1000) + sin(x/70) + cos(sqrt(7)*x/100); % You may modify this!
    end
end
