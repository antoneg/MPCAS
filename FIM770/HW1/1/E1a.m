% syms f(x,h,r);
% f(x,h,r) = h+x(r-x);
% fplot(f);

% syms f1(r)
% f1(r) = -((r^2)/4);
% fplot(f1);
% hold on

syms f2(x,r)
f2(x,r) = -((r^2)/4) + x*(r-x);
fsurf(f2(x,r))
grid on
