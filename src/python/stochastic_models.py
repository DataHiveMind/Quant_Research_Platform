import numpy as np

def geometric_brownian_motion(S0, mu, sigma, T, num_steps):
    """
    Simulates Geometric Brownian Motion for asset prices.
    """
    dt = T / num_steps
    prices = np.zeros(num_steps)
    prices[0] = S0

    for t in range(1, num_steps):
        random_shock = np.random.normal(0, np.sqrt(dt))
        prices[t] = prices[t - 1] * np.exp((mu - 0.5 * sigma**2) * dt + sigma * random_shock)
    
    return prices

def mean_reverting_process(S0, theta, mu, sigma, T, num_steps):
    """
    Simulates a mean-reverting process (e.g., Ornstein-Uhlenbeck).
    """
    dt = T / num_steps
    prices = np.zeros(num_steps)
    prices[0] = S0

    for t in range(1, num_steps):
        random_shock = np.random.normal(0, np.sqrt(dt))
        prices[t] = prices[t - 1] + theta * (mu - prices[t - 1]) * dt + sigma * random_shock
    
    return prices

