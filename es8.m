a = [4 12 -16; 12 37 -43; -16 -43 98];
matrix2latex(a);
b= [1 2 3]';
matrix2latex(b);
[A,x] = mialdl(a,b);
matrix2latex(A);
matrix2latex(x);
matrix2latex(linsolve(a,b));
disp(linsolve(a,b))