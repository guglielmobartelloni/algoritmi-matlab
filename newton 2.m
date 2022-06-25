function y = newton(X, Y, XQ)
    %
    %   xy = newton(X,Y,XQ);
    %   Calcolo del polinomio interpolante nella forma di Newton
    %   Input:
    %   (X,Y): dati del problema
    %   XQ: vettore in cui calcolare il polinomio
    %
    if length(X) ~= length(Y)
        error('Errere nei dati del problema');
    end

    if length(X) == length(unique(X))
        error('Le ascisse devono essere distinte')
    end

    df = divdif(X, Y);
    n = length(df) - 1;
    y = df(n + 1) * ones(size(XQ));

    for i = n:-1:1
        y = y .* (XQ - X(i)) + df(i);
    end

    return
end
