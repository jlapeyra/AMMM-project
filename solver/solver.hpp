#pragma once
#include "state.hpp"

struct SolverOpts {
  int method;
};

struct SolverSolution {
  float runningTime;
  float fitness;
};

// SolverSolution solve(State& state);
