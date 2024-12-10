#include "solver.hpp"
#include <cstdio>
#include <random>
#include <utility>
#include <vector>
#include <set>
#include <algorithm>
#include <chrono>
#include "input.hpp"
#include "util.hpp"
#include "hill.hpp"
#include <cstdint>
#include <unordered_set>

bool verbose = true;

struct TeacherRank {
  int   teacher;
  float score;

  //Used for sorting: teacher with higher score goes first
  bool operator<(const TeacherRank& other) const {
    return this->score > other.score;
  }
};

struct Tabu {
  std::unordered_set<uint64_t> testedComissions;

  //Hashes a vector order independently, that means that all permutations of vector V give the same hash
  uint64_t computeKey(const std::vector<int>& comission) {
    uint64_t mulval = 1;
    uint64_t sumVal = 0;

    for (int u : comission) {
      mulval *= (u + 2);
      sumVal += u;
    }
    uint64_t hash = mulval + sumVal + comission.size();
    return hash;
  }

  void addComission(const std::vector<int>& comission) {
    testedComissions.insert(computeKey(comission));
  }

  bool hasComission(const std::vector<int>& comission) {
    return testedComissions.count(computeKey(comission));
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

/* Returns the heuristic value of the given candidate partial solution */
float heuristic(Input& input, const std::vector<int>& current, int newTeacher) {
  std::vector<int> notInComission = getNotInComission(input, current);

  float score = 0.0f;
  for (int u : notInComission) {
    score += 5 * (input.m[u][newTeacher] > 0.15f);
    score += 15 * (input.m[u][newTeacher] != 0.0f);
  }
  return score * 50.0f;
}

/* Returns the set of candidate teachers to be included in the next candidate solution ordered by score inside a set*/
/* It is guaranteed that the new formed comission will have distinct members, only compatible members, and no department will be overfilled */
/* Also it is guaranteed that all new partial comissions from the inclusion of any candidate will be new and not a permutation of any already tested partial comission */
std::set<TeacherRank> scoreTeachers(std::vector<int>& comission, std::vector<int>& dFullfilment, Input& input, Tabu& tabu) {

  std::set<TeacherRank> result;

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

    //Checks if we have already tested the comission
    {
      comission.push_back(i);
      if (tabu.hasComission(comission)) {
        comission.pop_back();
        continue;
      }

      tabu.addComission(comission);
      comission.pop_back();
    }

    result.insert({i, score});
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
    }
    chosen_it = rcl[rand() % rcl.size()];
  }
  int teacher = chosen_it->teacher;
  ranking.erase(chosen_it);
  return teacher;
}

auto randEngine = std::default_random_engine(time(0));
int  bestRequired;
int  iterations;
int  backtracks;

bool solveRecursive(float alpha, int requiredTeachers, std::vector<int>& comission, std::vector<int>& dFull, Input& input, Tabu& tabu) {
  //INV: requiredTeachers = sum(input.n) - comission.size()
  //INV: bestRequired = minimal value found so far in the algorithm
  //INV: iterations = number of calls to solveRecursive

  if (timeout()) return false;

  if (requiredTeachers < bestRequired) {
    printf("\tFound comission with %d teachers missing.\n", requiredTeachers);
  }

  bestRequired = std::min(requiredTeachers, bestRequired);
  iterations++;

  if (requiredTeachers == 0) {
    return true;
  }

  std::set<TeacherRank> scoredTeachers = scoreTeachers(comission, dFull, input, tabu);

  while (scoredTeachers.size()) {
    int teacher = popTeacher(alpha, scoredTeachers);

    //Comission add
    comission.push_back(teacher);
    dFull[input.d[teacher]]++;

    if (input.validMediation(comission)) {
      bool solved = solveRecursive(alpha, requiredTeachers - 1, comission, dFull, input, tabu);
      if (solved) return solved;
    }
    backtracks++;

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
  Tabu tabu;

  solveRecursive(alpha, requiredTeachers, comission, currentDepartmentFullfilment, input, tabu);
  sol.satisfied = input.valid(comission);
  sol.fitness   = input.score(comission);

  if (verbose) {
    printf("\tIterations = %d\n", iterations);
    printf("\tComission = ");
    printVector(comission);
    printf("\n");

    printf("\tValid compatibility = %d\n", input.validCompatibility(comission));
    printf("\tValid department fullfilment = %d\n", input.validDepartment(comission));
    printf("\tValid mediation = %d\n", input.validMediation(comission));
    printf("\tValid = %d\n", sol.satisfied);
    if (sol.satisfied)
      printf("\tScore = %f\n", input.score(comission));
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
  if (sol.satisfied) {
    if (verbose)
      printf("\tExecuting hill climbing:\n");

    OptimizationResult result = optimize(input, sol.comission, getNeighbors, score);

    sol.comission = result.state;
    sol.fitness   = score(input, result.state);

    if (verbose) {
      printf("\tIterations = %d\n", result.iterations);
      printf("\tNewscore = %f\n", sol.fitness);
    }
  }
  return sol;
}

/* GRASP solver */
// PRE: num_iterations >= 1
// PRE: 0 <= alpha <= 1
SolverSolution solveGRASP(int num_iterations, float alpha, Input& input, ostream* csv) {
  SolverSolution best_sol;
  float          best_fitness = -1.0;
  auto           start        = std::chrono::high_resolution_clock::now();
  if (alpha == 0) {
    num_iterations = 1;
  }

  for (int i = 0; i < num_iterations; i++) {
    SolverSolution sol = solve(alpha, input);
    if (sol.satisfied && sol.fitness > best_fitness) {
      best_fitness = sol.fitness;
      best_sol     = sol;
    }
    if (csv != nullptr) {
      auto                          now      = std::chrono::high_resolution_clock::now();
      std::chrono::duration<double> time     = now - start;
      float                         time_sec = time.count();
      *csv << input.name << "," << alpha << "," << i + 1 << "," << best_fitness << "," << time_sec << "\n";
    }
    if (!sol.satisfied || timeout()) {
      return sol;
    }
  }
  return best_sol;
}


SolverSolution solveGRASP(int num_iterations, float alpha, Input& input) {
  auto do_nothing = [](int, const SolverSolution&) {
  };
  return solveGRASP(num_iterations, alpha, input, nullptr);
}
