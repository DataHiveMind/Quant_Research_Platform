#ifndef MONTE_CARLO_H
#define MONTE_CARLO_H

#include <vector>

std::vector<std::vector<double>> monteCarloSimulation(double S0, double mu, double sigma, double T, int numSteps, int numSimulations);

#endif // MONTE_CARLO_H
