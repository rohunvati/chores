format long;

x = 2;
max = 0;
n = 0;
values = x;
epsilon = 1; 

while (n <= max)
    z = x - ((x^3 - 3*x + 1)/(3*x^2 - 3));
    values = [values;z];
    epsilon = abs(z-x);
    x = z; 
    n = n+1;
end


