xq = linspace(0,1,10001);
funzione1 = @(x) sin(2*pi*x);
funzione2 = @(x) cos(2*pi*x);
for n=5:5:50
x=linspace(0,1,n+1);
yspline0=spline0(x,feval(funzione2,x),xq);
% yspline0=splineFragola(x,feval(funzione1,x),xq)';
% yspline0=splineBanana(x,feval(funzione1,x),xq)';

yspline=spline(x,feval(funzione2,x),xq);
% spline0(x,feval(funzione2,x),xq);
% disp(splineBanana(x,feval(funzione2,x),xq)');
% disp(yspline0)

errorSpline=max(abs(yspline-feval(funzione2,xq)));
errorSpline0=max(abs(yspline0-feval(funzione2,xq)));
%  disp(errorSpline0)
disp(errorSpline)
plot(xq,yspline0,'g',xq,yspline,'b',xq,feval(funzione2,xq),'r')

end