function prices = correlated_geometric_brownian_motion(S0, mu, sigma, T, num_steps, correlation_matrix)
    % Simulates Geometric Brownian Motion with correlation between assets
    num_assets = length(S0);
    dt = T / num_steps;
    prices = zeros(num_steps, num_assets);
    prices(1, :) = S0;

    cholesky_decomp = chol(correlation_matrix, 'lower'); % Correlation structure

    for t = 2:num_steps
        random_shocks = randn(num_assets, 1);
        correlated_shocks = cholesky_decomp * random_shocks; % Apply correlation
        prices(t, :) = prices(t - 1, :) .* exp((mu - 0.5 * sigma.^2) * dt + sigma .* sqrt(dt) .* correlated_shocks');
    end
end

% Example usage
S0 = [100, 120]; % Initial prices for two assets
mu = [0.05, 0.04]; % Expected returns
sigma = [0.2, 0.15]; % Volatility
T = 1; % Time horizon (1 year)
num_steps = 252; % Trading days
correlation_matrix = [1, 0.5; 0.5, 1]; % Correlation structure
prices = correlated_geometric_brownian_motion(S0, mu, sigma, T, num_steps, correlation_matrix);
plot(prices);
