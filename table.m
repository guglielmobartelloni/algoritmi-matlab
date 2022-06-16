f = @(x) (1 / (2 * (2 * x^2 - 2 * x + 1)));
f1 = @(x)
lagrange = Lagrange(X, Y, XQ);

newton = NewtonInt(X, Y, XQ);
hermite = Hermite(X, Y, Y1, XQ);
spline = 0;
