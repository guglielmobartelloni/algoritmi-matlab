
% [A,b]=linsis(10,1,1);
% matrix2latex(A);
% [S,x]=mialdl(A,b);
% % disp(cond(A))
% matrix2latex(x)
% disp(A\b)

[A,b]=linsis(10,10,1);
% matrix2latex(A);
% [S,x]=mialdl(A,b);
disp(cond(A))
% disp(x)
[L,U]=lu(A);
disp(diag(U))
matrix2latex(diag(U))
