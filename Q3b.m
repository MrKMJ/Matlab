r = 3.65;          % Parameter value
x1_values = [0.4, 0.40001, 0.39999];  % Different initial values of x
numTimeSteps_20 = 20;  % Number of time steps for the first investigation
numTimeSteps_50 = 50;  % Number of time steps for the second investigation

% Initialize an array to store the results for different initial conditions
results_20 = zeros(length(x1_values), numTimeSteps_20);
results_50 = zeros(length(x1_values), numTimeSteps_50);

% Simulate for 20 time steps
for i = 1:length(x1_values)
    x1 = x1_values(i);
    results_20(i, :) = logisticMapInvestigation(r, x1, numTimeSteps_20);
end

% Simulate for 50 time steps
for i = 1:length(x1_values)
    x1 = x1_values(i);
    results_50(i, :) = logisticMapInvestigation(r, x1, numTimeSteps_50);
end

% Plot the results on the same graph
figure;
hold on;
for i = 1:length(x1_values)
    plot(1:numTimeSteps_20, results_20(i, :), 'b.-', 'DisplayName', ['x1 = ', num2str(x1_values(i))]);
end
for i = 1:length(x1_values)
    plot(1:numTimeSteps_50, results_50(i, :), 'r.-', 'DisplayName', ['x1 = ', num2str(x1_values(i))]);
end
xlabel('Time Steps (k)');
ylabel('x_k');
title(['Logistic Map with r = ', num2str(r)]);
legend('Location', 'best');
grid on;
hold off;
