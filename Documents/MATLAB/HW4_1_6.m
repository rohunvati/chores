format long;

x = 2; % setting initial x value to 2.
max = 0; % letting max = 0, so that we can get 1 iteration.
n = 0; 
epsilon = 1; 

while (n <= max) % just want to loop through once.
    z = x - ((x^3 - 2*sin(x))/(3*x^2 + 2*cos(x))); % newton method.
    epsilon = abs(z-x);
    x = z; 
    n = n+1;
end

disp(z);

% so now, the x value after the first iteration will be used
% to start off the secant method.

xold = 2; %xnew is our xn, x is our xn-1, and xold
%is our xn-2. x is 1.66677, but we need an xold to 
%complete the secant method.
p = 0;
while (p <= 5)
xnew = x - ((x^3 - 2*sin(x))*(x - xold))/((x^3 - 2*sin(x))-(xold^3 - 2*sin(xold)));
xold = x;
x = xnew;
p = p+1;
end

disp(xnew);
