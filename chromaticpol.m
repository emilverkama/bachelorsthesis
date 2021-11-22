%% Computes the chromatic polynomial of a graph
%
% Input values:
%   V: graph vertices (for example [1 2 3 4 5])
%   E: graph edges (for example [1 2 ; 1 3 ; 2 4 ; 3 4])
%   x: symbolic variable
%
% Return values:
%   p: chromatic polynomial as symbolic expression using x
%
function p = chromaticpol(V,E,x)
    if (isempty(E))
        % The base case of the recursion: no edges
        p = x^(length(V));
    else
        % Recursively calculating the chromatic polynomial using the
        % Deletion-Contraction Theorem
        Ed = deletion(E);
        [Vc,Ec] = contraction(V,E);
        p = chromaticpol(V,Ed,x) - chromaticpol(Vc,Ec,x);
    end
end