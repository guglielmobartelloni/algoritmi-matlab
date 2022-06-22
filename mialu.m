function [A,x] = mialu(A, b)
    %
    %   x=mialu(A,b)
    % Calcola soluzione del sistema lieare Ax=b attraverso la fattorizzazione
    % LU con pivoting parziale
    % Input:
    % A: Matrice
    % b: vettore dei termini noti
    %
    % Output:
    % x: soluzione del problema
    %

    % Calcolo della fattorizzazione LU nella matrice A
    [m, n] = size(A);

    if m ~=n
        error('La matrice non è quadrata')
    end

    p = (1:n);

    for i = 1:n
        [mi, ind] = max(abs(A(i:n, i)));

        if mi == 0
            error('Matrice singolare');
        end

        if ind > 1
            ii = i + ind - 1;
            A([i, ii], :) = A([ii, i], :);
            p([i, ii]) = p([ii, i]);
        end

        A(i + 1:n, i) = A(i + 1:n, i) / A(i, i);
        A(i + 1:n, i + 1:n) = A(i + 1:n, i + 1:n) - A(i + 1:n, i) * A(i, i + 1:n);
    end
	% Risoluzione del sistema
    b=b(p);
    n = length(b);
    x = b(:);

    for i = 2:n
        x(i:n) = x(i:n)-A(i:n,i-1)*x(i-1);
    end
    for i=n:-1:1
        x(i) = x(i)/A(i,i);
        x(1:i-1) = x(1:i-1)-A(1:i-1,i)*x(i);
    end
    return