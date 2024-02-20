% Parameters
N = 400;
ts = 2000;
eta = 0.1;
boundary = 0; % Square-periodic boundary
show = 0; % No need to plot in this case

% Initialize array to store polarization values
polarization_nn = zeros(1, 10);

% Loop over different number of nearest neighbors
for nn = 1:10
    % Calculate polarization for the current number of nearest neighbors
    gobsTopological = vicsek2d(N, ts, eta, 'nn', nn, 1, boundary, show);
    polarization_nn(nn) = nanmean(gobsTopological.pol);
end

% Plot results
figure;
plot(1:10, polarization_nn, '-o');
xlabel('Number of Nearest Neighbors');
ylabel('Polarization (Order Parameter)');
title('Effect of Number of Nearest Neighbors on Polarization');
grid on;
