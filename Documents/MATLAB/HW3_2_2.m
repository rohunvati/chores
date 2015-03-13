format long;

f = @(x) 9*x.^4 + 18*x.^3 + 38*x.^2 - 57*x + 14;
a = 0; 
b = 1; 
c = (a+b)/2;
tol = .001;
while( (b-a) > tol) 
if f(c) == 0
        BREAK;
elseif ((f(a) * f(c))< 0);
    b = c;
else
    a = c;
end
end

disp(c);
disp(a);
disp(b);


    



