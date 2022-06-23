function [x, nr] = miaqr(A, b)
%   [x, nr] = miaqr(A, b)
% Calcola la soluzione del sistema lineare sovradeterminato Ax=b nel senso
% dei minimi quadrati
%   Input:
%       A - Matrice mxn dove m>n
%       b - vettore dei termini noti
%   Output:
%       x - soluzione calcolata
%       nr - norma del vettore residuo
%
    [m, n] = size(A);
    for i = 1:n
        alfa = norm(A(i:m, i));
        if alfa == 0, error('La matrice A non ha rango massimo'), end

        if A(i, i) > 0
            alfa = -alfa;
        end

        v1 = A(i, i) - alfa;
        A(i, i) = alfa;
        A(i + 1:m, i) = A(i + 1:m, i) / v1;
        beta = -v1 / alfa;
        A(i:m, i + 1:n) = A(i:m, i + 1:n) - (beta * [1; A(i + 1:m, i)]) * ([1 A(i + 1:m, i)'] * A(i:m, i + 1:n));
        b(i:m) = b(i:m) - (beta * [1 A(i + 1:m, i)'] * b(i:m)) * [1; A(i + 1:m, i)];
    end

    x = b(1:n);

    for i = n:-1:1
        x(i) = x(i) / A(i, i);
        x(1:i - 1) = x(1:i - 1) - A(1:i - 1, i) * x(i);
    end
    nr = norm(b(n+1:m));
