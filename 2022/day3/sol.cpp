#include <iostream>
#include <set>
#include <fstream>
#include <algorithm>
#include <iterator>

int sol1() {
  std::ifstream cif("input.txt");

  std::string s;
  int sum = 0;
  while (cif >> s) {
    int mid = s.size() / 2;
    std::set<char> s1, s2;
    for (int i = 0; i < mid; ++i) {
      s1.insert(s[i]);
      s2.insert(s[s.size() - i - 1]);
    }

    std::vector<char> intersections;
    std::set_intersection(s1.begin(), s1.end(),
                          s2.begin(), s2.end(), 
                          std::back_inserter(intersections));

    char inter = intersections[0];


    if (inter >= 97 && inter <= 122) {
      sum += inter - 97 + 1;
    } else {
      sum += inter - 65 + 27;
    }
  }
  std::cout << sum << std::endl;

  return 0;
}

int sol2() {
  std::ifstream cif("input.txt");

  std::string s1, s2, s3;
  int sum = 0;
  while (cif >> s1 >> s2 >> s3) {
    std::set<char> se1, se2, se3;

    for (auto &c : s1) {
      se1.insert(c);
    }
    for (auto &c : s2) {
      se2.insert(c);
    }
    for (auto &c : s3) {
      se3.insert(c);
    }

    std::set<char> intersections;
    std::set_intersection(se1.begin(), se1.end(),
                          se2.begin(), se2.end(), 
                          std::inserter(intersections, intersections.begin()));
    std::set<char> i2;
    std::set_intersection(intersections.begin(), intersections.end(),
                          se3.begin(), se3.end(),
                          std::inserter(i2, i2.begin()));

    char inter = *(i2.begin());

    if (inter >= 97 && inter <= 122) {
      sum += inter - 97 + 1;
    } else {
      sum += inter - 65 + 27;
    }
  }
  std::cout << sum << std::endl;

  return 0;
}

int main() {
  sol1();
  sol2();
}
