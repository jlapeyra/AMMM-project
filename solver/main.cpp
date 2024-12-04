#include <cstdlib>
#include "input.hpp"
#include "solver.hpp"
#include <time.h>
#include "util.hpp"

int generate(int argc, char** argv) {
  Input         input;
  GeneratorOpts opts;

  if (argc < 4) {
    dprintf(2, "Not enough arguments\n");
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

  dprintf(2, "Iterations: %d\n", iterations);

  return 0;
}

int solve(int argc, char** argv) {
  Input input;

  if (argc < 3) {
    dprintf(2, "Not enough arguments\n");
    return 1;
  }

  int i = 2;
  while (argv[i]) {
    input.clear();
    if (input.read(std::string(argv[i]))) {
      dprintf(2, "Error reading input file\n");
      return 1;
    }
    input.print();

    auto solution = solve(1.0f, input);

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

int main(int argc, char** argv) {

  srand(time(0));
  if (argc < 2) {
    dprintf(2, "You need to provide an operation to execute.\n");
    dprintf(2, "1) Generate a random problem of size <N> <D>\n");
    dprintf(2, "2) Solve problem <P>\n");
    return 1;
  }

  int option = std::atoi(argv[1]);
  if (option == 1) return generate(argc, argv);
  if (option == 2) return solve(argc, argv);
}
