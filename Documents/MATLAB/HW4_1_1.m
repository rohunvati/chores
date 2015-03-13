format long;
f = @(t) tan(t) - t;
disp(f);
df = @(t) sec(t)^2;
disp(df);

t=7; 
epsilon=1;                         
max=199;   
n = 0;
tol = .0000000001;                       
z = 0;

while (epsilon >= tol) && (n<=max)                      
    z= t - (f(t))/(df(t));
    disp(z);
    epsilon=abs(z-t);                           
    t=z;
    n=n+1;                                
end                                            

