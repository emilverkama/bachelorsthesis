%% Draws graph based on graphical user input
%
% Highlights all vertices in an induced 3k-cycle in red
%
% 1. Add a vertex by clicking once on the desired spot
% 2. Press enter when all vertices have been added
% 3. Add an edge by clicking once on each end point
% 4. Press enter when all edges have been added
% 
% Return values: 
%   V: graph vertices (for example [1 2 3 4 5])
%   E: graph edges (for example [1 2 ; 1 3 ; 2 4 ; 3 4])
%
function [V,E] = drawgraph()
    % Initializing figure
    figure
    hold on
    xticks([])
    yticks([])
    axis([0 1 0 1])
    
    % Vertex input:
    title('Input vertices') 
    i = 1;
    while true
        % Taking one coordinate point
        in = ginput(1);
        if (isempty(in))
            % Enter pressed, exit loop
            break
        else
            % Adding coordinate to x- and y-vectors
            xv(i) = in(1);
            yv(i) = in(2);
            % Plotting point
            text(xv(i), yv(i), num2str(i), 'HorizontalAlignment', 'center', 'Color', 'w')
            plot(xv(i), yv(i), '.k', 'markersize', 40)
        end
        i = i + 1;
    end
    xv = xv';
    yv = yv';
    
    % Creating vertex vector
    V = 1:(i - 1);
    
    % Edge input:
    title('Input edges')
    i = 1;
    E = [];
    while true
        % Taking two coordinate points
        in = ginput(2);
        if (isempty(in))
            % Enter pressed, exit loop
            break
        else
            % Finding the vertices closest to the coordinates
            u = dsearchn([xv yv],in(1,:));
            v = dsearchn([xv yv],in(2,:));
            % Adding edge to the edge matrix
            E(i,:) = [u v];
            % Plotting edge
            x = [xv(u) xv(v)];
            y = [yv(u) yv(v)];
            plot(x, y, 'k', 'linewidth', 0.8)
        end
        i = i + 1;
    end
    
    set(gca,'children',flipud(get(gca,'children')))
    title('$G$')
end