#ifndef STOCHASTIC_MODELS_H
#define STOCHASTIC_MODELS_H

#include <vector>

std::vector<double> geometricBrownianMotion(double S0, double mu, double sigma, double T, int numSteps);

#endif // STOCHASTIC_MODELS_H
