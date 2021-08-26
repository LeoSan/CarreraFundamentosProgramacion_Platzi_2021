#include <stdio.h>
#include <stdlib.h>

int main()
{
    printf("Arreglo Bidimensional\n");
    int arrayBidi[4][4];//[Fila] [Columna]
    int arrayRes[4];

    arrayBidi[0][0] = 10;
    arrayBidi[0][1] = 11;
    arrayBidi[0][2] = 12;
    arrayBidi[0][3] = 13;


    arrayBidi[1][0] = 20;
    arrayBidi[1][1] = 21;
    arrayBidi[1][2] = 22;
    arrayBidi[1][3] = 23;


    arrayBidi[2][0] = 30;
    arrayBidi[2][1] = 31;
    arrayBidi[2][2] = 32;
    arrayBidi[2][3] = 33;


    arrayBidi[3][0] = 40;
    arrayBidi[3][1] = 41;
    arrayBidi[3][2] = 42;
    arrayBidi[3][3] = 43;


    arrayBidi[4][0] = 50;
    arrayBidi[4][1] = 51;
    arrayBidi[4][2] = 52;
    arrayBidi[4][3] = 53;



    arrayRes[0] = 0;
    arrayRes[1] = 0;
    arrayRes[2] = 2;
    arrayRes[3] = 2;
    int x;
    int y;
    //Filas
    for( x =0; x<4; x++){
            //Columnas
        for(y = 0; y<4; y++){

            if ( x == 0){
                    //Suma
                    arrayRes[x] = arrayRes[x] + arrayBidi[x][y];
            }
            if ( x == 1){
                   //Resta
                    arrayRes[x] = arrayRes[x] - arrayBidi[x][y];
            }
            if ( x == 2){
                   //Multi
                    arrayRes[x] = arrayRes[x] * arrayBidi[x][y];
            }
            if ( x == 3){
                   //Mod
                    arrayRes[x] = arrayRes[x] % arrayBidi[x][y];
            }


        }
    }

    printf("Resultado Suma Fila 1 %i \n", arrayRes[0] );
    printf("Resultado Resta  Fila 2 %i \n", arrayRes[1] );
    printf("Resultado Multiplicacionn Fila 3 %i \n", arrayRes[2] );
    printf("Resultado División Mod  Fila 4 %i \n", arrayRes[3] );

    printf("Iniciando el  otro ejemplo: \n\n");
    sleep(2);

    system("Color 17");



    printf("Vamos a sacar el promedio de unas calificaciones\n\n");
    float calificaciones [5][6];
    int i;
    int j;

    for(i = 0; i < 5; i++)
    {
        float suma = 0;

        for(j = 0; j < 5; j++)
        {
            calificaciones[i][j] = rand() % 5 + 6;
            printf("calificaciones[%i][%i] = %f\n", i, j, calificaciones[i][j]);

            //sumamos
            suma += calificaciones[i][j];
        }
           //Imprimimos suma
            printf("\n\nSuma De esta Nota es %f\n\n", suma);

            calificaciones[i][6] = suma / 5;
            printf("\nEl promedio de %i es: %f\n\n", i, calificaciones[i][6]);
    }

    printf("Iniciando el  otro ejemplo: \n\n");
    sleep(2);
    system("Color 57");

    char chain[50];
    int ziseChar;
    printf("Escriba cadena ->\t");
    gets(chain);//obtiene todo lo digitado por el teclado hasta presionar enter
    ziseChar = strlen(chain);
    printf("\n********************************");
    printf("\nCadena digitada es:\t");
    puts(chain);//muestra todos los carecteres contenidos en la variable chain
    printf("La cadena Invertida es:");
    for( i=ziseChar;i>=0;i--){
        printf("%c",chain[i]);
    }

    printf("\nlongitud de la Cadena digitada es: %i\n",ziseChar);

    return 0;
}
