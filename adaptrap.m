function I2 = adaptrap(f, a, b, tol, fa, fb)
    %
    %Utilizzo: I2 = adaptrap(f, a, b, tol)
    %
    %Input:
    %   f - function funzione integranda;
    % a,b - estremi intervallo di integrazione;
    % tol - accuratezza richiesta.
    %
    % Output:
    %  I2 - approssimazione ottenuta.
    %
    if nargin <= 4
        fa = feval(f, a); fb = feval(f, b);
    end

    h = b - a;
    x1 = (a + b) / 2;
    f1 = feval(f, x1);
    I1 = (h / 2) * (fa + fb);
    I2 = (I1 + h * f1) / 2;
    e = abs(I2 - I1) / 3;

    if e > tol
        I2 = adaptrap(f, a, x1, tol / 2, fa, f1) + ...
            adaptrap(f, x1, b, tol / 2, f1, fb);
    end

    return
