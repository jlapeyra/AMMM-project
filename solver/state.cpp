#include "state.hpp"
#include <algorithm>
#include <numeric>
#include <random>
#include <set>
#include "util.hpp"
#include <algorithm>

void State::clear() { comission.clear(); }

int State::validComission() {
  for (int i = 0; i < comission.size(); i++) {
    for (int j = i + 1; j < comission.size(); j++) {
      int u = comission[i];
      int v = comission[j];

      float compat = input.m[u][v];
      if (compat <= 0.0f)
        return 0;
    }
  }
  return 1;
}

int State::validDepartment() {
  std::vector<int> departemtFullfilment(input.n.size());
  for (int i = 0; i < comission.size(); i++) {
    departemtFullfilment[input.d[comission[i]]]++;
  }

  for (int i = 0; i < departemtFullfilment.size(); i++) {
    if (departemtFullfilment[i] != input.n[i]) {
      return 0;
    }
  }
  return 1;
}

float State::score() {
  float score = 0.0f;
  int   count = 0;
  for (int i = 0; i < comission.size(); i++) {
    for (int j = i + 1; j < comission.size(); j++) {
      int u = comission[i];
      int v = comission[j];

      score += input.m[u][v];
      count++;
    }
  }
  return score / count;
}


float avgCompat(int teacher, const set<int>& selected, const vector<vector<float>>& m) {
  if (selected.empty()) return 1.0;
  double total = 0.0;
  for (int other : selected) {
    total += m[teacher][other];
  }
  return total / selected.size();
}

struct Index {
  int value;
  int index;
};

struct Solution {
  std::vector<int>   remaining;
  std::vector<Index> compatibility;
  std::set<int>      current;

  void addTeacher(int u, int d) {
    current.insert(u);
    remaining[d]++;
  }

  void removeTeacher(int u, int d) {
    remaining[d]--;
    current.erase(u);
  }

  bool isValid(State& parent) {
    State s(parent.input);
    for (int u : current) s.comission.push_back(u);
    return s.validComission();
  }
};


bool solve(State& s, Solution& sol, int i) {
  if (i == s.input.N()) {
    return sol.isValid(s);
  }

  bool compatible = true;

  int u = i;
  for (int v : sol.current) {
    if (s.input.m[u][v] == 0.0f) {
      compatible = false;
      break;
    }
  }

  if (compatible) {
    sol.current.insert(u);
    bool solvable = solve(s, sol, i + 1);
    if (!solvable) {
      sol.current.erase(u);
      return solve(s, sol, i + 1);
    }
  }

  for (int u : sol.current) {
    printf("%d ", u);
  }
  printf("\n");
  return false;
}
// Greedy algorithm for teacher assignment
void State::greedyRandom(float a) {

  Solution sol;

  for (int i = 0; i < input.N(); i++) {
    int count = 0;
    for (int j = 0; j < input.N(); j++) {
      count += input.m[i][j] != 0.0f;
    }
    sol.compatibility.push_back({count, i});
  }


  std::sort(sol.compatibility.begin(), sol.compatibility.end(), [](const auto& lhs, const auto& rhs) {
    return lhs.value > rhs.value;
  });

  bool solution = solve(*this, sol, 0);
  if (solution) {
    for (int u : sol.current) { comission.push_back(u); }
    printf("\nSolution: \n");
    printVector(comission);
    printf("\n");
  } else {
    printf("No solution found\n");
  }
  /*
  std::set<int> selection;
  for (int i = 0; i < input.N(); i++) {
    int  u          = sol.compatibility[i].index;
    bool compatible = true;

    for (int v : selection) {
      if (input.m[u][v] == 0.0f) {
        compatible = false;
        break;
      }
    }

    if (compatible) {
      selection.insert(u);
    }
  }

  std::vector<int> candidate(input.D());
  for (int i = 0; i < comission.size(); i++) {
    candidate[input.d[comission[i]]]++;
  }

  printf("\n");
  printf("\n");
  printVector(input.n);
  printf("\n");
  printVector(candidate);
  printf("\n"); */
}

/*
void State::greedyRandom(float alpha) {
  std::set<int> maximal;

  std::vector<int> indices(input.N());

  for (int i = 0; i < indices.size(); i++) {
    indices[i] = i;
  }

  auto engine     = std::default_random_engine(time(0));
  int  iterations = 0;
  while (true) {
    std::shuffle(indices.begin(), indices.end(), engine);
    maximal.clear();
    for (int k = 0; k < input.N(); k++) {
      int i = indices[k];
      for (int j = i + 1; j < input.N(); j++) {
        if (input.m[i][j] != 0 && maximal.count(i) == 0) maximal.insert(i);
      }
    }

    std::vector<int> remaining(input.n.size());

    for (const int& u : maximal) {
      remaining[input.d[u]]++;
    }

    bool stop = true;
    for (int i = 0; i < input.n.size(); i++) {
      if (remaining[i] < input.n[i]) {
        stop = false;
      }
    }
    if (stop) {
      printf("\nSolution\n\n");
      printVector(remaining);
      printf("\n");
      printVector(input.n);
      printf("Iterations %d\n", iterations);
      break;
    } else {

      printf("\nSolution\n\n");
      printVector(remaining);
      printf("\n");
      printVector(input.n);
      printf("Iterations %d\n", iterations);
      iterations++;
    }
  }
}*/
