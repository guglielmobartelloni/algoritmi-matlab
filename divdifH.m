function Y = divdifH(X, Y)
    n = length(X);

    for i = (2 * n - 1):-2:3
        Y(i) = (Y(i) - Y(i - 2)) / (X((i + 1) / 2) - X((i - 1) / 2));
    end

    for j = 2:2 * n - 1

        for i = (2 * n):-1:j + 1
            Y(i) = (Y(i) - Y(i - 1)) / (X(ceil(i / 2)) - X(ceil((i - j) / 2)));
        end

    end

end
