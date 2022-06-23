
[A,b]=linsis(10,1);
matrix2latex(A);
[S,x]=mialu(A,b);
disp(cond(A))
disp(x)
disp(A\b)

[A,b]=linsis(10,10);
matrix2latex(A);
[S,x]=mialu(A,b);
disp(cond(A))
disp(x)
disp(A\b)
