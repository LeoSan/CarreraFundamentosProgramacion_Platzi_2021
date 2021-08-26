// 1er paso Dividir el valor entre 2 yalmacenar el resto, mod, en un array
// 2do paso dividir otra vez entre 2 y almacenar el restante 
// repetir hasta que nuestro n√∫mero ya no se pueda dividir 

#include <stdio.h>
#include <stdlib.h>

int binaryNumber[12],n,i,resp;

main()
{   
    
    system( "Title : Calculadora de binarios" );
	system("cls");
    system("color 9F");
    
	
	do
	{
	/* code */
	
	printf("Ingrese un valor entero \n");
    scanf("%d", &n);
    printf("Usted va a convetir el numero %d a binario\n",n);
    
    //Ciclos y calculo
	puts( "Calculando." );//Otra forma de imprimir en pantalla 
	system("pause > NULL");
	getchar();
	
	for ( i = 0; n > 0; i++)
    {
        binaryNumber[i]= n%2;
        n = n/2;
    }

    printf("El resultado de la conversion es: ");
    for ( i= i-1 ; i >= 0; i--)
    {
        printf("%d",binaryNumber[i]);
    }


	printf("\n ----------------------------------------------------- \n");
	printf("ø Deseas continuar calculando ? \n");
	printf(" 0 = No, 1 = Si \n");
	scanf("%d", &resp);
	printf(" ------------------------------------------------------- \n");
	
	
	} while ( resp == 1 );

	printf("\n ---------------Gracias por usar nuestra App ------------------------ \n");

    return 0;
}
