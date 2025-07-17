#include <stdio.h>

long zero(long x) {
  x = 0;
  return x;
}

int main() {
  long result = zero(1);
  printf("%ld", result);
}