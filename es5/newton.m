function [xi1, i] = newton(f, df, tol, xi, imax)
    %
    %   x=newton(f,tol,a,b)
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

    if (feval(df, xi) == 0)
        error("La derivata prima della funzione non puo essere zero in xi")
    end

    for i = 1:imax
        xi1 = xi - (feval(f, xi) / feval(df, xi));

        if abs(xi1 - xi) <= tol * (1 + abs(xi))
            break
        end

        xi = xi1;
    end
