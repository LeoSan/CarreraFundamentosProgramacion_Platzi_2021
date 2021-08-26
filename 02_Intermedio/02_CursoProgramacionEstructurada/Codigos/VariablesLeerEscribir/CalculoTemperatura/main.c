#include <stdio.h>
#include <stdlib.h>

// (32 °F − 32) × 5 / 9 = 0 °C
// (0 °C × 9 / 5) + 32 = 32 °F

int main()
{

    system("color 74");
    float fahranheit;
    float celsius;

    printf("Usuario, Podra transformar Fafrenheit a  Celsius ingrese los valores?\n");
    printf("Ingrese el Fahranheit ?: ");
    scanf("%f", &fahranheit);

    printf("\n Calculando ... \n");
    sleep(2);
    celsius = (fahranheit - 32)*5/9;

    printf("\nLa Temperatura a celsius es: %5.2f", celsius);
    printf("\nGracias por usar este programa");


    printf("\nReto 1\n");

    int valor = 10;

    valor += 2*valor;

    printf("\nEl valor es: %i\n", valor);


     printf("\nReto 2\n");


    printf("\nIngresa un numero entero:\n");
    scanf("%i", & valor);

    valor %=5;

    valor*=valor+10;

    if (  valor <= 30 ){
            system("color 14");
            printf("\n Sorpresa cambiaste el color de tu pantalla con el valor anexado: \n");
            printf("\nEl valor es: %i\n", valor);
    }else{
            //system("color 14");
            printf("\n Adivina cual es el valor para cambiar el color de tu pantalla: \n");
            printf("\nEl valor es: %i\n", valor);

    }



    return 0;
}
