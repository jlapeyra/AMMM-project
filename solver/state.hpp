#include <vector>
#include "input.hpp"
#include <set>

struct State {
  Input&           input;
  std::vector<int> comission;

  State(Input& _input) :
    input(_input) {}

  void  clear();
  int   validComission();
  int   validDepartment();
  float score();
  void  greedyRandom(float a);
};
