#include <iostream>
#include <vector>
#include "monte_carlo.h"
#include "stochastic_models.h"

int main() {
    std::cout << "Starting Simulation Engine..." << std::endl;

    // Parameters for simulations
    double S0 = 100.0; // Initial price
    double mu = 0.05;  // Expected return
    double sigma = 0.2; // Volatility
    double T = 1.0;    // Time horizon (1 year)
    int numSteps = 252; // Number of steps
    int numSimulations = 1000; // Number of Monte Carlo simulations

    // Run Monte Carlo Simulation
    std::cout << "Running Monte Carlo Simulation..." << std::endl;
    std::vector<std::vector<double>> results = monteCarloSimulation(S0, mu, sigma, T, numSteps, numSimulations);

    // Print a sample path
    std::cout << "Sample Monte Carlo Path: ";
    for (const auto& price : results[0]) {
        std::cout << price << " ";
    }
    std::cout << std::endl;

    // Run Geometric Brownian Motion
    std::cout << "Running Geometric Brownian Motion Simulation..." << std::endl;
    std::vector<double> gbmPath = geometricBrownianMotion(S0, mu, sigma, T, numSteps);

    // Print GBM path
    std::cout << "Geometric Brownian Motion Path: ";
    for (const auto& price : gbmPath) {
        std::cout << price << " ";
    }
    std::cout << std::endl;

    return 0;
}
