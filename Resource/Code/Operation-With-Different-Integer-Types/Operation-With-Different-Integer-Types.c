#include "showbyte.h"
#include <stdio.h>

int main() {
  int x = 2;
  int y = -4;
  unsigned ux = (unsigned)x;
  unsigned uy = (unsigned)y;

  int add_signed = x + y;
  int add_combined = (int)(x + uy);
  int mult_signed = x * y;
  unsigned int mult_combined = ux * y;

  printf("-----------Print Value-----------\n");
  printf("x = %d, y = %d, ux = %u, uy = %u\n", x, y, ux, uy);
  printf("x + y = %d, x + uy = %d, x * y = %d, ux * y = %u\n", add_signed,
         add_combined, mult_signed, mult_combined);

  printf("\n-----------Print Byte-----------\n");
  printf("x >>>>");
  showInt(&x);
  printf("y >>>>");
  showInt(&y);

  printf("ux >>>>");
  showUnsignedInt(&ux);
  printf("uy >>>>");
  showUnsignedInt(&uy);

  printf("\n");

  printf("x + y >>>>");
  showInt(&add_signed);
  printf("x + uy >>>>");
  showInt(&add_combined);
  printf("x * y >>>>");
  showInt(&mult_signed);
  printf("ux * y >>>>");
  showUnsignedInt(&mult_combined);
}
