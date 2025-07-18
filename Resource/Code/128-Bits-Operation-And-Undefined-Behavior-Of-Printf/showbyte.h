#include <inttypes.h>
#include <stdio.h>

#ifndef SHOWBYTE_H_
#define SHOWBYTE_H_

typedef unsigned __int128 uint128_t;

static void showBytes(unsigned char *start, size_t len) //
/* The char pointer should be unsigned.*/
{
  unsigned long i = 0;
  for (i = 0; i < len; i++) {
    printf("%.2x ", start[i]);
  }
}

static void showInt(int *ptr_int) {
  printf("Integer: 0x%x starts in address: %p. ", *ptr_int, (void *)ptr_int);
  printf("In bytes: ");
  showBytes((unsigned char *)ptr_int, sizeof(int));
  printf("\n");
}

static void showUnsignedInt(unsigned int *ptr_unsigned_int) {
  printf("Unsigned int: 0x%x starts in address: %p. ", *ptr_unsigned_int,
         (void *)ptr_unsigned_int);
  printf("In bytes: ");
  showBytes((unsigned char *)ptr_unsigned_int, sizeof(unsigned int));
  printf("\n");
}

static void showFloat(float *ptr_float) {
  printf("Float: %f starts in address: %p. ", *ptr_float, ptr_float);
  printf("In bytes: ");
  showBytes((unsigned char *)ptr_float, sizeof(float));
  printf("\n");
}

static void showPtr(unsigned char *ptr) {
  printf("Pointer value %p starts in address: %p. ", ptr, &ptr);
  printf("In bytes: ");
  showBytes((unsigned char *)&ptr, sizeof(void *));
  printf("\n");
}

static void showLong(long *ptr_long) {
  printf("Long: %ld starts in address: %p. ", *ptr_long, ptr_long);
  printf("In bytes: ");
  showBytes((unsigned char *)ptr_long, sizeof(long));
  printf("\n");
}

static void showOct(uint128_t *ptr_128) {
  uint128_t value = *ptr_128;
  uint64_t high = (uint64_t)(value >> 64);
  uint64_t low = (uint64_t)(value & 0xFFFFFFFFFFFFFFFF);
  printf("Oct Number: 0x%016" PRIx64 "%016" PRIx64 " starts in address: %p. ",
         high, low, (void *)ptr_128);
  printf("\nIn bytes: ");
  showBytes((unsigned char *)ptr_128, sizeof(uint128_t));
  printf("\n");
}

static void showOct_Buggy(uint128_t *ptr_128) {
  printf("\n--------------BUGGY OUTPUT--------------\n");
  printf("Oct Number: %ld starts in address: %p. ", *ptr_128, (void *)ptr_128);
  printf("In bytes: ");
  showBytes((unsigned char *)ptr_128, sizeof(uint128_t));
  printf("\n");
}

#endif