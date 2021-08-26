El operador de asignación “=” asigna el valor del lado derecho del operador a la variable en el lado izquierdo.
//
Los operadores de asignación compuestos: realizan una operación y una asignación en una sola declaración.
Ejemplo:
int x = 42;
x += 2; //Equivalente a x = x +2
x -= 6; //Equivalente a x = x - 6
//
Operadores de Incremento y decremento.
operador de incremento, por ejemplo:
int miNumero = 7;
miNumero++;
//salida 8
//
El operador de decremento (- -) _funciona de la misma forma que el operador de incremento,pero en lugar de incrementar el valor, lo disminuye en uno.
//
El operador de incremento tiene dos formas prefijo y sufijo.
x; //prefijo
x; //sufijo
La variante de prefijo incrementa el valor y luego continua con la expresion.
La variante de sufijo evalua la expresion y luego ejecuta el incremento.
Ejemplo de prefijo:
int x = 3;
int y = x++;
//x es 4, y es 4
//
Ejemplo de sufijo:
int x = 3;
int y = x++;
// x es 3, y es 4
//
Conclusion: El ejemplo de prefijo incrementa el valor de “x” , y luego se lo asigna a “y”.
el ejemplo de sufijo asigna el valor de “x” a “y” y luego incrementa el valor de “x”.


*/-*/-*/-*/-Apuntes de clase:-/-*/-/-*/-*/
Condicionales o sentencias condicionales.
Son instrucciones que evalúan resultados booleanos, generalmente usados para alterar el flujo del programa.
Los resultados booleanos son aquellos que nos pueden dar verdadero o falso y con ello alterar el flujo de un programa.

La declaracion if es una declaración que ejecuta un bloque de código cuando una condicion es verdadera (una condición puede ser una expresión que retorne verdadero o falso).
La forma general de la declaración if es:
if (condicion)
{
//Ejecuta este código cuando la condición es verdadera
}

Cuando solo una linea de código esta dentro de un bloque if, las llaves se pueden omitir.

Una clausula else puede ser especificada para ejecutar un bloque de código cuando la condición en la declaración if evalúa a falso.
Sintaxis:

if (condicion)
{
//declaraciones
}
else
{
//declaraciones
}

La declaracion if-else if puede ser usada para decidir entre tres o mas acciones

*/-*/*-/Apuntes de clase:-*/-*/-*
Switch es una estructura de control para agilizar el flujo 
del programa en opciones múltiples.

Se obtiene una condición que se puede cumplir dependiendo de 
diferentes casos, cada caso nos lleva a un bloque de cumplimiento de 
la condición y ese bloque nos lleva a continuar el programa.

¿Qué es un iterador? - Ciclo While
Un iterador o loop como se conoce en ingles es una estructura iterativa que permite repetir un bloque de instrucciones. Esta repetición es controlada por una condición booleana (una condición no es mas que algo que puede devolver verdadero o falso).
_
Un iterador es utilizado por un algoritmo para recorrer elementos almacenados en un contenedor. Dado que los distintos algoritmos necesitan recorrer los contenedores de diversas maneras para realizar distintas operaciones, y los contenedores deben ser accedidos de formas diferentes, existen otros tipos de iteradores (en este caso estamos conociendo como funciona el ciclo while).
_
¿Que es un algoritmo?
un algoritmo es una secuencia de instrucciones para llegar a una solución.
_
While - mientras
Es una estructura de control que ejecuta repetidamente un bloque de código siempre y cuando una condición sea verdadera.
_
Sintaxis:
while (/* condition /)
{
/ code */
}

/*/**/*//**/
El ciclo for es una estructura de control que nos permite repetir un bloque de comandos un número de veces específico.

Este ciclo se compone de tres partes:
1- Inicialización: Se inicializa una variable (generalmente ““i””) al asignarle el valor 0.
2- Condición: Se indica la condición necesaria para que termine el ciclo.
3- Incremento: También puede ser decremento; este va a indicar los pasos en los que se moverá el ciclo, este número siempre debe ser entero, para ir de uno en uno se utiliza el i++.

Héroe Verdadero ★
/*-/-*/-/-


*-/-*/-/-/-*/-*/-*/-*/-/-/-*/-/-/-/-/-*/-/
Diferencias entre For, While y Do-While:

For: Permite repetir un bloque de comandos un número de veces específico, tiene 3 partes: Inicialización, Condición y Cambio de la variable (Incremento o Decremento). Útil para recorrer arreglos.

While: Se repiten las instrucciones mientras la condición es verdadera (se detiene hasta que no se cumple, en el caso de que no sea verdad al principio, no entrará al bucle).

Do-While: Se ejecuta al menos una vez, primero hace el bloque de instrucciones y después evalúa la condición. Útil para hacer un Menú.

Por ejemplo JavaScript al ser un lenguaje débilmente tipificado te permite hacer colecciones que contengan números, 
cadenas o booleanos, en la misma colección, a esto se le llama “mixed data” pero otros 
lenguajes solo te permite hacer colecciones con datos específicos. Es una buena práctica 
porque la trabajar con colecciones te sera más sencillo entender el arreglo y trabajar con él.



#include <stdio.h>
#include <stdlib.h>

int main() {

    int integerList[5], result;

    printf("Ingresa los 5 numeros a multiplicar: \n");

    for( int i = 0; i < 5; i++) {
        printf("Ingresa el valor del numero %i: ", i + 1);
        scanf("%i", &integerList[i]);
        result = (i == 0) ? integerList[i] : result * integerList[i];
    }

    printf("El resultado de la multiplicacion es: %i \n", result);


    return 0;

}	

//Reto 1
    int valor[5];
    printf("Multiplicar todos los elementos de un arreglo: \n");
    printf("Ingresa los valores \n");
    printf("Valor[1] \n");
    scanf("%i", &valor[0]);
    printf("Valor[2] \n");
    scanf("%i", &valor[1]);
    printf("Valor[3] \n");
    scanf("%i", &valor[2]);
    printf("Valor[4] \n");
    scanf("%i", &valor[3]);
    printf("Valor[5] \n");
    scanf("%i", &valor[4]);

    printf("El resultado es: %i \n", valor[0]*valor[1]*valor[2]*valor[3]*valor[4]);
	
	
	*/-/-/-*/Para recoger información del stdin del usuario podemos usar scanf(), gets() y fgets()./-*/-*/-*/-*/
.
el problema de scanf() es que solo recoge información hasta que encuentra un espacio.
.
el problema de gets() es que si por ejemplo la información recogida tiene un tamaño 
15 espacios en memoria y se guarda por ejemplo en un array de 5 espacios los 
10 espacios restante los escribe en la memoria de igual manera y con esto podría 
reescribir una función importante del sistema haciendo colgar la computadora, 
para evitar eso se recomiendo usar:
.
fgets() ya que en esta función se le pasa como parámetro la variable donde se va a guardar 
la información, de donde se va a recibir la información y lo que corrige 
el problema de la anterior función que es el tamaño máximo de la información 
que puede recibir, quedando así: fgets(varaible, 15, stdin); donde “variable” 
es la variable donde se va a guardar la información, 15 es el tamaño máximo de la información 
que puede recoger y stdin es de donde se va recoger la información en este caso stdin es el teclado


Los operadores relacionales son:

(<) Menor que
(- <)= Menor o igual que
(>) Mayor que
(>)= Mayor o igual que
(==) Igual (Utilizado como comparación y NO como asignación)
(!=) Diferente/No igual que
Los operadores lógicos son:

&& Y/And
Teniendo en cuenta más de una condición, el resultado será verdadero si ambas condiciones son verdaderas.
|| O/Or
Teniendo en cuenta más de una condición, el resultado será verdadero si alguna o ambas condiciones son verdaderas, solo una necesita cumplirse.
! No/Not
El resultado es inverso al operando.
Switch
Otra estructura de control de flujo que podemos utilizar es el switch. Esta es una estructura de control que nos permite agilizar el flujo es opciones múltiples.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

int eleva(int a, int b)
{
    int result = a;
    for(int i=1; i<b; i++)
    {
        result *= a;
    }
    
    return result;
}

int main()
{
    int base,pote;
    printf("Ingresa un valor Base:");
    scanf("%i", &base);
    printf("\nIngresa un valor potencial:");
    scanf("%i", &pote);
    
    printf("El resultado es: %i", eleva(base,pote));
    
    return 0;
}



*/-*-*/-*//Ambito de las variables (local y global)-*/-/*-/
La recomendación general es definir como variables locales todas las variables que sean de uso exclusivo para realizar las tareas encargadas a cada función. Las variables globales se utilizan para compartir variables entre funciones de forma sencilla.
_
Realice este diagrama para entender este tema, por favor corrigirme si esta mal.
_
Las variables x, y son globales por lo que las funciones A, B y C pueden hacer uso de ellas.
La variable w que pertenece a la funcion A y solo funciona dentro de ella.
La variable z pertenece a la funcion B y solo funciona dentro de ella.
La variable v pertenece a la funcion C y solo funciona dentro de ella.


-/-/--*/-*Recursividad-*/-*/-*/
Un método recursivo es un método que se llama así mismo.
Una de las tareas clásicas que pueden ser resueltas fácilmente 
por recursión es el calculo del factorial de un numero.
_
En matemáticas, el termino factorial se refiere al producto 
de todos los enteros positivos que son menores o iguales que 
un número entero específico no negativo (n). El factorial de n se escribe como n!.



//-/-/-/-/ Apuntadores -/-/-*/-*/- 
int *p;
/*
estamos diciendo: compu dame un espacio en memoria en donde puedo almacenar una direccion de alguna variable de tipo integer
 */

int a = 5;
/*
Aqui decimos: compu crea un espacio en la memoria del tamaño de un integer y almacena el valor 5 en el
*/ 

p = a;
/*
Aqui decimos: compu haz que la direccion donde esta la variable llamada a se almacene en mi variable puntero p
*/

*p = 10;
/*
Aqui lo que decimos es: compu cambia el valor que se encuentra en la direccion que aparece en p y cambialo por el valor 10
*/

printf( "%i", &a );
/*
Aqui lo que decimos es: compu imprime en pantalla la direccion en memoria de mi variable llamada a
*/

*/-/-/-/-FILE-*/-/-*/* 

El estándar de C contiene varias funciones para la edición de ficheros, 
éstas están definidas en la cabecera stdio.h y por lo general empiezan 
con la letra f, haciendo referencia a file.

Adicionalmente se agrega un tipo FILE, el cual se usará como apuntador a la información del fichero. 
La secuencia que usaremos para realizar operaciones será la siguiente: _

Crear un apuntador del tipo FILE *
Abrir el archivo utilizando la función fopen y asignándole el resultado de la llamada a nuestro apuntador.
Hacer las diversas operaciones (lectura, escritura, etc).
Cerrar el archivo utilizando la función fclose.
fopen
Esta función sirve para abrir y crear ficheros en disco.
fclose
Esta función sirve para poder cerrar un fichero que se ha abierto.

Las estructuras struct son conjuntos de datos que aceptan diferentes tipos de variables.

““rb””: Abre un archivo en modo binario para lectura, el fichero debe existir.
““w””: Abrir un archivo en modo binario para escritura, se crea si no existe o se sobreescribe si existe.
““wb””: Abrir un archivo en modo binario para escritura, se crea si no existe o se sobreescribe si existe y permite escribir