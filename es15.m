fun=[@(x,y) (x.^2+1).*(y-2), @(x,y) exp(x-1)+exp(y-2)-2];
jacobian = [@(x,y) 2*x.*(y-2), @(x) x.^2+1; @(x) exp(x-1), @(y) exp(y-2)];


[x,nit]=newtonNonLinear(fun,jacobian,ones(size(fun)),1e-3,1000);
disp(x)