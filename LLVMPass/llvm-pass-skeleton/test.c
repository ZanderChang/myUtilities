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

