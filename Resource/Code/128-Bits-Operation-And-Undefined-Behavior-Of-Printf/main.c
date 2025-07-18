#include "showbyte.h"
#include <inttypes.h>
#include <stdio.h>

typedef unsigned __int128 uint128_t;

void store_mult128(uint128_t *dest, uint64_t x, uint64_t y) {
  *dest = x * (uint128_t)y;
}

void div(long x, long y, long *ptr_quotient, long *ptr_remainder) {
  *ptr_quotient = x / y;
  *ptr_remainder = x % y;
}

int main() {
  /* Multiplication (Smaller set of value) */
  uint64_t x1 = 4;
  uint64_t y1 = 4;
  uint128_t dest1 = 0;
  store_mult128(&dest1, x1, y1);

  /* Multiplication (Larger set of value) */
  uint64_t x2 = 0xFFFFFFFFFFFFFFFF;
  uint64_t y2 = 16 * 16;
  uint128_t dest2 = 0;
  store_mult128(&dest2, x2, y2);

  showOct_Buggy(&dest1);
  showOct_Buggy(&dest2);

  /* printf Undefined Behavior */
  long a = 0x0000000100000000;
  int b = 0xFFFFFFFF;
  printf("\na = %d, b = %d\n", a, b);

  /* Division */
  long x3 = 0x0FFFFFFFFFFFFFF0;
  long y3 = 16;
  long q = 0;
  long r = 0;
  div(x3, y3, &q, &r);

  printf("\nQuotient------------\n");
  showLong(&q);
  printf("\nRemainder------------\n");
  showLong(&r);
}