# Calculate Value at Risk (VaR)
calculate_var <- function(returns, confidence_level = 0.95) {
  quantile(returns, probs = 1 - confidence_level)
}

# Calculate Conditional VaR (CVaR)
calculate_cvar <- function(returns, confidence_level = 0.95) {
  var <- calculate_var(returns, confidence_level)
  mean(returns[returns <= var])
}

# Calculate Sharpe Ratio
calculate_sharpe <- function(returns, risk_free_rate = 0.02) {
  mean(returns - risk_free_rate) / sd(returns)
}

# Example usage
data <- read.csv("data/processed/data.csv")
returns <- data$log_returns
var <- calculate_var(returns)
cvar <- calculate_cvar(returns)
sharpe <- calculate_sharpe(returns)
print(var)
print(cvar)
print(sharpe)
