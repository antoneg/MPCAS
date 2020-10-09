% all slopes L, 1000 m long (horizontal distance)

Tmax = 750;
M = 20000;
tau = 30;
Ch = 40;
Tamb = 283;
Cb = 3000;
vMax = 25;
vMin = 1;
alphaMax = 10;
deltaT = 0.12;

%Initial states
startX = 0;
startV = 25;
gear = 7;
Tb = 500;

testAlpha = 20; %removethis later
testPressure = 0.5;
 
gravityForce = GravityForce(M, testAlpha);
brakeForce = FoundationBrakeForce(M, testPressure, Tb, Tmax);
engineBrakeForce = EngineBreakForce(gear, Cb);
acc = Acceleration(M, gravityForce, brakeForce, engineBrakeForce);

v = CurrentVelocity(acc, deltaT);

