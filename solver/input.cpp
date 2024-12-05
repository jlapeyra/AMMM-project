#include "input.hpp"
#include <algorithm>
#include <fstream>
#include <cstdio>
#include "parser.hpp"
#include <iostream>
#include "util.hpp"
#include <random>
#include <set>

// Function to write a std::string to a file
int writeToFile(const std::string& filePath, const std::string& content) {
  std::ofstream outFile(filePath, std::ios::out | std::ios::trunc);
  if (!outFile) {
    return 1;
  }
  outFile << content;
  outFile.close();
  return 0;
}

// Function to read the content of a file into a std::string
std::string readFromFile(const std::string& filePath) {
  std::ifstream inFile(filePath, std::ios::in);
  if (!inFile) {
    return std::string();
  }
  std::string content((std::istreambuf_iterator<char>(inFile)),
                      std::istreambuf_iterator<char>());
  inFile.close();
  return content;
}

int Input::generate(GeneratorOpts opts) {
  clear();

  n.resize(opts.D, 0);
  d.resize(opts.N, 0);

  int maxTeachers = opts.N / (opts.D * 3);
  int t           = 0;
  for (int i = 0; i < n.size(); i++) {
    n[i] = std::max(rand() % maxTeachers, 1);
    for (int j = 0; j < n[i]; j++) {
      d[t++] = i;
    }
  }

  for (int i = t; i < opts.N; i++) {
    d[i] = rand() % opts.D;
  }

  //  std::shuffle(d.begin(), d.end(), std::default_random_engine(0));

  m.resize(opts.N, std::vector<float>(opts.N));
  for (int i = 0; i < opts.N; i++) {
    for (int j = i + 1; j < opts.N; j++) {
      float val = std::min(1.0f, (rand() % 100) / float(100) + 0.17f);
      if ((rand() % 50) < 3)
        val = 0.0f;
      m[i][j] = m[j][i] = val;
    }
    m[i][i] = 1.0f;
  }
  return 0;
}

bool Input::valid() {

  std::vector<int> membership(D());

  for (int i = 0; i < N(); i++) { membership[d[i]]++; }

  for (int i = 0; i < D(); i++) {
    if (membership[i] < n[i]) return false;
  }
  return true;
}

void Input::clear() {
  m.clear();
  d.clear();
  n.clear();
}

int Input::read(const string& file) {
  *this = fromString(readFromFile(file));
  return this->errored;
}

void Input::save() {
  printf("%s\n", toString(*this).c_str());
}

bool Input::compatibleMemmber(const std::vector<int>& comission, int newMember) const {
  for (int i = 0; i < comission.size(); i++) {
    if (m[comission[i]][newMember] <= 0.0f) return false;
  }
  return true;
}

bool Input::valid(const std::vector<int>& comission) const {
  return validDepartment(comission) && validCompatibility(comission) && validMediation(comission);
}

bool Input::validCompatibility(const std::vector<int>& comission) const {
  for (int i = 0; i < comission.size(); i++) {
    for (int j = i + 1; j < comission.size(); j++) {
      int u = comission[i];
      int v = comission[j];

      float compat = m[u][v];
      if (compat <= 0.0f)
        return false;
    }
  }
  return true;
}

bool Input::validDepartment(const std::vector<int>& comission) const {
  std::vector<int> departemtFullfilment(n.size());
  for (int i = 0; i < comission.size(); i++) {
    departemtFullfilment[d[comission[i]]]++;
  }

  for (int i = 0; i < departemtFullfilment.size(); i++) {
    if (departemtFullfilment[i] != n[i]) {
      return false;
    }
  }
  return true;
}

bool Input::validMediation(const std::vector<int>& comission) const {
  struct TeacherPair {
    int a;
    int b;
  };

  std::vector<TeacherPair> problematics;
  problematics.clear();

  for (int i = 0; i < comission.size(); i++) {
    for (int j = 0; j < comission.size(); j++) {
      int u = comission[i];
      int v = comission[j];

      if (m[u][v] < 0.15f) problematics.push_back({u, v});
    }
  }

  for (TeacherPair& pair : problematics) {
    bool invalid = true;
    for (int u : comission) {
      if (m[u][pair.a] > 0.85 && m[u][pair.b] > 0.85) {
        invalid = false;
        break;
      }
    }
    if (invalid) return false;
  }

  return true;
}

float Input::score(const std::vector<int>& comission) const {
  float score = 0.0f;
  int   count = 0;
  for (int i = 0; i < comission.size(); i++) {
    for (int j = i + 1; j < comission.size(); j++) {
      int u = comission[i];
      int v = comission[j];

      score += m[u][v];
      count++;
    }
  }

  return score;
  // al opl no calculem la mitjana
  // return score / count;
}

void Input::print() {
  printf("N = Number of teachers: %d\n", N());
  printf("D = Number of departments: %d\n", D());
  printf("n = ");
  printVector(n);
  printf("\n");
  printf("d = ");
  printVector(d);
  printf("\n");

  printf("m = \n");
  for (int i = 0; i < m.size(); i++) {
    printVector(m[i]);
    printf("\n");
  }

  printf("ValidInput = %d\n", valid());
}

Input::Input() { errored = false; }


float score(const Input& input, const std::vector<int>& comission) {
  return input.score(comission);
}

bool valid(const Input& input, const std::vector<int>& comission) {
  return input.valid(comission);
}
