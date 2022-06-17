function c=pesiQuadraturaCotes(n)
%
%   c=pesiQuadraturaCotes(n)
%   Calcola i pesi della formula di Newton Cotes di grado n
%   Input:
%       n: grado della formula
%   Output:
%       c: pesi calcolati
%
if n<=0
    error('n deve essere maggiore di zero');
end
c=(1:n+1);
for i=0:n
    den=prod(i-[0:i-1 i+1:n]); % calcolo il denominatore
    %calcolo il numeratore
    a=poly([0:i-1 i+1:n]);
    a=[a./((n+1):-1:1) 0];
    num=polyval(a,n);
    
    c(i+1)=num/den;
end