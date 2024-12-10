# Build and run instructions

These are the instructions to build the Greedy + Local Search + GRASP + Instance generator program.
The program is a cmake project with no dependencies apart from make and cmake.

To build the program simply call:

```bash
./compile.sh generate
./compile.sh build
```

To run the program just execute the binary.

```bash
./build/ammm <ExecutionMode>
```

The program expects a series of arguments, if no argument is provided the program gives a helping message.

# OPL
The opl code for the integer linear programming is in olp directory.

# Dat files

The original dat files are in directory dat, in directory custom_dat there is a generated collection of bigger problems using the instance generator provided.
