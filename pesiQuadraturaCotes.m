function c=pesiQuadraturaCotes(n)
%
%   c=pesiQuadraturaCotes(n)
%   Calcola i pesi della formula di Newton Cotes di grado n
%   Input:
%       n: grado della formula
%   Output:
%       c: pesi calcolati
%
c=(1:n+1);
for i=0:n
    den=prod(i-[0:i-1 i+1:n]); % calcolo il denominatore
    %calcolo il numeratore
    a=poly([0:i-1 i+1:n]);
    a=[a./((n+1):-1:1) 0];
    num=polyval(a,n);
    
    % Calcolo finale
    c(i+1)=num/den;
end