#include "visit.hpp"

bool compatible(std::vector<std::vector<float>>& compat, std::vector<int>& comission, int node) {
  for (int u : comission)
    if (compat[u][node] <= 0.0f) return false;
  return true;
}

int visit(std::vector<int>& visitCounter, std::vector<int>& isVisited, std::vector<std::vector<float>>& compat, int node, std::vector<int>& comission, int depth) {
  int comissionSize = comission.size();
  if (isVisited[node]) return comissionSize;
  if (!compatible(compat, comission, node)) return comissionSize;

  if (depth > 0) {
    isVisited[node] = 1;
    comission.push_back(node);

    for (int u = 0; u < compat.size(); u++) {
      comissionSize = std::max(visit(visitCounter, isVisited, compat, u, comission, depth - 1), comissionSize);
    }
    comission.pop_back();
    isVisited[node] = 0;
  } else {
    isVisited[node] = 1;
    comission.push_back(node);

    for (int u = 0; u < compat.size(); u++) {
      comissionSize = std::max(visit(visitCounter, isVisited, compat, u, comission, depth - 1), comissionSize);
    }
  }
  return comissionSize;
}

std::vector<int> generateVisitVector(std::vector<std::vector<float>>& compatMatrix, const std::vector<int>& c) {
  std::vector<int> visited(compatMatrix.size());

  std::vector<int> isVisited(compatMatrix.size());

  for (int i = 0; i < c.size(); i++) {
    isVisited[c[i]] = 1;
  }

  for (int i = 0; i < compatMatrix.size(); i++) {
    std::vector<int> comission_copy = c;
    std::vector<int> isVisited_copy = isVisited;

    visited[i] = visit(visited, isVisited_copy, compatMatrix, i, comission_copy, 6);
  }

  return visited;
}
