a = 0;
b = 1;
f = @(x) x^3 - 4 .* x^2 + 1;
tolx = 0.1;
fa = feval(f, a);
fb = feval(f, b);
x = (a + b) / 2;
fx = feval(f, x);
imax = ceil(log2(b - a) - log2(tolx));

for i = 2:imax
    f1x = abs((fb - fa) / (b - a));

    if abs(fx) <= tolx * f1x
        break
    elseif fa * fx < 0
        b = x;
        fb = fx;
    else
        a = x;
        fa = fx;
    end

    x = (a + b) / 2;
    fx = feval(f, x);
end
