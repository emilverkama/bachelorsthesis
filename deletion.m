%% Deletes the first edge in the edge list of a graph
%
% Input values:
%   E: graph edges (for example [1 2 ; 1 3 ; 2 4 ; 3 4])
%
% Return values:
%   Ed: graph edges after deletion
%
function Ed = deletion(E)
    Ed = E;
    Ed(1,:) = [];
end