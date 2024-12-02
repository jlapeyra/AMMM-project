#include "input.hpp"
#include <fstream>
#include <cstdio>
#include "parser.hpp"
#include <iostream>
#include "util.hpp"

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

  n.resize(opts.D);

  for (int i = 0; i < opts.N; i++) {
    int x = rand() % opts.D;
    d.push_back(x);
    if ((rand() % 10) < 6)
      n[x]++;
  }

  for (int i = 0; i < opts.D; i++) {
    n[i] = std::max(n[i], 1);
  }

  m.resize(opts.N, std::vector<float>(opts.N));
  for (int i = 0; i < opts.N; i++) {
    for (int j = i + 1; j < opts.N; j++) {
      m[i][j] = m[j][i] = (rand() % 8) / float(8);
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

  printf("Valid = %d\n", valid());
}

Input::Input() { errored = false; }
