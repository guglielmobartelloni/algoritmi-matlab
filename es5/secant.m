function [xi1, i] = secant(f, tol, x0,x1, imax)
    %
    %   [xi1, i] = secant(f, tol, x0,x1, imax)
    % Calcola la radice della funzione data in ingresso
    % attraverso il metodo di newton
    % Input:
    % f - funzione per cui calcolare la radice
    % tol - tolleranza
    % (x0,x1) - ascisse di partenza
    % imax - iterazioni massime da compiere
    %
    % Output:
    % xi1 - soluzione del problema
    % i - numero di iterazioni eseguite dalla function
    %
    if (tol < 0 || imax < 0)
        error("La tolleranza o il numero di iterazioni massime non possono essere negative");
    end
    xi=x0;
    xi1=x1;
    for i = 1:imax
        x = xi1;
        xi1 = (f(xi1) * xi - f(xi) * xi1) / (f(xi1) - f(xi));

        if abs(xi1 - xi) <= tol * (1 + abs(xi))
            break
        end

        xi = x;
    end
