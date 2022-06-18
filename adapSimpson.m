function [I2,nfeval] = adapsim(f, a, b, tol, fa, f1, fb)
    %
    %Utilizzo: I2 = adapSimpson(f, a, b, tol)
    %
    %Input:
    %   f - function funzione integranda;
    % a,b - estremi intervallo di integrazione;
    % tol - accuratezza richiesta.
    %
    % Output:
    %  I2 - approssimazione ottenuta.
    %
    nfeval=0;
    x1 = (a + b) / 2;

    if nargin <= 4
        fa = feval(f, a);
        fb = feval(f, b);
        f1 = feval(f, x1);
        nfeval=nfeval+3;
    end

    h = (b - a) / 6;
    x2 = (a + x1) / 2;
    x3 = (x1 + b) / 2;
    f2 = feval(f, x2);
    f3 = feval(f, x3);
    I1 = h * (fa + 4 * f1 + fb);
    I2 = .5 * h * (fa + 4 * f2 + 2 * f1 + 4 * f3 + fb);
    e = abs(I2 - I1) / 15;
    nfeval=nfeval+2;
    if e > tol
        [I2a,nfevala] = adapsim(f, a, x1, tol / 2, fa, f2, f1);
        [I2b,nfevalb] = adapsim(f, x1, b, tol / 2, f1, f3, fb);
        I2=I2a+I2b;
        nfeval=nfeval+nfevala+nfevalb;
    end

    return
