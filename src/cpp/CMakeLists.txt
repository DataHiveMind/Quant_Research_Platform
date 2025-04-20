cmake_minimum_required(VERSION 3.10)
project(SimulationEngine)

set(CMAKE_CXX_STANDARD 17)

add_executable(SimulationEngine simulation_engine.cpp monte_carlo.cpp stochastic_models.cpp)
