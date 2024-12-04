#include "solver.hpp"
#include <cstdio>
#include <vector>
#include <algorithm>
#include "input.hpp"
#include "util.hpp"
#include "hill.hpp"
#include <cmath>

bool verbose = true;

struct TeacherRank {
  int   teacher;
  float score;
};

/* Returns the vector of teachers who are not in the comission */
std::vector<int> getNotInComission(Input& input, const std::vector<int>& current) {
  std::vector<int> present(input.N());
  for (int u : current) present[u] = 1;
  std::vector<int> notInComission;

  for (int i = 0; i < input.N(); i++)
    if (!present[i]) notInComission.push_back(i);
  return notInComission;
}

/* Returns wether a teacher is member of the comission */
bool memberOfComission(const std::vector<int>& comission, int teacher) {
  for (int i = 0; i < comission.size(); i++)
    if (comission[i] == teacher) return true;
  return false;
}

/* Returns how much a new member is compatible with the current comission, returns -1.0f if its not compatible */
float memberCompatible(const std::vector<int>& comission, Input& input, int member) {
  float compat = 0.0f;
  for (int i = 0; i < comission.size(); i++) {
    if (input.m[comission[i]][member] <= 0.0f) return -1.0f;
    compat += input.m[comission[i]][member];
  }
  return compat;
}

float heuristic(Input& input, const std::vector<int>& current, int newTeacher) {
  std::vector<int> notInComission = getNotInComission(input, current);

  float score = 0.0f;
  for (int u : notInComission) {
    score += 5 * (input.m[u][newTeacher] > 0.15f);
    score += input.m[u][newTeacher] != 0.0f;
  }
  return score * 50.0f;
}

std::vector<TeacherRank>
findbestTeachers(int start, const std::vector<int>& comission, std::vector<int>& dFullfilment, Input& input) {
  std::vector<TeacherRank> result;

  for (int i = 0; i < input.N(); i++) {
    //Is already member
    if (memberOfComission(comission, i)) continue;
    int d = input.d[i];

    //Department fulfilled
    if (dFullfilment[d] == input.n[d]) continue;

    //Member compatibility
    float score = memberCompatible(comission, input, i);
    if (score < 0.0f) continue;

    score += heuristic(input, comission, i);

    result.push_back({i, score});
  }

  //Rank all options based on compatibility with current comission
  std::sort(result.begin(), result.end(), [](const auto& lhs, const auto& rhs) { return lhs.score > rhs.score; });
  return result;
}

int bestRequired;
int iterations;
int tests;

bool solveRecursive(int start, int requiredTeachers, std::vector<int>& comission, std::vector<int>& dFull, Input& input) {

  if (requiredTeachers < bestRequired) {
    printf("Found comission with %d lacking teachers.\n", requiredTeachers);
  }

  bestRequired = std::min(requiredTeachers, bestRequired);
  iterations++;

  if (requiredTeachers == 0) {
    tests++;

    //TODO: This should just return true we should optimize this step so we can validate comission state fast in building step
    return input.validMediation(comission);
  }

  std::vector<TeacherRank> bestTeachers = findbestTeachers(start, comission, dFull, input);

  for (int i = 0; i < bestTeachers.size(); i++) {
    int teacher = bestTeachers[i].teacher;

    //Comission add
    comission.push_back(teacher);
    dFull[input.d[teacher]]++;

    bool solved = solveRecursive(start + 1, requiredTeachers - 1, comission, dFull, input);
    if (solved) return solved;

    //Comission remove
    comission.pop_back();
    dFull[input.d[teacher]]--;
  }

  return false;
}

/** Greedy solver **/
SolverSolution solveGreedy(float alpha, Input& input) {
  SolverSolution    sol;
  std::vector<int>  currentDepartmentFullfilment(input.D());
  std::vector<int>& comission = sol.comission;

  int requiredTeachers = 0;

  for (int i = 0; i < input.D(); i++) { requiredTeachers += input.n[i]; }

  iterations   = 0;
  tests        = 0;
  bestRequired = requiredTeachers;

  solveRecursive(0, requiredTeachers, comission, currentDepartmentFullfilment, input);

  if (verbose) {
    printf("Iterations = %d\n", iterations);
    printf("Tests = %d\n", tests);
    printf("Comission = ");
    printVector(comission);
    printf("\n");

    int valid;
    printf("Valid compatibility = %d\n", input.validCompatibility(comission));
    printf("Valid department fullfilment = %d\n", input.validDepartment(comission));
    printf("Valid mediation = %d\n", input.validMediation(comission));
    printf("Valid = %d\n", valid = input.valid(comission));
    if (valid)
      printf("Score = %f\n", input.score(comission));
  }
  return sol;
}

void swapNeighbors(int depth, std::vector<int>& notInComission, Input& input, State& current, std::vector<State>& alternatives) {

  for (int i = 0; i < current.size(); i++) {
    for (int j = 0; j < notInComission.size(); j++) {
      std::swap(current[i], notInComission[j]);

      if (depth > 1) {
        swapNeighbors(depth - 1, notInComission, input, current, alternatives);
      }

      if (input.valid(current)) {
        alternatives.push_back(current);
      }
      std::swap(current[i], notInComission[j]);
    }
  }
}

//Perform n-Swap to generate all feasible neihgbors
std::vector<State> getNeighbors(Input& input, State& current) {
  std::vector<State> alternatives;
  std::vector<int>   notInComission = getNotInComission(input, current);

  swapNeighbors(2, notInComission, input, current, alternatives);

  return alternatives;
}

/* General solver */
SolverSolution solve(float alpha, Input& input) {
  SolverSolution sol;
  sol = solveGreedy(alpha, input);
  if (sol.comission.size()) {
    if (verbose)
      printf("Executing hill climbing:\n");

    OptimizationResult result = optimize(input, sol.comission, getNeighbors, score);

    sol.comission = result.state;
    sol.fitness   = score(input, result.state);

    if (verbose) {
      printf("Iterations = %d\n", result.iterations);
      printf("Newscore = %f\n", sol.fitness);
    }
  }
  return sol;
}
