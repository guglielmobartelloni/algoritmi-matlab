A = [ 1 3 2; 3 5 4; 5 7 6; 3 6 4; 1 4 2 ]; 
b=[15 28 41 33 22]';
D = diag(1:5);

[x,nr]=miaqr(A,b);
[xd,nrd]=miaqr(D*A,D*b);
matrix2latex(x)
disp(nr)
matrix2latex(xd)
disp(nrd)
