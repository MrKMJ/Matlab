% Parameters
sigma = 10;
r = 1.5; % Replace with the desired value of r (r > 1)
b = 8/3;

% Initial conditions
x0 = 0;
y0 = 1;
z0 = 1.05;

% Time span for simulation (e.g., from 0 to 50 with a step of 0.01)
tspan = 0:0.01:50;

% Call the lorenz_simulation function
lorenz_simulation(sigma, r, b, x0, y0, z0, tspan);