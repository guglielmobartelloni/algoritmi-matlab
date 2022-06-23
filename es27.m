fun = @(x) sin(1./(.1+x));

tol= 1e-6;
for n = 1:9
    [If,err,nfeval]=composita(fun,0,1,n,tol);
%     disp(If)
    disp(nfeval)
end