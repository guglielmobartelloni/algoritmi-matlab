for i=2:6
f = @(x) sin(1/(0.01+x));
[I2,nfeval]=adapsim(f,0,1,10^(-i));
disp(nfeval)
end