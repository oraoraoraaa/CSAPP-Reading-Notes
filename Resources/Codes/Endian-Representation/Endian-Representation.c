#include <stdio.h>

void showBytes(unsigned char *start, size_t len) //
/* The char pointer should be unsigned.*/
/* The code shows what happens by passing the int value to the signed version of showBytes. */
{
    unsigned long i = 0;
    for (i = 0; i < len; i++)
    {
        printf("%.2x ", start[i]);
        /* .2 in %.2x sets MINIMUM display width, padding with 0 if necessary. */
        /*  But it DOES NOT set the largest width. */
    }
    printf("\n");
}

void showBytesSigned(char *start, size_t len)
{
    unsigned long i = 0;
    for (i = 0; i < len; i++)
    {
        printf("%.2x ", start[i]);
        /* printf promotes every element smaller than int size to int size. */
        /* The integer promotion uses signed extension of course, which does a arithmetic left shift. */
        /* If passed 0x80 which is 0b10000000, the printf would promote it to 0xffffff80. */
    }
    printf("\nWhy does this happen? \n");
}

void showInt(int *ptr_int)
{
    printf("-----------INTEGER-----------\n");
    printf("Integer: 0x%x starts in address: %p\n", *ptr_int, (void *)ptr_int);
    /* The %p expects a void pointer. Good practice to explicitly convert to void * before passing. */
    printf("In bytes: ");
    showBytes((unsigned char *)ptr_int, sizeof(int));
    printf("-----------END OF INTEGER-----------\n\n");
}

void showIntSigned(int *ptr_int)
{
    printf("-----------INTEGER (Passed as signed char *)-----------\n");
    printf("Integer: 0x%x starts in address: %p\n", *ptr_int, (void *)ptr_int);
    printf("In bytes: ");
    showBytesSigned((char *)ptr_int, sizeof(int));
    printf("-----------END OF INTEGER (Passed as signed char *)-----------\n\n");
}

void showFloat(float *ptr_float)
{
    printf("-----------FLOAT-----------\n");
    printf("Float: %f starts in address: %p\n", *ptr_float, ptr_float);
    printf("In bytes: ");
    showBytes((unsigned char *)ptr_float, sizeof(float));
    printf("-----------END OF FLOAT-----------\n\n");
}

void showPtr(unsigned char *ptr)
{
    printf("-----------POINTER-----------\n");
    printf("Pointer value %p starts in address: %p\n", ptr, &ptr);
    printf("In bytes: ");
    showBytes((unsigned char *)&ptr, sizeof(void *));
    printf("-----------END OF POINTER-----------\n\n");
}

int main()
{
    int a = 0x80123456;
    showInt(&a);
    showIntSigned(&a);

    float b = 3510593.0;
    float *ptr_b = &b;
    showFloat(ptr_b);

    showPtr((unsigned char *)&a);
}