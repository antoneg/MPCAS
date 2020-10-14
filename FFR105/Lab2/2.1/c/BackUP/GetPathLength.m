function pathLength = GetPathLength(path,cityLocation)
    pathLength = 0;
    size(path,2);
    for i = 1:50
        if i == 50
            fromIndx = path(50);
            toIndx = path(1);
            from = cityLocation(fromIndx,:);
            to = cityLocation(toIndx,:);
            % detta kan flyttas ned som en gemensam!!
            subPathLen = norm(from-to);
            pathLength = pathLength + subPathLen;
        else
            fromIndx = path(i);
            toIndx = path(i+1);
            from = cityLocation(fromIndx,:);
            to = cityLocation(toIndx,:);
            
            subPathLen = norm(from-to);
            pathLength = pathLength + subPathLen;
        end
    end
end