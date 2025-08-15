#include "showbyte.h"
#include <stdio.h>

void promotion_examples() {
  printf("\n--- Type Promotion Examples ---\n");
  unsigned char c1 = 0x7F;
  unsigned char c2 = 0x81;
  char c3 = 0x7F;
  char c4 = 0x81;

  int int_sum_c1c2 = c1 + c2;
  unsigned char unsigned_char_sum_c1c2 = c1 + c2;
  printf("c1 + c2 as int: %d\n", int_sum_c1c2);
  printf("c1 + c2 as char: %d\n", unsigned_char_sum_c1c2);

  printf("c3 + c4 as int: %d\n", c3 + c4);
  printf("c3 + c4 as char: %c\n", c3 + c4);
}

void comparison_examples() {
  char c = -1;            // 0xFF
  unsigned char uc = 255; // 0xFF

  printf("\n--- Comparison Examples ---\n");

  // Without promotion, these would be equal (both 0xFF)
  // With promotion: c becomes int -1 (0xFFFFFFFF), uc becomes int 255
  // (0x000000FF)
  if (c == uc) {
    printf("c equals uc (shouldn't happen with promotion)\n");
  } else {
    printf("c doesn't equal uc (expected with promotion)\n");
  }

  // This demonstrates sign extension during promotion
  if (c < 0) {
    printf("c is negative after promotion (expected)\n");
  }

  if (uc < 0) {
    printf("uc is negative after promotion (shouldn't happen)\n");
  } else {
    printf("uc is positive after promotion (expected)\n");
  }
}

unsigned long optimization(int a, short b, long *u, char *v) {
  *u += a;
  *v += b;
  return sizeof(a) + sizeof(b);
}

void optimization_example() {
  printf("\n--- Optimization Examples ---\n");

  int a = 3;
  short b = 255 + 2;
  long u = 1;
  char v = 1;

  unsigned long result = optimization(a, b, &u, &v);

  showChar(&v);
}

int main() {
  promotion_examples();
  comparison_examples();
  optimization_example();
}