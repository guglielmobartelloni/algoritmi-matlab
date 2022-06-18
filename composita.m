function [If,err,nfeval] = composita( fun, a, b, n, tol)
%
%
%
%
%
%
%
y=feval(fun, linspace(a,b,n+1));
h=(b-a)/n;
I1=h*(sum(y) - f(1)/2 - f(end)/2);
I2= 2*h*(sum(y(1:2:end)) - f(1)/2 - f(end)/2);
e = abs(I2-I1)/3;
end