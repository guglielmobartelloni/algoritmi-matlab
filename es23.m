    errori=(1:15);
    n=1e4;
    x=(0:n)/n;
    f=sin(pi*x.^2);
    fperturbata = f + (1e-1)*rand(size(x));
    
    for m=1:15
        [p,S]=polyfit(x,fperturbata,m);
        disp(S)
        px=polyval(p,x);
        errori(m)=max(abs(f-px));
    end
    semilogy(1:15,errori,'b--o')
