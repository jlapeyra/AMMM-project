#include "solver.hpp"
#include <cstdio>
#include <vector>
#include <set>
#include <algorithm>
#include "input.hpp"
#include "util.hpp"
#include "hill.hpp"

bool verbose = true;

struct TeacherRank {
  int   teacher;
  float score;
  int   d;

  //Used for sorting: teacher with higher score goes first
  bool operator<(const TeacherRank& other) const {
    return this->score > other.score;
  }
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
scoreTeachers(const std::vector<int>& comission, std::vector<int>& dFullfilment, Input& input) {
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

    result.push_back({i, score, d});
  }

  return result;
}

int popTeacher(float alpha, std::set<TeacherRank>& ranking) {
  // return t.teacher where t is a random selection of RCL
  //    where RCL = {t ∊ ranking | t.score ≥ max_score - alpha*(max_score-min_score)}
  //    where max_score = max({t.score | t ∊ ranking})
  //    where min_score = min({t.score | t ∊ ranking})

  std::set<TeacherRank>::iterator chosen_it;
  if (alpha == 0) {
    // Special case: t.score ≥ max_score
    // Recall that ranking is ordered by score from highest to lowest
    chosen_it = ranking.begin();
  } else {
    std::vector<std::set<TeacherRank>::iterator> rcl(0);        //restricted candidate list for GRASP
    std::vector<int>                             rcl_scores(0); //provisional
    float                                        max_score = ranking.begin()->score;
    float                                        min_score = ranking.rbegin()->score;
    float                                        threshold = max_score - alpha * (max_score - min_score);
    for (auto it = ranking.begin();
         it != ranking.end() && it->score >= threshold;
         it = next(it)) {
      rcl.push_back(it);
      rcl_scores.push_back(it->score);
    }
    chosen_it = rcl[rand() % rcl.size()];
    /*
    printf("\tTop scores: ");
    printVector(rcl_scores);
    printf(". Chosen score: %f\n", chosen_it->score); */
  }
  int teacher = chosen_it->teacher;
  ranking.erase(chosen_it);
  return teacher;
}

int bestRequired;
int iterations;

bool solveRecursive(float alpha, int requiredTeachers, std::vector<int>& comission, std::vector<int>& dFull, Input& input) {
  //INV: requiredTeachers = sum(input.n) - comission.size()
  //INV: bestRequired = minimal value found so far in the algorithm
  //INV: iterations = number of calls to solveRecursive

  if (requiredTeachers < bestRequired) {
    printf("Found comission with %d lacking teachers.\n", requiredTeachers);
  }

  bestRequired = std::min(requiredTeachers, bestRequired);
  iterations++;

  if (requiredTeachers == 0) {
    return true;
  }

  std::vector<TeacherRank> scoredTeachers = scoreTeachers(comission, dFull, input);

  //ordered set of teachers sorted by score (higher score first)
  set<TeacherRank> rankedTeachers(scoredTeachers.begin(), scoredTeachers.end());
  while (!rankedTeachers.empty()) {
    int teacher = popTeacher(alpha, rankedTeachers);

    //Comission add
    comission.push_back(teacher);
    dFull[input.d[teacher]]++;

    if (input.validMediation(comission)) {
      bool solved = solveRecursive(alpha, requiredTeachers - 1, comission, dFull, input);
      if (solved) return solved;
    }

    //Comission remove
    comission.pop_back();
    dFull[input.d[teacher]]--;
  }
  return false;

  /* 
  //Slightly more efficient version for special case where alpha = 0 (local search without grasp)
  if (alpha == 0.0f) {
    //sort teachers by score (higher score first)
    std::sort(scoredTeachers.begin(), scoredTeachers.end()); // [](const auto& lhs, const auto& rhs) { return lhs.score > rhs.score; }  );
    for (int i = 0; i < scoredTeachers.size(); i++) {
      int teacher = scoredTeachers[i].teacher;
      ...
    }
  else {
    set<TeacherRank> rankedTeachers(scoredTeachers.begin(), scoredTeachers.end());
    ...
  }
  return false;
  */
}

/** Greedy solver **/
SolverSolution solveGreedy(float alpha, Input& input) {
  SolverSolution    sol;
  std::vector<int>  currentDepartmentFullfilment(input.D());
  std::vector<int>& comission = sol.comission;

  int requiredTeachers = 0;

  for (int i = 0; i < input.D(); i++) { requiredTeachers += input.n[i]; }

  iterations   = 0;
  bestRequired = requiredTeachers;

  solveRecursive(alpha, requiredTeachers, comission, currentDepartmentFullfilment, input);

  if (verbose) {
    printf("Iterations = %d\n", iterations);
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

/* Local Search solver */
SolverSolution solve(float alpha, Input& input) {
  SolverSolution sol;
  printf("Construction phase:\n");
  sol = solveGreedy(alpha, input);
  printf("Local Search:\n");
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

/* GRASP solver */
// PRE: num_iterations >= 1
// PRE: 0 <= alpha <= 1
SolverSolution solveGRASP(int num_iterations, float alpha, Input& input) {
  SolverSolution best_sol;
  float          best_fitness = -1.0;
  for (int i = 0; i < num_iterations; i++) {
    SolverSolution sol = solve(alpha, input);
    if (sol.fitness > best_fitness) {
      best_fitness = sol.fitness;
      best_sol     = sol;
    }
  }
  return best_sol;
}
