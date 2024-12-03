#pragma once
#include <vector>
#include "input.hpp"

struct SolverOpts {
  int method;
};

struct SolverSolution {
  float            runningTime;
  float            fitness;
  std::vector<int> comission;
};

SolverSolution solve(float alpha, Input& input);
