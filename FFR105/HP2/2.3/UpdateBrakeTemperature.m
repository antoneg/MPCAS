function newBrakeTemp = UpdateBrakeTemperature(pressure, brakeTemp, tau, deltaTime, Ch, ambientTemp)
deltaBrakeTemp = brakeTemp - ambientTemp;
if pressure < 0.01
    tempStep = -(deltaBrakeTemp)/tau;
else
    tempStep = Ch*pressure;
end
deltaBrakeTemp = deltaBrakeTemp + tempStep*deltaTime;
newBrakeTemp = ambientTemp + deltaBrakeTemp;
end