#include <stdio.h>
#include <stdlib.h>

int main()
{
    char numeral = '#';
    int contador = 1;

    printf("\nPresentaremos el  Ciclo While \n");
    sleep(2);

    while(contador <=5){
        printf("%c\n",numeral);
        contador++;
    }

    printf("\n Fin del Ciclo While");


    printf("\nPresentaremos el  Ciclo FOR\n");
    sleep(2);
    int x, y, z, i;

    x = 0;
    y = 1;

    for (i=1; i<=9; i++)
    {
        z = x+y;
        printf("%d\n",z);
        x = y;
        y = z;
    }

    printf("\n Fin del Ciclo FOR");

    printf("\nPresentaremos el  Ciclo Do While \n");
    sleep(1);
    char respuesta;
    char value = 'a';
    do{
        printf("Ingresa una letra diferente a la letra a por favor: ");
        scanf("\n%c", &respuesta);

        //separar la comilla del porcentaje  "  %c"  de esta forma, sino imprime doble  ingresa una letra
    }while(value != respuesta);

  printf("\n Fin del Ciclo Dowhile");

    return 0;
}
