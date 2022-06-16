function y = Lagrange(X, Y, XQ)
    %
    %   y = Lagrange(X,Y,XQ);
    %   Calcolo del polinomio interpolante nella forma di Lagrange delle coppie
    %   (X,Y), nei punti del vettore XQ
    %   Input:
    %   (X,Y): dati del problema
    %   XQ: vettore in cui calcolare il polinomio
    %
    if length(X) ~= length(Y)
        error('Errere nei dati del problema');
    end

    if length(X) ~= length(unique(X))
        error('Le ascisse devono essere distinte')
    end

    n = length(X);
    y = zeros(size(XQ));

    for i = 1:n
        y = y + Y(i) * Lin(XQ, X, i);
    end

    return
end

function L = Lin(XQ, X, i)
    L = ones(size(XQ));
    n = length(X) - 1;
    Xi = X(i);
    X = X([1:i - 1, i + 1:n + 1]);

    for k = 1:n
        L = L .* (XQ - X(k)) / (Xi - X(k));
    end

    return
end
