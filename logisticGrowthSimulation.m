
function logisticGrowthSimulation(r, x0, numTimeSteps)
    % r: Parameter value
    % x0: Initial value of x at k = 1
    % numTimeSteps: Number of time steps to simulate the model
    
    % Initialize an array to store the values of x for each time step
    x = zeros(1, numTimeSteps);
    x(1) = x0; % Set the initial value of x
    
    % Iterate through the logistic map equation to calculate x for each time step
    for k = 1:numTimeSteps-1
        x(k+1) = r * x(k) * (1 - x(k));
    end
    
    % Plot the results
    figure;
    plot(1:numTimeSteps, x, 'b.-');
    xlabel('Time Steps (k)');
    ylabel('x_k');
    title(['Logistic Growth Model with r = ', num2str(r)]);
    grid on;
    
    % Display the final value
    finalValue = x(numTimeSteps);
    disp(['Final value after ', num2str(numTimeSteps), ' time steps: ', num2str(finalValue)]);
end
