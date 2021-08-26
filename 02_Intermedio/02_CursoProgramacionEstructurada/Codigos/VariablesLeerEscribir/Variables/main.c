#include <stdio.h>

int main () {

  system("color 74");
  int v1,v2,aux;

  printf("Por favor, Ingresa el valor de la variable Uno: \n");
  scanf("%i", &v1);

  printf("Por favor, Ingresa el valor de la variable Dos: \n");
  scanf(" %i", &v2);

  //en la siguiente linea estamos imprimiendo integerA
  printf("Tu valor de V1 -> %i \n", v1);
  printf("Tu valor de V2 -> %i \n", v2);

  printf("Ahora tus valores son: \n");
  sleep(3);

  aux = v1;
  v1 = v2;

  //en la siguiente linea estamos imprimiendo integerA
  printf("El valor de la variable 1 es: %i \n", v1);
  printf("El valor de la variable 2 es: %i \n", aux);

  return 0;
}
