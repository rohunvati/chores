x = -.5; % pick an x and xold.
xold = 1;

p = 0;
while (abs(xnew - x) <= .0001) && (p <= 25)
xnew = x - ((atan(x))*(x - xold))/((atan(x))-(atan(xold))); % doing secant
%method on arctanx.
xold = x;
x = xnew;
p = p+1;
end

disp(xnew);

e = xnew/(x*xold); 
df = 1/(xnew^2 + 1);
ddf = (2*xnew)/((xnew^2 + 1)^2);

h = (.5*ddf)/df; % this is second derivative * .5 divided by first
% derivative.

disp(e);
disp(h);
