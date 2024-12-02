#pragma once
#include <vector>
#include <string>
using namespace std;

struct GeneratorOpts {
  int N;
  int D;
};

struct Input {
  vector<vector<float>> m;
  vector<int>           d;
  vector<int>           n;
  bool                  errored;

  Input();
  inline int N() const { return d.size(); }
  inline int D() const { return n.size(); }

  int  generate(GeneratorOpts);
  void clear();
  int  read(const string& file);
  void save();
  void print();
  bool valid();


  static Input generateInput();
};
