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

SolverSolution solve(float alpha, Input& input);

std::vector<State> getNeighbors(Input& input, State& current);
