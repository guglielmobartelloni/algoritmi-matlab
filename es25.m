for n=1:9
    if n == 8
        continue
    end
    Id=(1/3)*(exp(3)-1);
    f = ;
    a=0;@(x) exp(3*x)
    b=1;
    h = (b-a)/n;
    x=a+(0:n)*h;
    y = feval(f,x);
    cin = pesiQuadraturaCotes(n);
    I=0;
    for i=1:n+1
        I=I+cin(i)*y(i);
    end
    I=I*h;
    errore= I - Id;
    disp(errore)
end
