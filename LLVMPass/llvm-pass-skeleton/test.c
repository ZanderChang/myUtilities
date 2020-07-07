#include <stdio.h>
#include <string.h>

void a()
{
    int aa = 12;
    if (aa > 13)
    {
        printf("A\n");
    }
    else
    {
        printf("A-\n");
    }
    
    aa = 14;
    int bb = 90;
    if (bb > aa)
    {
        printf("B\n");
    }
    else
    {
        printf("B-\n");
    }
    

    int num = 2;
    switch (num + 2)
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

const char str1[] = "abcd", str2[] = "abCd";

int main()
{
    int m = 0;
    if (m > -1)
    {
        a();
    }

    int result;
    char str[50];

    gets(str);

    // comparing strings str1 and str2
    result = strcmp(str, str1);
    if (result == 0)
    {
        printf("EQ\n");
    }
    else
    {
        printf("NEQ\n", str, str1, result);
    }
    
    

    // comparing strings str1 and str3
    // result = strcmp(str, str2);
    // printf("strcmp(%s, %s) = %d\n", str, str2, result);

    return 0;
}
