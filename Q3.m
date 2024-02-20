% Parameters
N = 400;
ts = 2000;
boundary_types = {'square', 'circle'}; % Square and Circular boundaries
eta = 0.1;
metric_distance = 0.5; % Nearest-neighbor metric distance
show = 0; % No need to plot in this case

% Initialize arrays to store average values
annd_avg = zeros(length(boundary_types), 1);
order_avg = zeros(length(boundary_types), 1);
angm_avg = zeros(length(boundary_types), 1);

% Loop over different boundary types
for j = 1:length(boundary_types)
    boundary_type = boundary_types{j};
    
    % Run simulation
    gobs = vicsek2d(N, ts, eta, 'metric', metric_distance, 1, boundary_type, show);
    
    % Calculate average values for the last 10% of time steps
    annd_avg(j) = nanmean(gobs.annd);
    order_avg(j) = nanmean(gobs.pol);
    angm_avg(j) = nanmean(gobs.angm);
end

% Plot results
figure;

% Average Nearest Neighbor Distance (ANND)
subplot(3, 1, 1);
bar(annd_avg);
xticklabels(boundary_types);
ylabel('Average Nearest Neighbor Distance (ANND)');
title('Effect of Boundary Shape on ANND');
grid on;

% Order (Polarization)
subplot(3, 1, 2);
bar(order_avg);
xticklabels(boundary_types);
ylabel('Order (Polarization)');
title('Effect of Boundary Shape on Order');
grid on;

% Angular Momentum
subplot(3, 1, 3);
bar(angm_avg);
xticklabels(boundary_types);
ylabel('Angular Momentum');
title('Effect of Boundary Shape on Angular Momentum');
grid on;

sgtitle('Effect of Boundary Shape on Particle Behavior');
