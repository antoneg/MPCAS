function dTbVar = DeltaTbVariance(deltaTb, tau, Ch, pressure)
    if pressure < 0.01
        dTbVar = -(deltaTb/tau);
    else
        dTbVar = Ch*pressure; 
    end
end