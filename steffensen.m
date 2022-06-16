function [xi1, i] = steffensen(f, tol, xi, imax)
    %
    %   [x,i]=steffensen(f,tol,a,b)
    % Calcola la radice della funzione data in ingresso
    % attraverso il metodo di Steffensen
    % Input:
    % f: funzione per cui calcolare la radice
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

    for i = 1:imax
        xi1 = xi - (f(xi)^2 / (f(xi + f(xi)) - f(xi)));
        sprintf("i:%d xi1: %d",i,xi1)
        if abs(xi1 - xi) <= tol * (1 + abs(xi))
            break
        end

        xi = xi1;
    end
