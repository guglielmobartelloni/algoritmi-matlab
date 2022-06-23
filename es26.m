% n=2;
% 
% f0*c02 f1*c12 f2*c22;
% f1*c(1) f2*c(2) f3*c(3); % in matlab
% 
% 
% 
% n = 4;
% 
% f0*c04 f1*c14 f2*c24 f3*c34 f4*c44;
% f1*c(1) f2*c(2) f3*c(3) f4*c(4) f5*c(5); % in matlab
fun=@(x) x.^2;
mi=mod(n,2);
a=0;
b=1;
n=2;
k=n;
tol = 1e-10;
c=pesiQuadraturaCotes(k);
h=(b-a)/k;
x=linspace(a,b,k+1);
y=feval(fun,x);
I=h*sum(y(1:k+1).*c(1:k+1));
I2=0;
errore=tol+.1;
while tol<errore
    k=k*2;
    x=linspace(a,b,k+1);
    y(1:2:k+1) = y(1:k/2+1);
    y(2:2:k) = feval(fun,x(2:2:k));
    h=(b-a)/k;
    for i = 1:n+1
            I2 = I2 + h*sum(y(i:n:k))*c(i);
    end
    I2 = I2 + h*y(k+1)*c(n+1);
    errore = abs(I2 - I)/(2^(n+mi) -1);
    I=I2;
end


