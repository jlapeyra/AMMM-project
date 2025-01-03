#include <vector>
#include <cstdio>
#include <iostream>
template <typename T>
void printVector(const std::vector<T>& v) {
  if (v.size() == 0) {
    printf("[]");
    return;
  }

  printf("[");
  for (int i = 0; i < v.size() - 1; i++) {
    std::cout << v[i];
    printf(", ");
  }
  if (v.size()) {
    std::cout << v[v.size() - 1];
    printf("]");
  }
}
