#include "monte_carlo.h"
#include <cmath>
#include <random>

std::vector<std::vector<double>> monteCarloSimulation(double S0, double mu, double sigma, double T, int numSteps, int numSimulations) {
    std::vector<std::vector<double>> simulations(numSimulations, std::vector<double>(numSteps + 1, S0));

    double dt = T / numSteps;
    std::random_device rd;
    std::mt19937 gen(rd());
    std::normal_distribution<> dist(0.0, 1.0);

    for (int i = 0; i < numSimulations; ++i) {
        for (int j = 1; j <= numSteps; ++j) {
            double randomShock = dist(gen);
            simulations[i][j] = simulations[i][j - 1] * std::exp((mu - 0.5 * sigma * sigma) * dt + sigma * std::sqrt(dt) * randomShock);
        }
    }

    return simulations;
}
