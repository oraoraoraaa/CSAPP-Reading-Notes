#include <stdio.h>

int main()
{
    int a = 0;
    int b = 5;
    printf("%d\n", (a && (b / a))); /* If b/a is calculated, the program would exit with error. */
    printf("%d\n", (b || (b / a)));

    /* Uncomment the following line to see the difference. */
    // int c = b / a;
}