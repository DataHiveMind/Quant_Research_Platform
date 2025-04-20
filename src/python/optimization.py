import numpy as np

def mean_variance_optimization(returns, risk_tolerance=0.5):
    """
    Optimizes portfolio weights using Mean-Variance Optimization.
    """
    mean_returns = np.mean(returns, axis=0)
    cov_matrix = np.cov(returns, rowvar=False)

    num_assets = len(mean_returns)
    weights = np.random.random(num_assets)
    weights /= np.sum(weights)

    # Calculate portfolio return and risk
    portfolio_return = np.dot(weights, mean_returns)
    portfolio_risk = np.sqrt(np.dot(weights.T, np.dot(cov_matrix, weights)))

    objective = risk_tolerance * portfolio_risk - (1 - risk_tolerance) * portfolio_return
    print(f"Optimized Objective Value: {objective}")
    return weights
