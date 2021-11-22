%% Finds all cycles in a graph
% 
% Uses the integrated allcycles function.
%
% Input values:
%   V: graph vertices (for example [1 2 3 4 5])
%   E: graph edges (for example [1 2 ; 1 3 ; 2 4 ; 3 4])
%
% Return values:
%   C: cell array containing all cycles (for example {[1 2 3]})
%
function C = graphcycles(V,E)
    % Initializing graph
    G = graph();
    G = addnode(G, length(V));
    % Adding all edges
    for i = 1:height(E)
        G = addedge(G,E(i,1),E(i,2));
    end 
    % Finding cycles
    C = allcycles(G);
end