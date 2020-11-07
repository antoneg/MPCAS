function res = RunNetwork(w,ht,vt,p,m)



compV = zeros(9,1);
v = p;
for i = 1:100
    
    hField = (w*v);%-ht;
    for j = 1:m
        h(j) = SigmoidToValue(hField(j));
    end
    
    vField = (h*w);%-vt; %ok
    for k = 1:9
        v(k) = SigmoidToValue(vField(k));
    end
    
    if compV == v
        break
    end
    compV = v;
end

res = v;
end