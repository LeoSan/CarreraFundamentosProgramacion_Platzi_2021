#include <stdio.h>
#include <string.h>

char string1[60];
char string2[60];

int main()
{
    

    printf("Escribe una frase\n");
    gets(string1);
    printf("Escribe otra frase para comparar\n");
    gets(string2);
    
    if (strcmp(string1, string2) == 0)
        printf("Ingresaste dos strings identicos\n");
    else
    {
        strcat(string1, string2);
        printf("Ingresaste dos cosas distintas, si las unimos el resultado es> %s\n", string1);

    }    
    
    
    return 0;
}