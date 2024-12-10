#include <vector>
#include "timeout.hpp"

template <typename State>
struct OptimizationResult {
  State state;
  int   iterations;
};

template <typename State, typename Input, typename NeighborFunction, typename ScoreFunction>
OptimizationResult<State> optimize(Input& input, State state, NeighborFunction&& neighborFunction, ScoreFunction&& scoreFunction) {
  float currentScore = scoreFunction(input, state);
  int   iterations   = 0;

  while (1) {
    if (timeout())
      break;

    iterations++;
    std::vector<State> siblings  = neighborFunction(input, state);
    float              bestScore = -1.0f;
    int                bestIndex = -1;

    for (int i = 0; i < siblings.size(); i++) {
      float siblingScore = scoreFunction(input, siblings[i]);
      if (siblingScore > bestScore) {
        bestIndex = i;
        bestScore = siblingScore;
      }
    }

    if (bestIndex != -1 && bestScore > currentScore) {
      state        = siblings[bestIndex];
      currentScore = bestScore;
    } else
      break;
  }

  return {.state = state, .iterations = iterations};
}
