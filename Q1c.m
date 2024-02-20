function bifurcationDiagram()
    % Parameters
    numTimeSteps = 500;   % Total number of time steps for each r
    numIterations = 100;  % Number of iterations to store for the bifurcation diagram
    r_values = 2.4:0.01:4; % Range of 'r' values from 2.4 to 4 in increments of 0.01
    
    % Initialize a matrix to store the values of x for each 'r'
    x_values = zeros(numIterations, length(r_values));
    
    % Iterate through each 'r' value and simulate the logistic growth model
    for i = 1:length(r_values)
        r = r_values(i);
        x = logisticGrowthSimulation(r, 0.4, numTimeSteps);
        
        % Store the last 100 values of 'x'
        x_values(:, i) = x(end-99:end);
    end
    
    % Plot the bifurcation diagram
    figure;
    plot(r_values, x_values, '.', 'MarkerSize', 1);
    xlabel('r');
    ylabel('x (last 100 points)');
    title('Bifurcation Diagram for Logistic Growth Model');
    grid on;
end

