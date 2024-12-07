#include "parser.hpp"
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

static std::string trim(const std::string& str) {
  size_t first = str.find_first_not_of(' ');
  size_t last  = str.find_last_not_of(' ');
  return str.substr(first, (last - first + 1));
}

std::string toString(const Input& data) {
  std::ostringstream oss;

  // Serialize D
  oss << "D = " << data.D() << ";" << std::endl;

  // Serialize n (vector)
  oss << "n = [";
  for (size_t i = 0; i < data.n.size(); ++i) {
    oss << " " << data.n[i];
  }
  oss << " ];" << std::endl;

  // Serialize N
  oss << "N = " << data.N() << ";" << std::endl;

  // Serialize d (vector)
  oss << "d = [";
  for (size_t i = 0; i < data.d.size(); ++i) {
    oss << " " << data.d[i] + 1;
  }
  oss << " ];" << std::endl;

  // Serialize m (matrix)
  oss << "m = [" << std::endl;
  for (const auto& row : data.m) {
    oss << "    [";
    for (size_t i = 0; i < row.size(); ++i) {
      oss << " " << row[i];
    }
    oss << " ]" << std::endl;
  }
  oss << "];" << std::endl;

  return oss.str();
}

Input fromString(const string& input) {
  Input              data;
  std::istringstream iss(input);
  std::string        line;
  int                D;
  int                N;

  while (std::getline(iss, line)) {
    if (line.empty()) continue;
    line = trim(line);

    if (line.empty() || line == "m = [") {
      continue;
    }

    // Parsing D
    if (line.find("D =") != std::string::npos) {
      std::istringstream(line.substr(line.find('=') + 1)) >> D;
    }
    // Parsing N
    else if (line.find("N =") != std::string::npos) {
      std::istringstream(line.substr(line.find('=') + 1)) >> N;
    }
    // Parsing n (vector)
    else if (line.find("n =") != std::string::npos) {
      std::istringstream vectorStream(line.substr(line.find('[') + 1));
      int                value;
      while (vectorStream >> value) {
        data.n.push_back(value);
      }
    }
    // Parsing d (vector)
    else if (line.find("d =") != std::string::npos) {
      std::istringstream vectorStream(line.substr(line.find('[') + 1));
      int                value;
      while (vectorStream >> value) {
        data.d.push_back(value - 1);
      }
    }
    // Parsing m (matrix)
    else if (line.find('[') != std::string::npos &&
             line.find(']') != std::string::npos) {
      std::istringstream matrixStream(line.substr(line.find('[') + 1));
      std::vector<float> row;
      double             value;
      while (matrixStream >> value) {
        row.push_back(value);
      }
      data.m.push_back(row);
    }
  }

  if (data.N() != N) {
    std::cout << "[PARSER] Mismatch N : real "<< data.N() <<", theoretical "<< N <<"\n";
    Input error;
    error.errored = true;
    return error;
  }

  if (data.D() != D) {
    std::cout << "[PARSER] Mismatch D : real "<< data.D() <<", theoretical "<< D <<"\n";
    Input error;
    error.errored = true;
    return error;
  }

  return data;
}
