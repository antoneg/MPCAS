function pathLength = GetPathLength(path,cityLocation)
    pathLength = 0;
    size(path,2);
    for i = 1:49

            fromIndx = path(i);
            toIndx = path(i+1);
            from = cityLocation(fromIndx,:);
            to = cityLocation(toIndx,:);
            
            subPathLen = norm(from-to);
            pathLength = pathLength + subPathLen;
    end
            fromIndx = path(50);
            toIndx = path(1);
            from = cityLocation(fromIndx,:);
            to = cityLocation(toIndx,:);
           
            subPathLen = norm(from-to);
            pathLength = pathLength + subPathLen;
end