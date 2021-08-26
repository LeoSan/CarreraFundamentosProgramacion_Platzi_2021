#include <stdio.h>
int opt1 = 0;
int opt2 = 0;

int main()
{
    printf("bienvenid a platzi store :\n");
    printf("opcion 0 para platzi bebidas \n");
    printf("opcion 1 para platzi comidas \n");
    printf("opcion 2 para platzi postres \n");
    switch (opt1 ){

        case 0:
            printf("usted eligio la opcion 0, vera nuestro menu de bebidas elija una:\n");
            printf("opcion 0 para platzi cola cero \n");
            printf("opcion 1 para platzi cola normal \n");
            printf("opcion 2 para platzi pina colada \n");
            switch (opt2)
            {
                case 0:
                    printf("usted eligio una platzi cola cero, mmm rico");
                    break;
            
                default:
                    break;
            }
                break;
        case 1:
           /* Dispersar, correr a los intrusos */
            break;
        case 2:
           /* Dispersar, correr a los intrusos */
            break;
        default:
            break;
    }
    return 0;
}


