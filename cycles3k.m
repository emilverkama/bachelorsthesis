%% Finds all incuded cycles of length 3k in a graph
%
% Input values:
%   V: graph vertices (for example [1 2 3 4 5])
%   E: graph edges (for example [1 2 ; 1 3 ; 2 4 ; 3 4])
%
% Return values:
%   D: cell array containing all induced cycles of length 3k (for example {[1 2 3]})
%
function D = cycles3k(V,E)    
    % Finding all cycles
    C = graphcycles(V,E);
    D = cell(length(C),1);
    
    % Iterating over the array of cycles
    for i = 1:length(C)
        c = C{i};
        % Checking if length is divisible by 3
        if (rem(length(c),3) == 0)
            % Adding the cycle to the return array for the time being
            D{i} = c;
            % Iterating over all edges
            for j = 1:height(E)
                e = E(j,:);
                x = find(c == e(1));
                y = find(c == e(2));
                % Checking if the cycle is induced
                if (isempty(x) || isempty(y) || x == y + 1 || y == x + 1 || (x == 1 && y == length(c)) || (y == 1 && x == length(c)))
                    % Do nothing
                else 
                    % The cycle contains a chord, remove it
                    D{i} = [];
                end     
            end
        end
    end
    % Filtering out empty array values
    D = D(~cellfun('isempty',D));
end