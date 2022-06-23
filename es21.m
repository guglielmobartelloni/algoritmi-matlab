f = @(x) (1./(2*(2*(x.^2)-2*x+1)));
f1 = @(x) (   (1-2.*x) / (( 2.*(x.^2) - 2.*x + 1 ).^2)  );
n = 41;
x= Chebyshev(n,-2,3);
xq = Chebyshev(10001,-2,3);
esatto = feval( f, xq );
y0 = spline0(x, feval(f,x) , xq );
ySpline = spline(x, feval(f,x) , xq );

disp(max(abs(esatto - y0))); 
disp(max(abs(esatto - ySpline)))
% ySpline = max(abs(esatto - ySpline));
% disp(ySpline)

plot(xq,y0, 'r',xq,esatto,'b',xq,ySpline,'g')