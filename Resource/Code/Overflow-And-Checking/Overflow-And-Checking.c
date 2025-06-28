#include <stdio.h>

/* Detect overflow for unsigned addition */
void overflowCheckUnsigned(unsigned int x, unsigned int y)
{
    unsigned int sum = x + y;
    if (sum < x)
    {
        /* Equivalent if the condition is sum < y. */
        printf("%u + %u = %u, result OVERFLOWED!\n", x, y, sum);
    }
    else
    {
        printf("%u + %u = %u, normal addition.\n", x, y, sum);
    }
}

int main()
{
    /* Detect overflow for unsigned addition */
    overflowCheckUnsigned(0xFFFFFFFE, 0x1);
    overflowCheckUnsigned(0xFFFFFFFE, 0x2);
    overflowCheckUnsigned(10, 0xFFFFFFFF);
}
