a = 0;
b = 1;
f = @(x) x^3 - 4 .* x^2 + 1;
fa = feval(f, a);
fb = feval(f, b);
x = (a + b) / 2;
fx = feval(f, x);

while fx ~= 0

    if fa * fx < 0
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end

    x = (a + b) / 2;
    fx = feval(f, x);
end
