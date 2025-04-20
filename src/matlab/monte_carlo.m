function simulations = monte_carlo_simulation(S0, mu, sigma, T, num_steps, num_simulations)
    % Performs Monte Carlo simulations for asset prices
    dt = T / num_steps;
    simulations = zeros(num_simulations, num_steps + 1);
    simulations(:, 1) = S0;

    for t = 2:num_steps + 1
        random_shocks = randn(num_simulations, 1);
        simulations(:, t) = simulations(:, t - 1) .* exp((mu - 0.5 * sigma^2) * dt + sigma * sqrt(dt) .* random_shocks);
    end
end

% Example usage
% S0 = 100; mu = 0.05; sigma = 0.2; T = 1; num_steps = 252; num_simulations = 1000;
% mc_results = monte_carlo_simulation(S0, mu, sigma, T, num_steps, num_simulations);
% plot(mc_results');
