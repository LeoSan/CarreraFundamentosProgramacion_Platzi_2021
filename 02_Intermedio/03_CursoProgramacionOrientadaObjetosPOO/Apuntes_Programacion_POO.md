## ¿Por qué aprender Programación Orientada a Objetos?

La programación orientada a objetos tiene cuatro características principales:
Encapsulamiento. Quiere decir que oculta datos mediante código.

- Abstracción. Es como se pueden representar los objetos en modo de código.
- Herencia. Es donde una clase nueva se crea a partir de una clase existente.
- Polimorfismo. Se refiere a la propiedad por la que es posible enviar mensajes sintácticamente iguales a objetos de tipos distintos.

En este curso, los pasos a seguir será.
Analisis
Plasmar
Programar
La mayoría solo aprende a hacer esto en un lenguajes de programación,aquí se tiene una variabilidad. ❤️



##  ¿Qué resuelve la Programación Orientación a Objetos?



- Principalmente esos problemas y huecos que nos deja la programación estructurada tales como:
1.Código muy largo:
2.Si algo falla todo se rompe
3.Código Spaguetti: Muchas sentencias de control anidadas y pérdida de control sobre el código.

- Simplifica la programación, la hace más práctica, divertida y amigable.

¿Qué nos ayuda a resolver la POO?
Huecos que la programación estructurada no resuelve, por lo que la estructuración por objetos surgió como una solución.

Ayuda a leer, depurar y mantener código que puede ser muy largo.
Evita que todo se rompa si algo falla.
Facilita el mantenimiento del código.
Evita generar un código espaguetti. Aquél que tiene demasiadas sentencias de control anidadas.

######################################################################################################################
##  Paradigma Orientado a Objetos

La Programación Orientada a Objetos viene de una filosofía o forma de pensar que es la Orientación a Objetos y esto surge a partir de los problemas que necesitamos plasmar en código.

Es analizar un problema en forma de objetos para después llevarlo a código, eso es la Orientación a Objetos.

Un paradigma es una teoría que suministra la base y modelo para resolver problemas. La paradigma de Programación Orientada a Objetos se compone de 4 elementos:

Clases
Propiedades
Métodos
Objetos
Y 4 Pilares:

Encapsulamiento
Abstracción
Herencia
Polimorfismo

######################################################################################################################
##  Lenguajes Orientados a Objetos

Algunos de los lenguajes de programación Orientados a Objetos son:

Java:
– Orientado a Objetos naturalmente
– Es muy útilizado en Android
– Y es usado del lado del servidor o Server Side
PHP
– Lenguaje interpretado
– Pensado para la Web
Python
– Diseñado para ser fácil de usar
– Múltiples usos: Web, Server Side, Análisis de Datos, Machine Learning, etc
Javascript
– Lenguaje interpretado
– Orientado a Objetos pero basado en prototipos
– Pensado para la Web
C#
Ruby
Kotlin

######################################################################################################################
##  Lenguajes basados en clases vs. basados en prototipos


Los lenguajes orientados a objetos basados en clases, como Java y C++, 
se basan en el concepto de dos entidades distintas: clases e instancias.


Una clase define todas las propiedades (considerando como propiedades los 
métodos y campos de Java, o los miembros de C++) que caracterizan un determinado 
conjunto de objetos. Una clase es una entidad abstracta, más que cualquier miembro 
en particular del conjunto de objetos que describe. Por ejemplo, la clase Empleado 
puede representar al conjunto de todos los empleados.

Una instancia, por otro lado, es la instanciación de una clase; es decir, uno 
de sus miembros. Por ejemplo, Victoria podría ser una instancia de la clase Empleado, 
representando a un individuo en particular como un empleado. Una instancia tiene exactamente 
las mismas propiedades de su clase padre (ni más, ni menos).

Imgur
Un lenguaje basado en prototipos, como JavaScript, no hace esta distinción: 
simplemente tiene objetos. Un lenguaje basado en prototipos toma el concepto de objeto 
prototípico, un objeto que se utiliza como una plantilla a partir de la cual se obtiene 
el conjunto inicial de propiedades de un nuevo objeto. Cualquier objeto puede especificar sus 
propias propiedades, ya sea cuando es creado o en tiempo de ejecución. Adicionalmente, cualquier
 objeto puede ser utilizado como el prototipo de otro objeto, permitiendo al segundo objeto compartir 
 las propiedades del primero.
 
###################################################################################################################### 
##  Diagramas de Modelado

OMT: Object Modeling Techniques. Es una metodología para el análisis orientado a objetos.
Creado en OMT 1991. Se encuentra en desuso.

UML: Unified Modeling Language o Lenguaje de Modelado Unificado. Tomó las bases y técnicas 
de OMT unificándolas. Tenemos más opciones de diagramas como lo son Clases, Casos de Uso, Objetos, Actividades, Iteración, Estados, Implementación.
Modelar: 
+Clases
+Casos de Uso
+Objetos
+Iteración
+Estados
+Implementación 

Creado en 1997.


Esto significa que tendremos una manera gráfica de representar una situación, justo como hemos venido viendo. A continuación te voy a presentar los elementos que puedes utilizar para hacer estas representaciones.

Las clases se representan así:

clase.png
En la parte superior se colocan los atributos o propiedades, y debajo las opera ciones de la clase. Notarás que el primer caracter con el que empiezan es un símbolo. Este denotará la visibilidad del atributo o método, esto es un término que tiene que ver con Encapsulamiento y veremos más adelante a detalle.

Estos son los niveles de visibilidad que puedes tener:

- private
+ public
##  protected
~ default

Una forma de representar las relaciones que tendrá un elemento con otro es a través de las flechas en UML, y aquí tenemos varios tipos, estos son los más comunes:

Asociación
associacion.png
Como su nombre lo dice, notarás que cada vez que esté referenciada este tipo de flecha significará que ese elemento contiene al otro en su definición. La flecha apuntará hacia la dependencia.

uml-relacion-asociacion.jpg
Con esto vemos que la ClaseA está asociada y depende de la ClaseB.

Herencia
herencia.png
Siempre que veamos este tipo de flecha se estará expresando la herencia.
La dirección de la flecha irá desde el hijo hasta el padre.

herencia-clases.png
Con esto vemos que la ClaseB hereda de la ClaseA

Agregación
agregacion.png
Este se parece a la asociación en que un elemento dependerá del otro, pero en este caso será: Un elemento dependerá de muchos otros. Aquí tomamos como referencia la multiplicidad del elemento. Lo que comúnmente conocerías en Bases de Datos como Relaciones uno a muchos.

uml-relacion-agregacion.jpg
Con esto decimos que la ClaseA contiene varios elementos de la ClaseB. Estos últimos son comúnmente representados con listas o colecciones de datos.

Composición
composicion.png
Este es similar al anterior solo que su relación es totalmente compenetrada de tal modo que conceptualmente una de estas clases no podría vivir si no existiera la otra.

uml-relacion-composicion.jpg
Con esto terminamos nuestro primer módulo. Vamos al siguiente para entender cómo podemos hacer un análisis y utilizar estos elementos para construir nuestro diagrama de clases de Uber.

## Objetos


💡 Es importante tener en cuenta que el atributo no sea el resultado. Ej: el atributo de ser nombre, 
no el resultado del atributo.

Además, los objetos también puede tener comportamientos. Estos serán todas las operaciones del 
objeto, suelen ser ‘verbos’ o ‘sustantivo y verbo’.

login() → Verbo
logout() → Verbo
makeReport() → Sustantivo y verbo
📒 Es importante tener en cuenta el contexto en que están mis objetos.

Los Objetos son aquellos que tienen propiedades y comportamientos, también serán sustantivos.

Pueden ser Físicos o Conceptuales
Las Propiedades también pueden llamarse atributos y estos también serán sustantivos. Algunos atributos o propiedades son nombre, tamaño, forma, estado, etc. Son todas las características del objeto.

Los Comportamientos serán todas las operaciones que el objeto puede hacer, suelen ser verbos o sustantivos y verbo. Algunos ejemplos pueden ser que el usuario pueda hacer login y logout.

#################################################################################################################
##  Clase


Una Clase es el modelo por el cual nuestros objetos se van a construir y nos van a permitir generar más objetos.

Analizamos Objetos para crear Clases. Las Clases son los modelos sobres los cuales construiremos nuestros objetos.

Abstracción es cuando separamos los datos de un objeto para generar un molde.

#################################################################################################################
## Modularidad
.
La modularidad va de la mano con el Diseño Modular, este consiste en dividir 
nuestro sistema en partes pequeñas que funcionen de manera independiente.

Ventajas
-Reutilizar código
-Evitar colapsos
-Legibilidad (Todos los elementos viven por sí solos)
-Resolución rápida de problemas

Debemos empezar a programar en pequeños trozos, cambiar nuestra forma de pensar y evitar la programación estructurada.

Tengamos presentes los principios de la

##################################################################################################################
¿Qué es la herencia?

##################################################################################################################
##  Cuando detecto características y comportamientos iguales, entonces significa que debo realizar una abstracción.


Don’t repeat yourself es una filosofía que promueve la reducción de duplicación en programación, esto nos va a inculcar que no tengamos líneas de código duplicadas.

Toda pieza de información nunca debería ser duplicada debido a que incrementa la dificultad en los cambios y evolución

La herencia nos permite crear nuevas clases a partir de otras, se basa en modelos y conceptos de la vida real. También tenemos una jerarquía de padre e hijo.



¿Qué es la herencia?
.
DRY: Don’t Repeat Yourself, consiste en promover la reducción de duplicación en programación. Ninguna pieza debe de ser duplicada debido a que aumenta la dificulta en los cambios y evolución.
.
Herencia, nos permite crear nuevas clases a partir de otras, teniendo una simulación de la vida real.
.
• Clase Padre, la encontraras también con el nombre de Supérclase, y la palabra de referencia que se ocupa dentro del código es: super.
• Clase Hijo, la encontraras también con el nombre de Subclase.
.
Recuerda: Cuando detectas características y comportamientos iguales, entonces significa que debes realizar una abstracción, herencia.



##################################################################################################################
##  📒📒📒 🤩 Congiguración JAVA Visual Studio Code 🤩 📒📒📒


### Paso 1 📒: 
Debemos instalar los siguientes plugins 
Java Extension Pack -> Instalara varios aditamentos 

### Paso 2 📒:
Debemos descargar Java [OpenJDK11U-jdk_x64_windows_hotspot_11.0.11_9] ->  http://www.cs.tohoku-gakuin.ac.jp/pub/Tools/OpenJDK/JDK11-HotSpot/ 


### Paso 3 📒: Configuramos la varibale de entorno  JAVA_HOME -> C:\Program Files\AdoptOpenJDK\jdk-11.0.11.9-hotspot 
[Como Generar Variable Entorno Windows 10](https://www.youtube.com/watch?v=qF4k830JxXo) 

### Paso 4 📒: Debemos reiniciar el equipo  💡🖥️. 💡💻 

### Paso 5 📒: Congigurar el Visual Code Studio 
   - Debemos buscar en Visual Code, en la sección plugins instalados -> colocamos este nombre  [Java Extension Pack]
   - En Visual code en un apestaña nos muestra el Welcome Java como una interfaz, debemos buscar un tittulo llamado  -> CONFIGURATION -> Configure Java Runtime  Click 
   - Te abre una interfaz donde debemos escoger lo siguiente Default JDK-> C:\Program Files\AdoptOpenJDK\jdk-11.0.11.9-hotspot 
   - En la misma interfaz InstallOpenJDK -> Radio buttom -> OpenJDK 11(LTS)
   
### Paso 6 📒: Si creamos nuestro primer  hola mundo. 

Main.java -> 

````
<code>
package Java;
class Main {

    public static void main(String[] args) {
        System.out.println("Hola Mundo");
    }

}
````

Ya deberiamos ver el Run|Debug o con F5 para 💡🖥️ y para  💡💻 Tecla Fn + F5 deberia mostrar en consola del Visual Studio Code  el  ""hola mundo"" Y  Listo 🤩 &starf&starf; 🤩

### Paso 7 📒: Armarte de Mucha paciencia 💡💡⌛⌛. 


##################################################################################################################
## 📒📒📒 🤩 Objetos, método constructor y su sintaxis en código 🤩 📒📒📒


Un objeto es una instancia de la clase. Es decir, el objeto es el resultado de lo que modelamos 
o los parámetros que dejamos declarados en la clase.

##################################################################################################################
## 📒📒📒 🤩 Declarando un Método Constructor en Java y JavaScript 🤩 📒📒📒


Java
Person juan = new Person();
Python
persona = Person()
JavaScript
const person = new Person();
PHP
$person = new Person();
Ruby
persona = Person.new()

###################################################################################################################
##  📒📒📒 🤩 Aplicando herencia en lenguaje Java y PHP 🤩 📒📒📒


Java
class Student extends Person
Python
class Student(Person):
JavaScript
Con ES6 podemos hacerlo como en Java

class Student extends Person {
        constructor(nombre, apellido, altura, numeroDeEstudiante) {
        // con el método super() llamamos a las variables de Padre
        super(nombre, apellido, altura)
        this.numeroDeEstudiante = numeroDeEstudiante
    }
}
PHP
class Student extends Person
Ruby
class son < SuperClass
end


###################################################################################################################
##  📒📒📒 🤩 Encapsulamiento 🤩 📒📒📒


Es hacer que los datos sean inviolables, 
inalterable o hacer que se esconda, 
cuando se le asigne un Modificador de Acceso.

- Modificadores de Acceso:

- Public: Es el mas permisivos de todos, Accede a todo.
- Protected: Podrá ser accedido por la clase, paquetes y subclases.
- Default: Permite el acceso a nivel de clses de internas y paquetes (No podremos ver las herencias si ha detener (Osea subclases))
- Private: Solo podrá ser modificado dentro de la clase.



Cuando no se define un modificador de acceso, Java internamente asigna el modificador default.

Añadir un modificador de acceso en Java:

private Integer passenger;
	Getters y Setters: son métodos que permiten acceder y modificar un dato que esta protegido por un modificador de acceso.

Creando un gettter:

public Integer getPassenger() {   // Integer → Tipo de dato que va a retornar el método
    return passenger;
}

Creando un setter:

El getter permite acceder al dato protegido, mientras que el setter permite modificar dicho dato. Al ser ambos métodos de tipo public estarán disponibles desde cualquier lugar. A la hora de llamar estos métodos, no cambio nada, el proceso es el mismo que al llamar a cualquier otro método.

public void setPassenger(Integer passenger) { // void → Indica que el método no va a retornar nada.
    this.passenger = passenger;
}


Usar getters y setter es particularmente útil no sólo para proteger datos, sino también para validarlos. 


###################################################################################################################
##   📒📒📒 🤩 Generando polimorfismo en Java 🤩 📒📒📒


Muchas formas. Poli = muchas, morfismo = formas. NO es Poliformismo

Es construir métodos con el mismo nombre pero con comportamiento diferente

Polimorfismo Es una característica que nos brinda la herencia en la cual 
nos ayuda a invocar métodos de un objeto sin necesidad de indicar directamente 
qué tipo de clase es (definición mía, creo que me falta desarrollarla, me pueden ayudar).

En cuanto a las definiciones que se mencionan en este video, creo que son poco acertadas, 
la primera que dice es la de “…construir métodos con el mismo nombre…”, pero eso es sobrecarga, y 
la otra es la de “…cambiar el comportamiento de métodos…” pero eso es sobre escritura. 


Poliformismo: Muchas Formas
Construir métodos con el mismo nombre pero con comportamiento distinto
Ventaja: las clases pueden compartir atributos entre ellas

















