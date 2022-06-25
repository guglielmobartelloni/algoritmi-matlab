format long e;
A=rand([10 3]);
b=rand(10,1);
matrix2latex(A)
matrix2latex(b)
matlab=A\b;
matrix2latex(matlab)
[x,nr]=miaqr(A,b);
matrix2latex(x)

disp(max(abs(x-matlab)))