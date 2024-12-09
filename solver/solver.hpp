#pragma once
#include <vector>
#include "input.hpp"

using State = std::vector<int>;
struct SolverOpts {
  int method;
};

struct SolverSolution {
  float            runningTime;
  float            fitness;
  std::vector<int> comission;
};

std::vector<State> getNeighbors(Input& input, State& current);
SolverSolution     solveGreedy(float alpha, Input& input);
SolverSolution     solve(float alpha, Input& input);
SolverSolution     solveGRASP(int num_iterations, float alpha, Input& input);