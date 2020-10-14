function  PlotAngleSlopes()


% fplot(@(x) 4 + sin(x/100) + cos(sqrt(2)*x/50 - 0.2*sin(x/40)) )
% 
% 
% hold on 
% fplot(@(x) 3 + 2*sin(x/50) + cos(sqrt(2)*x/100) + 1.2*sin(x/150))
% %  
% % %  
%  hold on 
%  fplot(@(x)5 - sin(x/40) + cos(sqrt(3)*x/200) + cos(sqrt(3)*x/80))
% % % 
% % % 
%  hold on 
%  fplot(@(x)5 - sin(x/400) + cos(sqrt(3)*x/200))
% % % 
%  hold on 
%  fplot(@(x) 3-sin(x/30) - cos(sqrt(6)*x/100) +  cos(sqrt(2)*x/50))
% % % 
% hold on 
% fplot(@(x)7 - 0.33*sin(x/64) - 1.2*cos(sqrt(9)*x/70) + 0.3*sin(x/10))
% % 
%  hold on 
%  fplot(@(x)3 + sin(x/70) - cos(sqrt(6)*x/70) + 0.5*sin(x/15))
% % % 
%  hold on 
%  fplot(@(x) 4 + 0.8*sin(x/300) + 1.6*cos(sqrt(2)*x/75) + sin(x/60) )
% % % 
%  hold on 
%  fplot(@(x) 6.4 - 2*sin(x/150) +  1.3*cos(sqrt(3)*x/40) )
% 
% hold on 
% fplot(@(x) 8 - 0.45*sin(x/80) + cos(sqrt(9)*x/75) )
% hold on 
% fplot(@(x) 5 + 3*sin(x/50) + 1/2*cos(sqrt(5)*x/50))


% 
% 
%VALIDATION!
% fplot(@(x)7.5 - sin(x/100) + cos(sqrt(3)*x/60))
% 
% hold on
% fplot(@(x)5 + sin(x/50) + cos(sqrt(5)*x/50))
% 
% hold on
% fplot(@(x)3 - sin(x/100)*0.333 + cos(sqrt(3)*x/50) + sin(x/100))
% 
% hold on
% fplot(@(x)4 + 1/3*sin(x/203) - 3*cos(sqrt(1)*x/200))
% 
% hold on
% fplot(@(x)6 + 2.5*sin(x/40) + 1/5*cos(sqrt(1)*x/50))
% 



% TRAINING
% fplot(@(x) 4 + sin(x/100) + cos(sqrt(2)*x/50));
% hold on
% 
% fplot(@(x)3 + 2*sin(x/50) + cos(sqrt(2)*x/100) + 1.2*sin(x/150));
% hold on
% 
% fplot(@(x)5 - sin(x/40) + cos(sqrt(3)*x/200) + cos(sqrt(3)*x/80));
% hold on
% 
% fplot(@(x)5 - sin(x/400) + cos(sqrt(3)*x/200));
% hold on
% 
% fplot(@(x)3-sin(x/30) - cos(sqrt(6)*x/100) +  cos(sqrt(2)*x/50));
% hold on
% 
% fplot(@(x)7 - 0.33*sin(x/64) - 1.2*cos(sqrt(9)*x/70) + 0.3*sin(x/10));
% hold on
% 
% fplot(@(x)3 + sin(x/70) - cos(sqrt(6)*x/70) + 0.5*sin(x/15));
% hold on
% 
% fplot(@(x)4 + 0.8*sin(x/300) + 1.6*cos(sqrt(2)*x/75) + sin(x/60));
% hold on
% 
% fplot(@(x)6.4 - 2*sin(x/150) +  1.3*cos(sqrt(3)*x/40));
% hold on
% 
% fplot(@(x) 4+ 0.33*sin(x/69) + cos(sqrt(2)*x/100)); 

%TESTING
fplot(@(x) 4 + (x/1400) + sin(x/30) + 0.5*cos(sqrt(7)*x/100));

hold on
fplot(@(x) 1.5 + (x/210) + sin(x/100) - cos(sqrt(3)*x/100));

hold on
fplot(@(x) 6 - 0.67*sin(x/160) +  2.2*cos(sqrt(3)*x/80));



xlim([0 1000]);
ylim([0 10]);
hold off
end