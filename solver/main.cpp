#include <cstdlib>
#include <iostream>
#include "input.hpp"
#include "state.hpp"
#include <cstdio>

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

  if (input.read(std::string(argv[2]))) {
    dprintf(2, "Error reading input file\n");
    return 1;
  }
  input.print();

  State state(input);
  state.greedyRandom(1.0);
  return 0;
}

int main(int argc, char** argv) {

  srand(time(0));
  if (argc < 2) {
    dprintf(2, "You need to provide an operation to execute.\n");
    dprintf(2, "1) Generate a random problem of size <N> <D>\n");
    dprintf(2, "2) Solve problem <P> with algorithm <A>\n");
    return 1;
  }

  int option = std::atoi(argv[1]);
  if (option == 1) return generate(argc, argv);
  if (option == 2) return solve(argc, argv);
}
