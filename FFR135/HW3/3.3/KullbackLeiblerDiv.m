function dTot = KullbackLeiblerDiv(nrOfPats, patFreq)  
dTot = 0;
for p = 1:nrOfPats
    probPat = patFreq(p);
    probPat = probPat/1000;
    q = (1/14)/probPat;
    dPat = (1/14)*log(q);
    dTot = dTot + dPat;
end
end