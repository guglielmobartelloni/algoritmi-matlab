function x = Chebyshev(n, a, b)
%
% x = Chebyshev(n, a, b)
% Calcolo delle ascisse di Chebyshev
%
% Input:
% n: grado del polinomio 
% a,b: estremi dell'intervallo
%
% Output:
% x: vettore contenente le ascisse di Chebyscev
%
if a >= b
    error("estremi dell'intervallo non corretti");
end 

if n <= 0 || n ~= fix(n)
    error("il grado del polinomio è errato");
end

x = (a+b)/2+((b-a)/2)*cos(((2*[n:-1:0]+1)/(2*(n+1)))*pi);