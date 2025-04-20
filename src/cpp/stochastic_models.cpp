#include "stochastic_models.h"
#include <cmath>
#include <random>

std::vector<double> geometricBrownianMotion(double S0, double mu, double sigma, double T, int numSteps) {
    std::vector<double> prices(numSteps + 1, S0);
    double dt = T / numSteps;
    std::random_device rd;
    std::mt19937 gen(rd());
    std::normal_distribution<> dist(0.0, 1.0);

    for (int i = 1; i <= numSteps; ++i) {
        double randomShock = dist(gen);
        prices[i] = prices[i - 1] * std::exp((mu - 0.5 * sigma * sigma) * dt + sigma * std::sqrt(dt) * randomShock);
    }

    return prices;
}
