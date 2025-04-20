# Regression analysis on asset returns
regression_analysis <- function(data) {
  model <- lm(log_returns ~ volatility, data = data)
  summary(model)
}

# Example usage
data <- read.csv("data/processed/data.csv")
data$log_returns <- log(data$close / lag(data$close))
result <- regression_analysis(data)
print(result)
