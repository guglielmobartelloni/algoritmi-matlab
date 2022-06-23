function y=radice(x)
% root=radice(x); Calcolo della radice di un numero 
%
% INPUT:
%   x: numero non negativo
% OUTPUT:
%   y: radice di x
if x<0; error('Il numero non puo essere negativo'); end

root = 1;
while 1
    y = .5*(root + x/root);
    if abs(root-y) <= eps
        return
    end
    root=y;
end


