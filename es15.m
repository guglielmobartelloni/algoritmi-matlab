% fun=@(x,y)[(x^2+1)*(y-2); exp(x-1)+exp(y-2)-2];
jacobian=@(x)[2*x(1)*(x(2)-2) (x(1)^2+1);exp(x(1)-1) exp(x(2)-2)];
fun = {@(x,y) (x^2+1)*(y-2);
     @(x,y) exp(x-1)+exp(y-2)-2};



[x,nit]=newtonNonLinear(fun,jacobian,zeros(size(fun)),1e-3,1000);
disp(x)