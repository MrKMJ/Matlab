% Define the function dx/dt = 4x - x^3 + c
dxdt = @(x, c) 4*x - x.^3 + c;

% Values of c for the bifurcation diagram
c_values = linspace(0, 4, 1000);

% Arrays to store equilibrium points and their stability
equilibrium_points = cell(1, length(c_values));
stability = cell(1, length(c_values));

% Find equilibrium points and determine stability for each c
for i = 1:length(c_values)
    c = c_values(i);
    % Use fsolve to find equilibrium points with better initial guesses
    initial_guesses = [-2; 0; 2];
    eq_points = fsolve(@(x) dxdt(x, c), initial_guesses);
    
    % Filter real equilibrium points
    real_eq_points = eq_points(imag(eq_points) == 0);
    equilibrium_points{i} = real_eq_points;
    
    % Determine stability of equilibrium points
    stability{i} = 4 - 3*real_eq_points.^2;
end

% Plot the bifurcation diagram
figure;
hold on;
for i = 1:length(c_values)
    c = c_values(i);
    eq_points = equilibrium_points{i};
    stab = stability{i};
    for j = 1:length(eq_points)
        x = eq_points(j);
        s = stab(j);
        
        % Plot stable equilibrium points with a solid line
        if s > 0
            plot(c, x, 'bo', 'MarkerFaceColor', 'b');
            plot(c, x, 'b-', 'LineWidth', 1.5);
        % Plot unstable equilibrium points with a dashed line
        elseif s < 0
            plot(c, x, 'ro', 'MarkerFaceColor', 'r');
            plot(c, x, 'r--', 'LineWidth', 1.5);
        end
    end
end

xlabel('c');
ylabel('Equilibrium Points (x_{eq})');
title('Bifurcation Diagram');
grid on;
hold off;
