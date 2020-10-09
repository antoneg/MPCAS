function c = ClassificationError(os, ts,u)
errors = 0;
% os
signedOs = zeros(u,1);    
    for i = 1:u
        o = os(i);
        if o >= 0
            o = 1;
        else
            o = -1;
        end
        signedOs(i) = o;
    end
%     signedOs
%     ts
    for i = 1:u
        o = signedOs(i);
        t = ts(i);
        if(o ~= t)
            
            errors = errors + 1;
        end
    end
    c = errors/u;
end

