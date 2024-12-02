#include <algorithm>
#include <vector>
#include <cstdlib>

std::vector<int> randomSummedVector(int n, int sum) {
  int remaining = sum;

  std::vector<int> result;

  for (int i = 0; i < n; i++) {
    if (remaining == 1) {
      result.push_back(1);
    } else {
      int c = rand() % remaining;
      c     = std::min(c, n - i);
      result.push_back(c);
    }
  }

  return result;
}
