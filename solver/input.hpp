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
  std::string           name;

  Input();
  inline int N() const { return d.size(); }
  inline int D() const { return n.size(); }

  int  generate(GeneratorOpts);
  void clear();
  int  read(const string& file);
  void save();
  void print();
  bool valid();


  bool  compatibleMemmber(const std::vector<int>& comission, int newMember) const;
  bool  validCompatibility(const std::vector<int>& comission) const;
  bool  validDepartment(const std::vector<int>& comission) const;
  bool  validMediation(const std::vector<int>& comission) const;
  bool  valid(const std::vector<int>& comission) const;
  float score(const std::vector<int>& comission) const;


  static Input generateInput();
};

float score(const Input& input, const std::vector<int>& comission);
bool  valid(const Input& input, const std::vector<int>& comission);
