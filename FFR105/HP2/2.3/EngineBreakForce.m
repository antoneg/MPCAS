function Feb = EngineBreakForce(gear, Cb)
if gear == 1
    Feb = 7*Cb;
elseif gear == 2
    Feb = 5*Cb;
elseif gear == 3
    Feb = 4*Cb;
elseif gear == 4
    Feb = 3*Cb;
elseif gear == 5
    Feb = 2.5*Cb;
elseif gear == 6
    Feb = 2*Cb;
elseif gear == 7
    Feb = 1.6*Cb;
elseif gear == 8
    Feb = 1.4*Cb;
elseif gear == 9
    Feb = 1.2*Cb;
else %gear 10
    Feb = Cb;
end
end