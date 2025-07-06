#ifndef SHOWBYTE_H_
#define SHOWBYTE_H_

#include <stdio.h>

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

#endif