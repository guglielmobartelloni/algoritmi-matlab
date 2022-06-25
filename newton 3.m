function [x,nit] = newton(fun,jacobian,x0,tol,maxit)
%
%   [x,nit] = newtonNonLinear(fun,jacobian,x0,tol,maxit)
%   Calcola la soluzione del sistema non lineare attraverso il metodo di
%   Newton
%   Input:
%       fun - sistema da risolvere
%       jacobian - matrice jacobiana del sistema
%       x0 - vettore con le approssimazioni iniziali delle radici
%       tol - tolleranza desiderata
%       maxit - massimo di iterazioni da compiere
%   Output:
%       x - soluzione del sistema non lineare
%       nit - numero di iterazioni compiute
%

if nargin==3
    tol=1e-3;
    maxit=20;
end
if tol < 0
    error('Tolleranza non corretta')
end
if maxit <= 0
    error('Il numero di iterazioni deve essere positivo');
end

xn=x0;
for i=1:maxit
    b = -fun(xn);
    A = jacobian(xn);
    deltax = mialu(A,b);
    xn1=xn+deltax;
    if norm((xn1-xn)./(1+abs(xn))) <= tol
        x=xn1;
        nit=i;
        return
    end
    xn=xn1;
end