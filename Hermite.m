function y = Hermite(X, Y, Y1, XQ)
    %
    %   y = newton(X,Y,XQ);
    %   Calcolo del polinomio interpolante nella forma di Newton
    %   Input:
    %   (X,Y): dati del problema
    %   XQ: vettore in cui calcolare il polinomio
    %
    %if length(X)~= length(Y)
    %   error('Errore nei dati del problema');
    %end
    if length(X) ~= length(unique(X))
        error('Le ascisse devono essere distinte')
    end
    
    df = divdifH(X, Y);
    n = length(df) - 1;
    y = df(n + 1) * ones(size(XQ));

    for i = n:-1:1
        y = y .* (XQ - X(ceil(i / 2))) + df(i);
    end

    return
end
