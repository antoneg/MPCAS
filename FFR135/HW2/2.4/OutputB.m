function o = OutputB(threshold, weights, v2)  
    sum = weights*v2;
    sum = -threshold + sum;
    o = sum;
end

