maximi=(1:15);
n=1e4;
x=(0:n)/n;
y = sin(pi*x.^2) + (1e-1)*rand(size(x));
f=sin(pi*x.^2);

for m=1:15
    p=polyfit(x,y,m);
    px=polyval(p,x);
    maximi(m)=max(abs(f-px));
    
    % plot(x,abs(f-px),'r',x,px,'g',x,f,'b')
end
semilogy(1:15,maximi)
