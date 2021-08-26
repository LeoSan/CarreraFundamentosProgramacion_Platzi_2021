#include <stdio.h>
#include <stdlib.h>
#include "operaciones.h"

int main()
{
    printf("Librerias !\n");
    printf("Calculadora \n");

    int numA, numB, result, option;
    char resp = 's';

    do{
        printf("Elige una opcion: \n");
        printf("1 - Suma \n");
        printf("2 - Resta \n");
        printf("3 - Multiplicacion \n");
        printf("4 - Division \n");

        scanf("%i", &option);

        printf("Ingrese el primer numero: \n");
        scanf("%i", &numA);

        printf("Ingrese el segundo numero: \n");
        scanf("%i", &numB);

        sleep(2);
        switch(option)
        {
        case 1:
            system("Color 57");
            result = suma(numA, numB);
            break;
        case 2:
            system("Color 75");
            result = resta(numA, numB);
            break;
        case 3:
            system("Color 15");
            result = multiplicacion(numA, numB);
            break;
        case 4:
            system("Color 25");
            result = division(numA, numB);
            break;
        }

         printf("El resultado es: %i \n", result);
         printf(" \n Deseas continiar con el programa si =s, no =n \n");
         scanf("%s", &resp);
         system("clear");
    }while(resp == 's');

         printf(" \n ****A DIOS -.- ****** \n");
         sleep(2);
         system("clear");

    return 0;

}
