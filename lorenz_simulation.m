function lorenz_simulation(sigma, r, b, x0, y0, z0, tspan)
    % Lorenz system simulation using fourth-order Runge-Kutta method

    % Define the Lorenz system differential equations
    f = @(t, X) [-sigma * X(1) + sigma * X(2);
                 r * X(1) - X(2) - X(1) * X(3);
                 -b * X(3) + X(1) * X(2)];

    % Initial conditions
    X0 = [x0; y0; z0];

    % Numerical integration using fourth-order Runge-Kutta method
    [t, X] = ode45(f, tspan, X0);

    % Extracting individual components from the state matrix X
    x = X(:, 1);
    y = X(:, 2);
    z = X(:, 3);

    % Plotting the Lorenz attractor in 3D
    figure;
    plot3(x, y, z);
    xlabel('x');
    ylabel('y');
    zlabel('z');
    title('Lorenz Attractor');
    grid on;
    
    % Finding equilibrium points from the simulation results
    x_eq = x(end);
    y_eq = y(end);
    z_eq = z(end);

    % Display the equilibrium points
    fprintf('Equilibrium points:\n');
    fprintf('-------------------\n');
    fprintf('x_eq = %.4f\n', x_eq);
    fprintf('y_eq = %.4f\n', y_eq);
    fprintf('z_eq = %.4f\n', z_eq);
end
