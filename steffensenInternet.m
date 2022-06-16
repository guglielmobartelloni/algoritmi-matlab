% Change function g for a new problem
g = @(x) (x - cos(pi / 2 * x))^3;
% --------------initialize the problem-------------------
% initial guess
p0 = 1;
% tolerance
TOL = 1e-9;
% maximum number of [Outer] iterations
NI = 100;
% -------------------------------------------------------
% --------------output on screen -------------------
fprintf('\n Steffensen"s Method')
fprintf('\n\n I P\n')
% STEP 1
i = 1;
converge = false; % convergence flag
% STEP 2
while i <= NI
    % STEP 3.1: Apply two step fixed-pt iter to get p1, p2
    p1 = g(p0);
    p2 = g(p1);
    % STEP 3.2: update p0 by Aitken's Delta2 method
    p = p0 - (p1 - p0)^2 / (p2 - 2 * p1 + p0);
    err = abs(p0 - p) <= TOL * (1 + abs(p)); % err = |p0{N}-p0{N-1}|
    % print out all intermediate approximations
    fprintf('%3i %.9f\n', i, p)
    % STEP 4
    % check if meets the stopping criteria
    if (err < TOL)
        converge = true;
        break
    else
        % STEP 5
        i = i + 1;
        % STEP 6
        p0 = p; % update p0
    end

end

if converge
    fprintf('\n\nApproximate solution P = %.8f\n', p)
    fprintf('Number of iterations = %3i\n', i)
    fprintf('Tolerance = %.3e |p-pold| = %.3e\n', TOL, err)
else
    fprintf('\n\nInteration number = %3i\n', NI)
    fprintf(' gave approximation %.8f\n', p)
    fprintf('|p-pold| = %.3e not within tolerance %.3e\n', err, TOL)
end
