function df=divdif(x,f)
n=length(x);
df=f;
n=n-1;
for j=1:n
    for i=n+1:-1:j+1
        df(i)=(df(i)-df(i-1))/(x(i)-x(i-j));
    end
end
return