


function simp_result = Simpson(f, a, b, level, level_max)

f = @(x) sqrt(1-x^2) -x;
a = 0;
b = 1/sqrt(2);
c = (1/2) * (a+b);
h = b-a;
level = 0;
level_max = 4;

level = level + 1;
one_sim= (h*(f(a) + f(c) + f(c) + f(c) + f(c) + f(b)))/6;

d = (a+c)/2;
e = (c+b)/2;
%here i'm just assigning the intervals d, e, which is further splitting 
%our initial interval.
two_sim = (h*(f(a) + f(d) + f(d) + f(d) + f(d) + f(c) + f(c) + f(e) + f(e) + f(e) + f(b)))/12;

% if the second simpson function - the first simpson function 
% are within our tolerance, then we spit out what's given below.
% else, we do a recursive algorithm, calculating the left and right.
if (two_sim - one_sim) < (.5 * 10^-5) 
    
    simp_result = two_sim + (two_sim - one_sim);
    
else
    left_simp = Simpson(f, a, c, level, level_max);
    right_simp = Simpson(f, c, b, level, level_max);
    simp_result = left_simp + right_simp;
    
end


disp(simp_result);

end









