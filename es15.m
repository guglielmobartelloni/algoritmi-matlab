% fun=@(x,y)[(x^2+1)*(y-2); exp(x-1)+exp(y-2)-2];
format long e;
fun2=@(x)[x(1)-(x(2)*x(3));exp(x(1)+x(2)+x(3)-3)-x(2);x(1)+x(2)+2*x(3)-4];
Df2=@(x)[1 -x(3) -x(2);exp(x(1)+x(2)+x(3)-3) exp(x(1)+x(2)+x(3)-3)-1 exp(x(1)+x(2)+x(3)-3);1 1 2];

[x,nit]=newtonNonLinear(fun2,Df2,[0 0 0]',1e-8,200);
matrix2latex(x)
disp(nit)
[x,nit]=bellezza(fun2,Df2,[0 0 0]',1e-8,200);
disp(x)
disp(nit)