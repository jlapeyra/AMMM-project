#include "test.hpp"
#include "solver.hpp"
#include <fstream>
#include <iostream>
#include <string>
#include <thread>
#include <future>
#include <chrono>
#include <vector>

std::vector<Progress> timeoutSolveGRASP(int timeout_seconds, int num_iterations, float alpha, Input& input) {
  std::vector<Progress> history; // History vector to store intermediate results

  // Packaged task for the computation
  std::packaged_task<void()> task([&]() {
    solveGRASP(num_iterations, alpha, input, history);
  });
  std::future<void>          future = task.get_future();
  std::thread                task_thread(std::move(task));

  if (future.wait_for(std::chrono::seconds(timeout_seconds)) == std::future_status::ready) {
    // Completed within timeout
    task_thread.join(); // Clean up thread
  } else {
    // Timed out
    task_thread.detach(); // Detach thread to let it finish in the background
    std::cerr << "Solver timed out. Returning partially updated history.\n";
  }

  return history; // Return the current state of history
}


const int NUM_ITERATIONS = 10;
const int TIMEOUT        = 120;

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
      int                   num_iterations    = alpha == 0 ? 1 : NUM_ITERATIONS;
      std::vector<Progress> iteration_results = timeoutSolveGRASP(TIMEOUT, num_iterations, alpha, input);
      for (int it = 1; it <= num_iterations; it++) {
        os << path_instance << "," << alpha << "," << it << ",";
        int idx = it - 1;
        if (idx < iteration_results.size()) {
          Progress result = iteration_results[idx];
          os << result.best_fitness << "," << result.time_seconds << "\n";
        } else {
          os << "NA,TO\n";
        }
      }
      os.flush();
    }
  }
  os.close();


  return 0;
}
