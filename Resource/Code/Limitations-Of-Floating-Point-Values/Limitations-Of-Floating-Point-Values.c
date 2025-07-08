#include "showbyte.h"
#include <stdio.h>

int main() {
  printf("------------Smallest Unexpressible Integer------------\n");
  float base = 16777215.0;
  float a = 16777216.0;
  float b = 16777217.0;
  float c = 16777218.0;
  float d = 16777219.0;
  float e = 16777220.0;
  showFloat(&base); /* Normally expressed (...1111) */
  showFloat(&a);    /* Normally expressed (...0000) */
  showFloat(&b);    /* Round even (...0000 1) to 16777216 */
  showFloat(&c);    /* Normally expressed (...0001) */
  showFloat(&d);    /* Round even (...0001 1) to 16777220 */
  showFloat(&e);    /* Normally expressed (...0010) */

  printf("\n------------Precision Loss------------\n");
  float alpha = 1e10;
  /* 1e10 in binary (34 bits): 10 0101 0100 0000 1011 1110 0100 0000 0000 */
  /* 1.0 0101 0100 0000 1011 1110 0100 0000 0000 * 2^33 */
  /* Fraction (23 bits without leading 1): 1.0 0101 0100 0000 1011 1110 01
   * (Loss: 00 0000 0000) */
  /* Exponent (E1): 33 */
  float beta = 1e10 + 3.14;
  /* 3.14 in hex: 3.2[3D70A] (i.e. 11.xxxxxxxx...) */
  /* Exponent (E2) after normalized: 1 */
  /* Align the decimal point (shift decimal point left E1 - E2 = 32 bits) */
  /* 0.000 0000 0000 0000 0000 0000 0000 0000 11xxxxxxxx... */
  /* Only 23 bits after leading 1 will be added, i.e. all zeros */
  /* beta didn't change */
  float theta = beta - alpha;
  showFloat(&alpha);
  showFloat(&beta);
  showFloat(&theta);

  printf("\n------------Float-Int Conversion------------\n");
  int x = 0x7FFFFFFD;
  /* 2,147,483,645 */
  /* 0111 1111 1111 1111 1111 1111 1111 1101 */
  /*  1.11 1111 1111 1111 1111 1111 1111 1101 * 2^30 */
  float y = (float)x;
  /* Fraction (23 bits without leading 1): 1.111 1111 1111 1111 1111 1111 (Loss:
   * 1111 1101) */
  /* Round UP: 10.000 0000 0000 0000 0000 0000 */
  /* Exponent (E) = 30 + 1 = 31 */
  /* Value: 2^31 = 2,147,483,648 */
  int z = (int)y;
  /* Trying to store value = 2,147,483,648 to int z */
  /* Yields overflow, do saturating to TMax32 = 2,147,483,647 */
  showInt(&x);
  showFloat(&y);
  showInt(&z);
}
