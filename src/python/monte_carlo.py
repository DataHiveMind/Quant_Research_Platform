import numpy as np

def monte_carlo_simulation(S0, mu, sigma, T, num_steps, num_simulations):
    """
    Perform Monte Carlo simulations for asset price modeling.
    
    Args:
    - S0: Initial price of the asset.
    - mu: Expected return.
    - sigma: Volatility.
    - T: Time horizon (in years).
    - num_steps: Number of steps in the simulation.
    - num_simulations: Number of simulation paths.

    Returns:
    - simulations: A NumPy array of simulated asset prices.
    """
    dt = T / num_steps
    simulations = np.zeros((num_simulations, num_steps + 1))
    simulations[:, 0] = S0

    for t in range(1, num_steps + 1):
        random_shocks = np.random.normal(0, 1, num_simulations)
        simulations[:, t] = simulations[:, t - 1] * np.exp(
            (mu - 0.5 * sigma**2) * dt + sigma * np.sqrt(dt) * random_shocks
        )
    
    return simulations

# Example usage
if __name__ == "__main__":
    S0 = 100  # Initial asset price
    mu = 0.05  # Expected return (5%)
    sigma = 0.2  # Volatility (20%)
    T = 1  # Time horizon (1 year)
    num_steps = 252  # Trading days in a year
    num_simulations = 1000

    results = monte_carlo_simulation(S0, mu, sigma, T, num_steps, num_simulations)
    print("Monte Carlo simulation completed!")
