%% Computes the chromatic number of a graph
%
% Input values:
%   p: chromatic polynomial as function or symbolic expression
%
% Return values:
%   k: chromatic number
%
function k = chromaticnum(p)
    % Initializing chromatic number
    k = 1;
    % Finding the smallest integer k for which p(k) > 0 (the chromatic number)
    while true
        if (p(k) > 0)
            break
        end
        k = k + 1;
    end
end