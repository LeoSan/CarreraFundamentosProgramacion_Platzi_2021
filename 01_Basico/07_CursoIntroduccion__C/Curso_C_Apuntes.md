Apuntes de la clase

C++ es una extensión de C pero C++ tiene soporte para clases y objetos, es su principal diferencia.
Un compilador es un programa que traduce código de programación a código maquina, código que la computadora entiende y así puede ejecutar nuestros programas. uno de los primeros compiladores para C++ es Cfront, este fue lanzado oficialmente en octubre de 1893.
En este curso el compilador que utilizaremos se llama GCC ya que este es opensouce.
Un IDE es un programa que contiene múltiples herramientas que nos ayudarán a crear código fuente mas fácilmente, el IDE que utilizaremos en el curso es Code::Blocks.
Bjarje creador 


*¿Qué es la memoria y tipos de datos?

Types: char, short int, int, long int, float, double, long double, bool
Disco duro: Velocidad media, perdura
RAM: Memoria de acceso dinámico, no perdura

Proceso de memoria: Codificar nuestros datos, almacenar (ram o disco duro) y recuperar cuando los necesitemos

¿Qué es un tipo de dato? Es una clasificación que le damos a la información para hacer saber al compilador cómo va a ser escrita e interpretada.
Tipos de datos primitivos:
int, float, bool, char

Código

Diferencia entre memoria ram y disco duro: La memoria ram tiene acceso a 
los datos o los programas de forma aleatoria y lo que se almacena en ella 
es lo que estamos viendo, es decir para mantener abierto tu navegador 
eso es soportado con la memoria ram, el proceso del navegador pasa a almacenarse en la memoria ram. 

Ahora para poder ejecutar el navegador necesitas tenerlo instalado y guardado en algun 
lugar es aqui donde el disco duro lo almacena, el discoduro es el que tiene 
el ejecutable para que la ram lo procese.

Enlaces: 

https://www.asciiart.eu/animals/bears


/-/-*/*-/-*/-*/-*/-*/-*/-*/-*/-*CICLO */-*//*-/-*/-*-*/-*/-*

Ciclo While:

int contador = 0;

	while (contador <= 100)
	{
		cout << contador << endl;
		contador = contador + 1;
	}
Ciclo Do-While:

int contador = 0;

	do
	{
		cout << contador << endl;
		contador = contador + 1;
	} while (contador < 100);
Ciclo For:

for (int i = 0; i <= 100; i++)
	{
		cout << i << endl;
	}


-*/-*/-*/-*/-*/File-*/-*/-/-*/-*
<fstream>: Tiene el mismo uso que FILE, en C, lo que quiere decir que hacemos archivos de entrada de escritura o lectura de archivos abrir y cerrara.
*Mis apuntes sobre: “Creando y leyendo un archivo externo”:

#include <fstream> --> Librería genérica creada para el manejo, escritura y lectura de archivos externos al programa.

ofstream --> Tipo de dato para crear flujos de datos de escritura
open/close --> Comandos para abrir y cerrar archivos.

myFile.is_open(); --> devuelve true o false, si está abierto o no.
myFile.close(); --> sirve para cerrar el archivo

#include <iostream>
#include <fstream>

using namespace std;

int main()
{
    ofstream myFile("gameData.txt");
    if(myFile.is_open())
    {
        myFile<<"Hi Platzi"<<endl;
        for(int i=0;i<10;i++)
        {
            myFile<<i<<endl;
        }
    }
    myFile.close();
    return 0;
}
*/-*/-*/-*/-*/-*/-/-/-/Orientado OPP-*/-*/-*/-/-/-/-

¿Qué es un paradigma de programación?
.
Un paradigma de programación es una manera o estilo de programación de software.

Un paradigma es como decir un ejemplo, un método o un modelo de programar es un estilo para resolver problemas,  Existen muchísimos paradigmas, pero los más conocidos y usados son los siguientes:

La programación estructurada también llamada imperativa, porque se relaciona con emperador, que te dice que hacer y como hacerlo. Otro ejemplo es una receta de cocina que te da paso a paso como hacer un alimento. Este paradigma se puede aplicar en prácticamente todos los lenguajes.

La programación declarativa indica que debe hacer, pero generalmente no indica el como, por ejm SQL para bases de datos relacionales.

La programación orientada a objetos se ve en la mayoría de lenguajes, es el más querido porque nos permite reutilizar código y porque es el más apegado a la realidad. Los objetos tienen dos características, los atributos (propiedades) y comportamientos (métodos). Pueden tener uno de los dos, o ambos, depende del objeto.

La programación funcional tiene como una de sus bases fundamentales la recursividad.
“No hay ciclos” es decir, se trata de evitar ciclos, sino que todo se basa en notaciones matemáticas. En términos matemáticos, la recursividad es mucho más eficiente que utilizar ciclos. Adopta una parte de la programación declarativa.

La programación dirigida por eventos se refiere a que la estructura y ejecución del programa va determinada por los sucesos que puedan ocurrir en el sistema. El lenguaje más común con este paradigma es JavaScript, en donde se pueden almacenar estos eventos y a partir de estos realizar acciones. (Registrando eventos).

Hoy en día, en realidad ya muchos lenguajes de programación son multiparadigma. Es decir, lenguajes de programación que adoptan varios paradigmas de programación.

*-/-/-*//-* Clases /-/-*/-*/-/ 

+58 426-4077070



*/-/-/-/-/🔥 Naming Conventions in C++ 🔥/-*/-*/-*/-*/-*/-*

La regla de oro es que siempre debes sentirte a gusto con tus reglas, de caso contrario, no sirven para nada y solo retrasan tu trabajo 🔪
A mi me gusta así: 
🌵 PascalCase para las clases, 
🐫 camelCase para las instancias de las clases y otras variables, 
🐍 snake_case para las funciones y 
UPPER_SNAKE_CASE para las constantes (cosas que --en teoría-- nunca cambian en toda la ejecución del programa) 🎉


Encapsulación: Es el proceso de diseñar nuestra clase para que los valores o los datos que se almacenen sean modificados por factores externos
Nota: Esto se hace gracias al principio del menor privilegio, no darle el poder de acceder a una variable, objeto, etc. si no es necesario.


*******Abstracción: consiste en dejarle al usuario solo lo esencial que necesita o que usará, y mantener privado lo que no requiere o lo que son cálculos que no debería modificar.

******Clases Abstractas: son un tipo de clases que, como dijiste, no se pueden instanciar, pero que poseen unos ciertas características y funcionalidades comunes o más generales. Estas se usan por lo general con lo que es herencia en programación orientada a objetos.

******Para que sirve la herencia en POO: Con la herencia todas las clases están clasificadas en una jerrquía estricta. Cada clase tiene una superclase (la clase superior en la jerarquía) también llamada clase base y cada clase puede tener una o más subclases también llamadas clases derivadas. Además hereda todas las variables y los métodos definidos por la superclase y agrega us elementos únicos.

**********El polimorfismo es cuando una operación tiene el mismo nombre en diferentes clases, pero realiza acciones diferentes. Por ejemplo la operación abrir(), puede ser utilizada en diferentes clases y hacer acciones diferentes como abrir una puerta, una ventana, una cuenta bancaria etc.
En el ejemplo de esta clase la operación que tiene polimorfismo es GetDamage() porque cada mago (clase) hace un daño (acción) diferente.
Public: Los datos y funciones en esta área pueden ser accedidos por quien sea, al heredar de otra clase con sus datos se mantienen como públicos.
Private: Ahora, los datos y funciones en esta área solo pueden ser accedidos por la clase y no por otros. Usando apuntadores uno puede saltarse esta regla pero no es recomendado.
Protected: Funciona igual que private, la diferencia es que las clases derivadas pueden acceder a los datos miembro de la clase base que heredan cuando en private esto no es posible.