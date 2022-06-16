function yq = splineBanana(x, y, xq)
    % yq = sline0(x, y, xq)
    % La funzione calcola la spline cubica naturale interpolante e
    % restituisce il valore assunto dalla spline sulle ascisse xq
    %
    % input:
    % - x vettore delle ascisse di interpolazione, deve essere in ordine
    % crescente
    % - y vettore dei valori della funzione assunti sulle ascisse
    % interpolanti
    % - xq vettore delle ascisse dove si calcola il valore della spline
    %
    % output:
    % - yq vettore delle ordinate calcolate sulle ascisse non interpolanti
    if length(x) ~= length(y)
        error('La lunghezza dei vettori x e y non sono concordi');
    end

    n = length(x) - 1;
    yq = zeros(length(xq), 1);
    f = y;
    h = zeros(n, 1);
    h(1:n) = x(2:n + 1) - x(1:n);
    m = zeros(n + 1, 1);
    phi = zeros(n - 2, 1);
    phi(1:end) = h(2:n - 1) ./ (h(2:n - 1) + h(3:n));
    psi = zeros(n - 2, 1);
    psi(1:end) = h(2:n - 1) ./ (h(1:n - 2) + h(2:n - 1));
    d = 2 * ones(n - 1, 1);

    for i = 1:n - 2
        phi(i) = phi(i) / d(i);
        d(i + 1) = 2 - phi(i) * psi(i);
    end

    for j = 1:2

        for i = n + 1:-1:j + 1
            y(i) = (y(i) - y(i - 1)) / (x(i) - x(i - j));
        end

    end

    m(2:n) = 6 * y(3:n + 1);

    for i = 3:n
        m(i) = m(i) - phi(i - 2) * m(i - 1);
    end

    m(n) = m(n) / d(n - 1);

    for i = n - 1:-1:2
        m(i) = (m(i) - psi(i - 1) * m(i + 1)) / d(i - 1);
    end

    j = 1;

    for i = 2:n + 1
        j = 1;

        for i = 2:n + 1

            if xq(j) <= x(i)
                ri = f(i - 1) - (h(i - 1)^2/6) * m(i - 1);
                qi = ((f(i) - f(i - 1)) / h(i - 1)) - ...
                    ((h(i - 1) / 6) * (m(i) - m(i - 1)));
                fun = @(k) ((((k - x(i - 1))^3) * m(i) + ((x(i) - k)^3) * m(i - 1)) / ...
                    (6 * h(i - 1))) + qi * (k - x(i - 1)) + ri;

                while j <= length(xq) && xq(j) <= x(i)
                    yq(j) = feval(fun, xq(j));
                    j = j + 1;
                end

            end

        end

        yq = yq(:);
    end
