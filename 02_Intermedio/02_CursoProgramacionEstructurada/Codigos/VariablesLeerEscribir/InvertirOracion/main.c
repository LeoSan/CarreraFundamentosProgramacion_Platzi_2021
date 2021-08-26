#include<stdio.h>

int main()
{
    printf("Invertir valores de un arreglo.\n\n");

    int tam, temp, i;

    printf("Tamaño del arreglo: ");
    scanf("%d", &tam);

    int elementos[tam];

    printf("Ingresa los valores:\n");

    for( i = 0; i < tam; i++)
    {
        printf("Valor[%d]: ", i);
        scanf("%d", &elementos[i]);
    }

    for(i = 0; i < tam / 2; i++)
    {
        temp = elementos[i];
        elementos[i] = elementos[tam - 1 - i];
        elementos[tam - 1 - i] = temp;
    }

    printf("\nValores invertidos:\n");

    for( i = 0; i < tam; i++)
    {
        printf("elemento[%d]: %d\n", i, elementos[i]);
    }
    printf("\n");

    return 0;
}
