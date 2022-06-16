function [xi1, i] = secant(f, df, tol, xi, imax)
    %
    %   [x,i]=secant(f,tol,a,b)
    % Calcola la radice della funzione data in ingresso
    % attraverso il metodo di newton
    % Input:
    % f: funzione per cui calcolare la radice
    % df: derivata della funzione funzione
    % tol: tolleranza
    % xi: ascissa di partenza
    % imax: iterazioni massime da compiere
    %
    % Output:
    % xi1: soluzione del problema
    % i: numero di iterazioni eseguite dalla function
    %
    if (tol < 0 || imax < 0)
        error("La tolleranza o il numero di iterazioni massime non possono essere negative");
    end

    xi1 = xi - f(xi) / df(xi);

    for i = 1:imax
        x = xi1;
        xi1 = (f(xi1) * xi - f(xi) * xi1) / (f(xi1) - f(xi));

        if abs(xi1 - xi) <= tol * (1 + abs(xi))
            break
        end

        xi = x;
    end
