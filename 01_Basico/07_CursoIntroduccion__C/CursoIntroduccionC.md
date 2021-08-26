-*/-*/-*/-*/-*/-*/*Curso de Introducción a C-*/-/-*/-*/-*/-/-*
El lenguaje C es un lenguaje de propósito general, compilado y de nivel intermedio.
• Propósito general : Esto quiere decir que no está pensado para resolver un problema en específico, sino que cualquier problema que puede resolverse con algún programa de computadora puede escribirse utilizando lenguaje C
• Compilado : Se analiza todo el texto del programa, se genera un archivo binario y luego se procede a ejecutar.
• Nivel intermedio : Donde algunas cosas podemos olvidarnos, como el manejo más básico del hardware, otras no tanto como el manejo de la memoria.
• PLC : controlador logico programable, soporta temperatura, no es escribir codigo ya que tiene interfaz, pan de cada dia de los sistemas, fabricas e industrias 
• La programación en C se utiliza, entre otras cosas, para el desarrollo de sistemas operativos. El primer sistema operativo escrito en C fue Unix. Más tarde, otros sistemas operativos como Linux también fueron escritos en C. Pero C no es sólo el lenguaje de programación de los sistemas operativos. C es el precursor e inspirador para casi todos los lenguajes de alto nivel más populares disponibles en la actualidad. De hecho, Perl, PHP, Python y Ruby están escritos mediante programación en C.

El creador del lenguaje C es Dennis Ritchie.


*/-/-*/-*/-*/-*/-*/-*/-*/¿Cómo funcionan las computadoras?*/*-/*--*/-*/-*/-*/

Las computadoras nacen de la necesidad de hacer nuestra vida mas fácil
En un principio las computadoras nos ayudaban a trabajar con números mas fácil
Hoy en día las computadoras nos han ayudado a muchas mas cosas
Dentro de una computadora todo funciona con Binario

Transistores almacenan 0 y 1 (Bits)
Los cables dentro de un circuito llevan la informacion de un lado a otro
La base que se utiliza para mostrar todo en una computadora es Binario

El software son las series de instrucciones para que esta pueda hacer los procesos

El flujo que todo programa va a seguir: El input, CPU, memoria, Resultado final


/-/**-/-/-/-*/-*/-*/¿Por qué aprender C?/-/-/-/-/-/-/-/*

#include <stdio.h> 
//Zona donde incluimos nuestras librerias. 
//Directivas de precompilador (Preprocessors Comands).

int main()  //Funcion principal, aqui es donde la ejecucion de mi programa comienza. Todo el codigo va aqui dentro.
{
    /*First hello world in C language*/
    printf("Hola Mundo"); //=> imprime en terminal
    return 0; //=> return 0 termina la funcion. Siempre que ponga 0 en un return dentro de una funcion main, va a cerrar dicha funcion
}


Basic Types:
        Aritmeticos:
            (A) Valores enteros:
                            int 2 o 4 Bytes permite tener numeros negativos y positivos
                                            2 Bytes -32,768 to 32,757
                                            4 bytes -2,147,483,648 to 2,147,483
                            unsigned int 2 o 4 bytes no nos permite tener datos negativos
                                            2 Bytes 0 to 65.535
                                            4 bytes 0 to 4,294,967,295
                            short 2 Bytes
                                            2 Bytes -32,768 to 32,767
                            unsigned short 2 Bytes 0 yo 65,535

                            long 8 Bytes
                                        long 8 bytes -9223372036854775808 to 9223372036854775807
                                        unsigned long 8 Bytes 0 to 18446744073709551615

            (B) De punto FLorante:

                            float 4 Bytes 1.2E-38 to 3.4E+386 ( 6 decimal places)
                            double 8 Bytes 2.3E-308 to1.7E+30815 (15 decimal places)
                            long double 10 Bytes 3.4E-4932 to 1.1E+493219 (19 decimal places)
							
void: No hay valor disponible

    Función que no retorna nada.
    void funcion()

    Función con argumentos/parametros vacios
    int funcion(void)

    Puntero o apuntador. Va a la dirección de un objeto pero no le importa el tipo de dato que tenga el objeto.

%d Se utiliza para representar una parte de la memoria como un número entero.

Placeholders usados en C

%c - a character

%s - a string

%d - a decimal integer

%o - an octal integer

%x - a hexadecimal integer

%p - an address (pointer)

%f - for floats

%e - a floating point number in scientific notation

%E - a floating point number in scientific notation

%% - The % symbol

-*/-*/-*/-/-* VARIABLE CONSTANTE-/-*///-*/-*/-*/

Cuando declaramos la variable de tipo constante, por ejemplo, en un microcontrolador dicha variable 
se almacena en la memoria FLASH porque no se va a modificar, por lo tanto, sera de solo lectura. 
Al contrario, si se declara que NO es constante se almacena en la memoria SDRAM, porque el espacio 
en memoria que ocupa esa variable sera de escritura y lectura. Y Porque? pues es una variable que 
es manipulada por el usuario y podra obetener cualquier valor dentro del rango permitido.		

const int love = 94
const char me = "Mo"

Para aquellos que quedaron con la duda de qué es una directiva de preprocesador, les comparto la explicación:

Una directiva de preprocesador es una instrucción que recibe el compilador y le indica que hay ciertas acciones a realizar antes de iniciar a compilar el programa. Se insertan al principio de cada programa, y se identifican por estar precedidas por el caracter # (Hastag)

Una de las más conocidas es la directiva include, que le dice al compilador que debe incluir una librearía (código previamente escrito, con alguna funcionalidad extra que puede ser usada de manera general en muchos programas) y hacerla parte del código actual.

Otras directivas de prerpocesador son #ifdef, #ifndef, #else, #elif y #endif las cuales sirven como condiciones para evitar errores, al definir varias veces las mismas variables.

Espero les sirva!				

*/*/-*/-*/-*/-*/-/-/GOTO -*/-*/-*/-*/-*/-*/-/ 

En el libro de Algoritmos a fondo con implementaciones en C y Java, escrito por el Ing. Pablo Augusto Sznajdleder.
Dice, la estructura “ir a” o, en inglés, “go to” o “goto”. Esta estructura quedó descartada luego de que el
teorema de la programación estructurada demostrara que con una adecuada combinación
de las**_ tres estructuras de control **(secuenciales, selectivas e iterativas. Las que estudiamos en este curso) es posible resolver cualquier algoritmo sin tener que recurrir al **“goto”_** (o estructura “ir a”). Esta estructura se quedó en desuso porque trae grandes problemas de mantenibilidad.

Esta instrucción goto seguramente sea algo heredado de otros lenguajes más antiguos. El lenguaje **C ** que se basa en un paradigma de programación estructurada.
Es más avanzado a la programación secuencial porque tiene funciones que rompe la continuidad, por la existencia de return, los bucles con el continue, y break. Elgoto` es algo que puede saltar a otro lugar del código que puede ser curioso… no lo he probado pero que tal y si pongo la etiqueta dentro de un bucle y este no tiene inicializadas las condiciones… En fin no quiero romperme la cabeza, solo le pido al compilador que ante semejante aberración chille, llore, berrée o te saque del programa de forma abrupta, a ser posible sin guardar el programa.


-*/-/-/-*/-/-*/-*/-*/-/-*/-/Una función, *-/-/-*/-/-/-/-/-/-/*

es un trozo de código que hace una tarea específica. Esta tarea se puede llamar en varias ocasiones en nuestro código, sin necesidad de repetir código.

Elementos: El retorno, el nombre de la función y argumentos.
El retorno debe corresponder a un tipo concreto. Y es lo que la función debe retornar. Puede darse el caso de que la función no devuelva un valor y entonces se declara de tipo void.
El nombre de la función es la manera de identificar esta función para poderla llamar.
Los argumentos pueden ser void, que no tiene o de un tipo de concreto que será utilizado en la función.

Les comparto en este enlace sobre Funciones en C: Estructura básica de una función en C (y como llamar una función en otra función). Acá pueden encontrar una explicación de cada una de las partes de una función:

tipo_de_retorno nombre_de_la_función (lista_de_parámetros) 
{
	cuerpo_de_la_función 
	return expresión
}
-– Tipo de retorno: es el tipo del valor devuelto por la función, o, en caso de que la función no devuelva valor alguno, puede usarse la palabra reservada void.
— Nombre de la función: es el nombre asignado a la función y con el cual será llamada en otra función si así se requiere.
— Lista de parámetros: es la lista de declaración de los parámetros que son pasados a la función. Éstos se separan por comas. Debemos tener en cuenta que pueden existir funciones que no utilicen parámetros.
— Cuerpo de la función: está compuesto por un conjunto de sentencias que llevan a cabo la tarea específica para la cual ha sido creada la función.
— Return expresión: mediante la palabra reservada return, se devuelve el valor de la función, en este caso representado por expresión.
.
Adicionalmente, podrán encontrar como se llama a una función en otra función, lo cual es bastante útil en programación.


*-/-*/-*/-*-*/-*/ tipos y fomas  de funciones -*/-/-*/-*/-*/-* 
<1. Funciones sin argumentos y sin valor de retorno

void functionName(); //Declarando la function.
functionName(); //Invocando o ejecutando a la function
void functionName()// definicion de la function
{
  //logica
}

2. Funciones con argumentos, pero sin valor de retorno

void functionName(float); //Declarando la function.
functionName(float); //Invocando o ejecutando a la function
void functionName(float) // definicion de la function
{
  //logica
}

3. Funciones sin argumentos, pero con valor de retorno

int functionName();

4. Funciones que tienen argumentos y valor de retorno

int functionName(int, float);
>
/-/-*/-*/-*/-*/-*/-/-*/ REFERENCIA */-*/-*/-/

pasar un argumento por referencia, se modifica porque recibe la posición de memoria donde está el valor.
pasar un argumento por valor, no se modifica porque es una copia, es decir es una posición de memoria diferente.
Un **Puntero **es un argumento por referencia.


*/*-/*-/-*/-*/-*/-/-BIBLIOTECAS /-/-*/*/*/-*/-*/-*/-*/
https://www.tutorialspoint.com/c_standard_library/math_h.htm
#include <stdio.h> //input y output teclado, para imprimir pantalla printf
#include <conio.h> //entradas y salidas comunicarnos en la consola
#include <string.h> // cuando se trabaja con cadenas de caracteres
#include <stdlib.h> // system comunicarnos afuera de c con sistema attoy convertir string a entero  adol convierte a long ran genera numeros enteros aleatorios delay para pausa
#include <math.h> // sin cosh floor ceil sqrt
#include <time.h>  // para fechas o tiempos del sistema 
#include <ctype.h> //  tipo manejo de caracteres individuales
#include <signal.h> // señales en programa por ejemplo enventos en el teclado , detectar un espacio en blanco en cadena de caracteres, detectar caracter en minuscúla lower y upper.
#include <locale.h> // cuestinones locales al software cuando se neccesita que se adapte al lugar que se use
#include <errno.h>// para debug errores.
#include <assert.h>// macro para verificar asumsiones y imprimir que esta pasando.



Para quienes usamos Mac o Linux, las dos funciones system() utilizadas no funcionarán. Porque corren solo en Windows. Sí que la primera tiene su versión para sistemas UNIX. Para limpiar la consola, en lugar de system(cls); para Windows, deben usar system("clear");.

