xq = linspace(0,1,10001);
funzione1 = @(x) sin(2*pi*x);
funzione2 = @(x) cos(2*pi*x);
x=linspace(0,1,6);
yspline0=spline0(x,feval(funzione1,x),xq)';
yspline=spline(x,feval(funzione1,x),xq);

errorSpline=max(abs(yspline-feval(funzione1,xq)));
errorSpline0=max(abs(yspline0-feval(funzione1,xq)));
disp(errorSpline)
% plot(xq,yspline0,'g',xq,yspline,'b',xq,feval(funzione1,xq),'r')
