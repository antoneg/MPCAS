function newBrakeTemp = UpdateBrakeTemperature(pressure, brakeTemp, tau, deltaTime, Ch, ambientTemp)
    if pressure < 0.01
        newDeltaTemp = brakeTemp + -(brakeTemp*deltaTime)/tau;
    else 
        newDeltaTemp = brakeTemp + Ch*pressure*deltaTime;
    end
    newBrakeTemp = ambientTemp + newDeltaTemp;
end