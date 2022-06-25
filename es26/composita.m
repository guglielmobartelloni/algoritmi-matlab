function [If,err,nfeval] = composita( fun, a, b, n, tol)
%
%   [If,err,nfeval] = composita( fun, a, b, n, tol)
%   Calcolo dell'integrale di una funzione attraverso l'uso della formula
%   di Newton-Cotes di grado n fino ad arrivare alla tolleranza desiderata
%   Input:
%       fun - funzione integranda
%       [a,b] - intervallo considerato
%       n - grado della formula di Newton-Cotes
%   Output:
%       If - soluzione calcolata
%       err - errore di quadratura commesso
%       nfeval - numero di valutazioni funzionali fatte
%
if tol <0 || n<= 0 || a>b
    error('Dati non corretti')
end
mi=2-mod(n,2);
k=n;
c=pesiQuadraturaCotes(k);
h=(b-a)/k;
x=linspace(a,b,k+1);
y=feval(fun,x);
nfeval=length(x);
If=h*sum(y(1:k+1).*c(1:k+1));
err=tol;

while tol<=err
    k=k*2;
    I2=0;
    x=linspace(a,b,k+1);
    y(1:2:k+1) = y(1:k/2+1);
    y(2:2:k) = feval(fun,x(2:2:k));
    nfeval=nfeval+length(x(2:2:k));
    h=(b-a)/k;
    for i = 1:n+1
            I2 = I2 + h*sum(y(i:n:k))*c(i);
    end
    I2 = I2 + h*y(k+1)*c(n+1);
    err = abs(I2 - If)/(2^(n+mi) -1);
    If=I2;
end