#include <stdio.h>
#include <time.h>

time_t begin, end;

int main()
{
    long i;
    begin = time(NULL);
    for (i = 0; i < 600000000; i++);
    end = time(NULL);
    printf("El tiempo que duro nuestro for es: %f \n", difftime(end, begin));
    return 0;
}