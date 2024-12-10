#include "test.hpp"
#include "solver.hpp"
#include "timeout.hpp"
#include <fstream>
#include <iostream>
#include <string>
#include <thread>
#include <future>
#include <chrono>
#include <vector>

const int NUM_ITERATIONS = 10;
const int TIMEOUT        = 60;

int test(int argc, char** argv) {

  if (argc < 3) {
    std::cout << "Not enough arguments: expected <output_file> <instance_file>*\n";
    return 1;
  }

  std::ofstream os(std::string(argv[2]), std::ios::app);
  os << "instance,alpha,num_iterations,score,time\n";

  for (int j = 3; j < argc; ++j) {
    std::string path_instance = std::string(argv[j]);
    Input       input;
    input.read(path_instance);
    for (float alpha = 0; alpha <= 1; alpha += 0.2) {
      std::cout  << "\n\n\nInstance: " << path_instance << "\nAlpha = " << alpha << "\n";
      int num_iterations = alpha == 0 ? 1 : NUM_ITERATIONS;
      setTimeout(TIMEOUT);
      solveGRASP(num_iterations, alpha, input, &os);
      os.flush();
    }
  }
  os.close();


  return 0;
}
