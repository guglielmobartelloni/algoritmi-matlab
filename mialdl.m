function x = mialdl(A, b)
    %
    %   x=miadl(A,b)
    % Calcola soluzione del sistema lieare Ax=b attraverso la fattorizzazione LDL^T
    % Input:
    % A: Matrice
    % b: vettore dei termini noti
    %
    % Output:
    % x: soluzione del problema
    %

    % Calcolo della fattorizzazione LDL^T nella matrice A
    n = length(A);
    if prod(diag(A)) <= 0, error('la matrice non e'' sdp'), end
    A(2:n, 1) = A(2:n, 1) / A(1, 1);

    for j = 2:n
        v = (A(j, 1:j - 1).') .* diag(A(1:j - 1, 1:j - 1));
        A(j, j) = A(j, j) - A(j, 1:j - 1) * v;
        if A(j, j) <= 0, error('La matrice non e'' sdp'), end
        A(j + 1:n, j) = (A(j + 1:n, j) - A(j + 1:n, 1:j - 1) * v) / A(j, j);
    end

    disp(A)

    % Calcolo della soluzione del sistema lineare
    controllo = length(b) == size(A, 1) && size(A, 1) == size(A, 2);

    if diag(A) <= 0
        error('La diagonale deve essere positiva');
    end

    if ~controllo
        error('Le dimensioni degli elementi devono essere corrette');
    end

    n = length(b);
    x = b(:);

    for i = 2:n
        x(i:n) = x(i:n) - A(i:n, i - 1) * x(i - 1);
    end

    x = x ./ diag(A);

    for i = n:-1:2
        x(1:i - 1) = x(1:i - 1) - A(i, 1:i - 1)' * x(i);
    end

    return
