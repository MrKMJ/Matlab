function simulate_lorenz_system2()

    % Time span for simulation (from 0 to 100 seconds with a step of 0.01 second)
    tspan = 0:0.01:100;

    % Parameters
    sigma = 10;
    b = 8/3;

    % Values of r to simulate
    r_values = 1:0.1:28;

    % Loop over different values of r and simulate the Lorenz system
    for i = 1:length(r_values)
        r = r_values(i);

        % Initial conditions
        x0 = 0;
        y0 = 2.001;
        z0 = 0;

        % Define the Lorenz system differential equations
        f = @(t, X) [-sigma * X(1) + sigma * X(2);
                     r * X(1) - X(2) - X(1) * X(3);
                     -b * X(3) + X(1) * X(2)];

        % Numerical integration using fourth-order Runge-Kutta method
        [t, X] = ode45(f, tspan, [x0, y0, z0]);

        % Extracting individual components from the state matrix X
        x = X(:, 1);
        y = X(:, 2);
        z = X(:, 3);

        % Plotting the Lorenz attractor in 3D for specific r values
        if r == 28 
            figure;
            plot3(x, y, z);
            xlabel('x');
            ylabel('y');
            zlabel('z');
            title(['Lorenz Attractor, r = ', num2str(r)]);
            grid on;
        end
    end
end