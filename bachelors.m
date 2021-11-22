%% Computes useful information of user input graph
%
% * Calculates the chromatic polynomial and chromatic number
% * Plots the chromatic polynomial and display it along with the chromatic number
% * Displays all induced 3k-cycles
%

clear all
close all
    
% Preparing nicer formatting
set(groot,'defaulttextinterpreter','latex')
set(groot,'defaultAxesTickLabelInterpreter','latex')
set(groot,'defaultLegendInterpreter','latex')

% Draw your own graph
[V,E] = drawgraph;

% Calculating and displaying induced 3k-cycles
C = cycles3k(V,E);
disp('Induced 3k-cycles:')
if (isempty(C))
    disp('None')
else 
    disp(C)
end

% Initializing symbolic variable x and chromatic polynomial p(x)
syms x p(x)

% Calculating chromatic polynomial
p(x) = chromaticpol(V,E,x);

% Calculating chromatic number
k = chromaticnum(p);

% String representation
ps = char(p);
ps = ps(ps ~= '*');

% Plotting
x_int = 0:k;
x_cont = linspace(x_int(1), x_int(end), 500);
figure
hold on
plot(x_cont, p(x_cont), 'k', x_int, p(x_int), '.k', 'markersize', 15)
title(join(['$ P(G,x)=' ps '$, \hspace{3mm} $\chi(G)=' num2str(k) '$']))
grid on