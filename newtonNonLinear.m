function [x,nit] = newtonNonLinear(fun,jacobian,x0,tol,maxit)
%
%
%
%
%
%
xn=x0;
for i=1:maxit
    b = -feval(fun,xn);
    A = feval(jacobian,xn);
    deltax = mialu(A,b);
    xn1=xn+deltax;
    xn=xn1;
    if norm(deltax./(1+abs(xn))) <= tol
        x=xn;
        nit=i;
        return
    end
end