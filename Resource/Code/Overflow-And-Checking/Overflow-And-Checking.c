#include <stdio.h>

/* Detect overflow for unsigned addition */
void overflow_check_unsigned(unsigned int x, unsigned int y) {
  unsigned int sum = x + y;
  if (sum < x) {
    /* Equivalent if the condition is sum < y. */
    printf("%u + %u = %u, result OVERFLOWED!\n", x, y, sum);
  } else {
    printf("%u + %u = %u, normal addition.\n", x, y, sum);
  }
}

/* Negation version only needs to check if x > y, thus omitted. */

/* Detect overflow for two's complement addition */
void overflow_check_signed(int x, int y) {
  int sum = x + y;
  if (x > 0 && y > 0 && sum <= 0) {
    /* Don't miss the equal sign when comparing sum with 0 */
    printf("%d + %d = %d, positive OVERFLOWED!\n", x, y, sum);
  } else if (x < 0 && y < 0 && sum >= 0) {
    printf("%d + %d = %d, negative OVERFLOWED!\n", x, y, sum);
  } else {
    printf("%d + %d = %d, normal addition.\n", x, y, sum);
  }
}

void overflow_check_signed_negation(int x, int y) {
  if (y == 0x80000000) {
    /* If y == INT_MIN is not specialized, the code will output wrong result. */
    int diff = x - y;
    if (x >= 0) {
      printf("%d - %d = %d, positive OVERFLOWED!\n", x, y, diff);
    } else {
      printf("%d - %d = %d, normal addition.\n", x, y, diff);
    }
  } else {
    overflow_check_signed(x, -y);
  }
}

int main() {
  printf("\n---------------Unsigned Int Addition---------------\n");
  overflow_check_unsigned(0xFFFFFFFE, 0x1);
  overflow_check_unsigned(0xFFFFFFFE, 0x2);
  overflow_check_unsigned(10, 0xFFFFFFFF);
  printf("Note that even x + INT_MAX is smaller than x.\n");

  printf("\n---------------Signed Int Addition---------------\n");
  overflow_check_signed(0x7FFFFFFF, 0x2);
  overflow_check_signed(0x80000000, 0xFFFFFFFF);
  overflow_check_signed(0x80000000, 0x80000000);

  printf("\n---------------Signed Int Negation---------------\n");
  overflow_check_signed_negation(-3, 0x80000000);
  overflow_check_signed_negation(0, 0x80000000);
  overflow_check_signed_negation(2, 7);
}
