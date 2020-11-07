
function res = ComputeGradient(x1,x2,u)
    x1Res = 2*x1-2 + 4*u*x1*(x1^2 + x2^2 -1);
    x2Res = 4*x2-8 + 4*u*x2*(x1^2 + x2^2 -1);
    resVec = [x1Res;x2Res];
    res = resVec;
end


