


function trapezoid(f, a, b, n) % this is the trapezoid function.
f = @(t) exp(t);  % the following f, a, b, and n values are 
% simply place holders to show the function works.
a = 0;
b = 1;
n = 300;
delta = (b-a)/n;
s = 0;

for x = a:delta:b; % I iterate from a to b, and the function does 
    % 2*f(x) at each iteration. 
    
    s = s + f(x) + f(x);

end

p = s - abs(f(b) + f(a)); % since I did 2*f(x) at each iteration, I account
% for this by subtracting f(b) and f(a).

g = p * .5 * delta; % we multiply deltax/2, so I do that here.

disp(g); % simply displaying our answer. 
end




