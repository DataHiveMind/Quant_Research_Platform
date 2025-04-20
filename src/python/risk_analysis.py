import numpy as np

def calculate_var(returns, confidence_level=0.95):
    """
    Calculates Value at Risk (VaR) for the given confidence level.
    """
    var = np.percentile(returns, (1 - confidence_level) * 100)
    print(f"Value at Risk (VaR) at {confidence_level} confidence level: {var}")
    return var

def calculate_cvar(returns, confidence_level=0.95):
    """
    Calculates Conditional VaR (CVaR) for the given confidence level.
    """
    var = calculate_var(returns, confidence_level)
    cvar = returns[returns <= var].mean()
    print(f"Conditional VaR (CVaR) at {confidence_level} confidence level: {cvar}")
    return cvar
