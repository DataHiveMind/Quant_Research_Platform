# Plot asset returns vs. volatility
plot_returns_volatility <- function(data) {
  library(ggplot2)
  ggplot(data, aes(x = volatility, y = log_returns)) +
    geom_point() +
    ggtitle("Asset Returns vs Volatility") +
    xlab("Volatility") +
    ylab("Log Returns")
}

# Example usage
data <- read.csv("data/processed/data.csv")
data$log_returns <- log(data$close / lag(data$close))
plot_returns_volatility(data)
