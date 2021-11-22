%% Contracts the first edge in the edge list of a graph
%
% Input values:
%   V: graph vertices (for example [1 2 3 4 5])
%   E: graph edges (for example [1 2 ; 1 3 ; 2 4 ; 3 4])
%
% Return values:
%   Vc: graph vertices after contraction
%   Ec: graph edges after contraction
%
function [Vc,Ec] = contraction(V,E)   
    % Getting edge e = uv
    e = E(1,:);
    % Deleting v from V
    Vc = V(V ~= e(2));    
    % Initializing contracted edge set
    Ec = E;
    
    % Iterating over contracted edge set
    i = 1;
    [m,~] = size(Ec);  
    while (i <= m)
        % Replacing all mentions of v in E with u
        if (Ec(i,1) == e(2))
            Ec(i,1) = e(1);
        elseif (Ec(i,2) == e(2))
            Ec(i,2) = e(1);
        end
        % Removing self loops and sorting all pairs in ascending order
        if (Ec(i,1) == Ec(i,2))
            Ec(i,:) = [];
            i = i - 1;
            m = m - 1;
        elseif (Ec(i,1) > Ec(i,2))
            Ec(i,:) = [Ec(i,2) Ec(i,1)];
        end 
        i = i + 1;
    end
    
    % Removing duplicates
    Ec = unique(Ec, 'rows');
end