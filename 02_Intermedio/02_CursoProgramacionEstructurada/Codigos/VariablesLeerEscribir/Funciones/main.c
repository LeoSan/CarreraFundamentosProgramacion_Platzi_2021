#include <stdio.h>
#include <stdlib.h>

char name[30];
int grade;

void finalGrade()
{
    if(grade >= 7){
      printf("El alumno %s aprobo con una calificacion final de %i \n", name, grade);
     }
    else if(grade <= 6){
      printf("El alumno %s reprobo con una calificacion final de %i \n", name, grade);
     }
}

int  factorial(int n)
{
      system("Color 75");
      sleep(2);
      system("Color 17");
      sleep(1);

      //4 -> Rojo
      //7 -> Blanco pastel
      //2 -> Verde
      //5 -> Morado
      //1 -> Azul
      printf("Entrando a la funcion factorial, n vale: %i \n", n);
      if (n > 1){
            printf("La funcion se llamara asi misma  otra vez \n \n ");
            return n * factorial(n-1);
      }else{
            printf("n es igual a 1, termina la recursividad \n \n ");
            return 1;
      }

}



int main()
{
    printf("Ingresa el nombre del alumno: \n");
    scanf("%s", &name[30]);

    printf("Ingresa la calificacion del ultimo examen: \n");
    scanf("%i", &grade);

    finalGrade();


    int n = 0;
    printf("\n Llamamos  funcion factorial \n");
    scanf("%d", &n);
    int result = factorial(n);
    printf("\nEl Resultado es: %i", result);


    return 0;
}
