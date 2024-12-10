#include <cstdlib>
#include "input.hpp"
#include "solver.hpp"
#include <time.h>
#include "util.hpp"
#include <cassert>
#include <fstream>
#include "test.hpp"
#include <chrono>

int generate(int argc, char** argv) {
  Input         input;
  GeneratorOpts opts;

  if (argc < 4) {
    std::cout << "Not enough arguments\n";
    return 1;
  }

  opts.N = std::atoi(argv[2]);
  opts.D = std::atoi(argv[3]);

  int iterations = 0;
  do {
    input.generate(opts);
    iterations++;
  } while (!input.valid());
  input.save();

  std::cout << "Iterations: " << iterations << "\n";

  return 0;
}

int solve(int argc, char** argv) {
  Input input;

  if (argc < 3) {
    std::cout << "Not enough arguments: expected <P>\n";
    return 1;
  }

  int i = 2;
  while (argv[i]) {
    input.clear();
    if (input.read(std::string(argv[i]))) {
      std::cout << "Error reading input file\n";
      return 1;
    }
    input.print();

    auto solution = solve(0.0f, input);

    if (solution.comission.size()) {
      printf("Comission = ");
      printVector(solution.comission);
      printf("\nScore = %f\n", input.score(solution.comission));
      printf("\nValid = %d\n", input.valid(solution.comission));
    } else {
      printf("No solution found.");
    }

    i++;
  }
  return 0;
}

int solveGRASP_(int argc, char** argv) {
  Input input;

  if (argc < 5) {
    std::cout << "Not enough arguments: expected <P> <I> <A> [<CSV>]\n";
    return 1;
  }

  input.clear();
  if (input.read(std::string(argv[2]))) {
    std::cout << "Error reading input file\n";
    return 1;
  }
  int   num_iterations = std::atoi(argv[3]);
  float alpha          = std::atof(argv[4]);
  assert(0 <= alpha && alpha <= 1);
  assert(num_iterations >= 1);

  //input.print();

  SolverSolution solution;
  if (argc == 5) {
    solution = solveGRASP(num_iterations, alpha, input);
  } else {
    std::string path = argv[5];
    std::ofstream csv(path, std::ios::app);
    solution = solveGRASP(num_iterations, alpha, input, &csv);
  }

  if (solution.comission.size()) {
    printf("Comission = ");
    printVector(solution.comission);
    printf("\nScore = %f\n", input.score(solution.comission));
    printf("\nValid = %d\n", input.valid(solution.comission));
  } else {
    printf("No solution found.");
  }

  return 0;
}

int main(int argc, char** argv) {

  srand(time(0));
  if (argc < 2) {
    std::cout << "You need to provide an operation to execute.\n";
    std::cout << "1) Generate a random problem of size <N> <D>\n";
    std::cout << "2) Solve problem <P> using local search\n";
    std::cout << "3) Solve problem <P> using GRASP with <I> iterations and alpha <A>, dump results at <CSV> if given\n";
    std::cout << "4) Test a set of instances, save tha data to the provided filename <O>\n";
    return 1;
  }

  int option = std::atoi(argv[1]);
  if (option == 1) return generate(argc, argv);
  if (option == 2) return solve(argc, argv);
  if (option == 3) return solveGRASP_(argc, argv);
  if (option == 4) return test(argc, argv);
}
