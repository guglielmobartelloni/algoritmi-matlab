function YQ = spline0(X, Y, XQ)
    %
    %   y=spline0(X,Y,XQ)
    %   Calcolo del polinomio interpolante con l'uso delle spline cubiche
    %   naturali
    %   Input:
    %   (X,Y): dati del problema
    %   XQ: vettore in cui calcolare il polinomio
    %
    if length(X) ~= length(Y)
        error('Errore nei dati del problema');
    end

    if length(X) ~= length(unique(X))
        error('Le ascisse devono essere distinte')
    end

    n = length(X) - 1;
    hi(1:n) = X(2:n + 1) - X(1:n);
    phi = hi(2:n - 1) ./ (hi(2:n - 1) + hi(3:n));
    csi = hi(2:n - 1) ./ (hi(1:n - 2) + hi(2:n - 1));
    df = divdif(X, Y);

    m = tridia(ones(1, n - 1) .* 2, csi, phi, 6 .* df);
    mi = [0 m 0];

    %for i=2:n-1
    %   ri(i-1)=Y(i-1)-(((hi(i).^2)./6).*(mi(i-1)));
    %  qi(i-1)=((Y(i)-Y(i-1))./(hi(i))) ...
    %  -(((hi(i))./6).*(mi(i)-mi(i-1)));
    %end
    for i = 2:n + 1
        j = 1;

        for i = 2:n + 1

            if XQ(j) <= X(i)
                ri = Y(i - 1) - (hi(i - 1)^2/6) * mi(i - 1);
                qi = ((Y(i) - Y(i - 1)) / hi(i - 1)) - ...
                    ((hi(i - 1) / 6) * (mi(i) - mi(i - 1)));
                y = @(x) ((((x - X(i - 1))^3) * mi(i) + ((X(i) - x)^3) * mi(i - 1)) / ...
                    (6 * hi(i - 1))) + qi * (x - X(i - 1)) + ri;

                while j <= length(XQ) && XQ(j) <= X(i)
                    YQ(j) = feval(y, XQ(j));
                    j = j + 1;
                end

            end

        end

        YQ = YQ(:);
    end

end

function ddf = divdif(x, f)
    n = length(x);
    df = f;
    n = n - 1;

    for j = 1:2

        for i = n + 1:-1:j + 1
            df(i) = (df(i) - df(i - 1)) / (x(i) - x(i - j));
        end

    end

    ddf = df(1, 3:n + 1);
    return
end

function x = tridia(a, b, c, g)
    %
    %  risolve il sistema tridiagonale
    %
    %      b(i)*x(i-1) + a(i)*x(i) + c(i)*x(i+1) = d(i),   i = 1...n
    %
    %      con x(0)=x(n+1)=0.
    %
    n = length(g);
    x = g;
    eta = c;
    d = a;
    %Fattorizzazione
    for i = 1:n - 1
        eta(i) = c(i) / d(i);
        d(i + 1) = d(i + 1) - eta(i) + b(i);
    end

    %Risoluzione di L
    for i = 1:n - 1
        x(i + 1) = x(i + 1) - eta(i) * x(i);
    end

    %Risoluzione di U
    x(n) = x(n) / d(n);

    for i = n - 1:-1:1
        x(i) = x(i) - b(i) * x(i + 1);
    end

    return
end
