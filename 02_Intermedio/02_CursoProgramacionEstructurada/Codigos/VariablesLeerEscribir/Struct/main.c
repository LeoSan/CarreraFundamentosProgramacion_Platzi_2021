#include <stdio.h>
#include <stdlib.h>

struct personalData
{
    char name[20];
    char lastName[20];
    int age;
};

int main()
{
    printf("Estructura de Datos\n");
    struct personalData person;

    printf("Leer los datos que se encuentran en mi struct\n\nIngresa el nombre:\t");
    gets(person.name);

    printf("\nIngresa el apellido:\t");
    gets(person.lastName);

    printf("\nIngresa la edad:\t");
    scanf("%i", &person.age);

    printf("\nVerificacion de datos\n");
    printf("%s \n", person.name);
    printf("%s \n", person.lastName);
    printf("%i \n", person.age);

     system("Color 75");
     printf("Practica de Archivo\n");

     //Declaro variable archivo
     FILE *archivo;

     archivo = fopen( "archivo_001.dat" , "wb");
     //Valido el archivo
     if(archivo != NULL){
            //Limpiar el buffer de basura
            fflush(stdin);
            //Forma de escribir un archivo
            fwrite(&person, sizeof(person), 1, archivo);
            //fwrite(puntero_de_que, el_tamano_de_lo_que_escribes, cuantos_escribes, el_archivo_que_escribes);
            fclose(archivo);

            printf("\n El archivo se ha creado  \n");

     }else{
        printf("\n  No se ha  creado el archivo  \n");
     }

        sleep(2);
         printf("\n Leemos el archivo  \n");

         archivo = fopen( "archivo_001.dat" , "rb");

         fread(&person, sizeof(person), 1, archivo);
         printf("\n  Imprimir Datos   \n");
         printf("\n  Nombre: %s   \n", person.name);
         printf("\n  Apellido: %s   \n", person.lastName);
         printf("\n  Edad: %s   \n", person.age);
         fclose(archivo);

  return 0;
}
