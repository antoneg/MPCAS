
function res = Polynomial(x, coeffsVec)
    
    exponent = 0;
    sum = 0;
        for i = 1:size(coeffsVec,2)
            coeff = coeffsVec(:,i);
            sum = sum + coeff*((x)^exponent);
            exponent = exponent+1;
        end
    res = sum;
end


    
        
    
