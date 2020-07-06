#include <stdio.h>

void a()
{
    int aa = 12;
    if (aa > 13) {
        printf("A\n");
    }
    aa = 14;
    int bb = 90;
    if (bb > aa)
    {
	printf("B\n");
    }

    int num=2;
    switch(num+2)
    {
        case 1:
          printf("Case1: Value is: %d\n", num);
        case 2:
          printf("Case2: Value is: %d\n", num);
        case 3:
          printf("Case3: Value is: %d\n", num);
        default:
          printf("Default: Value is: %d\n", num);
    }
}


int main()
{
    int m = 0;
    if (m > -1)
    {   
        a();
    }
    printf("HH\n");
    return 0;
}

