x=logspace(-10,10,20);

for i=1:20
    n1= sqrt(x(i));
    n2 = -radice(x(i));
    cond=(abs(n1)+abs(n1))/abs(n1+n2);
    disp(cond)
end