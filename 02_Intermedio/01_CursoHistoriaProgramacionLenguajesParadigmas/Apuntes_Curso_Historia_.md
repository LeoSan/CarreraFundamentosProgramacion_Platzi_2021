## Máquina abstracta
¿Qué es?

Computadora digital que ejecuta algoritmos los cuales están formalizados para que la maquina entienda.

Se trata de una maquina abstracta porque estamos aislando las características de una computadora para llevarlas a este concepto. La estructura general de una maquina abstracta es que tiene una memoria donde almacena datos y sus programas, además tiene un interprete del lenguaje de programación que maneja las secuencias de control del programa, controla la transferencia de datos y además maneja su memoria. Para realizar operaciones que nos darán un resultado que será la instrucción que deseamos y lo que resulta de estas instrucciones.

Puede realizar operaciones para:

Procesar datos primitivos: Un dato primitivo es aquél con el que un lenguaje de programación trabaja de forma nativa. Puede tener datos primitivos de tipo entero, flotante, booleanos, etc. Los datos primitivos de un lenguaje, no son necesariamente primitivos en otro.
Controlar secuencia de ejecución de operaciones: La maquina abstracta no solo será capaz de llevar la secuencia de operaciones, también estructuras de control y condicionales como If, Else. Podrá usar ciclos como el bucle While, etc.
Controla transferencia de datos: Manejará una transferencia de datos. Quiere decir que la información puede pasar de las instrucciones a una estructura de dato y viceversa. Con tal de que la información pueda ser utilizada para sus procesamientos.
Manejo de memoria: Es capaz de manejar la memoria, haciendo uso de este recurso para almacenar los datos que se derivan de las operaciones de los programas o incluso, almacenar información que le indiquemos.

Ciclo de ejecución

Al ser algo conceptual tanto su estructura como ciclo de ejecución, es el mismo para todas.

Primero inicia el programa, se traen las instrucciones a través del intérprete del lenguaje, el cual las decodifica, trae sus operandos y elige que operación ejecutará. Si la operación 1,2,3 o 4. O incluso puede ser el caso en el que se fuerza a detener la ejecución del programa. Si se elije una operación que lleva más procedimientos, esto traerá resultados, los cuales se almacenan en la memoria de la maquina y se vuelve a repetir el ciclo.

La maquina de Turing:

Es un ejemplo de maquina abstracta, han existido muchas replicas y la maquina de Turing lo que hace, es que tiene 2 cintas en cada lado y en el centro tiene un dispositivo lecto escritor, es capaz de leer o escribir sobre él mismo, en los rodillos hay instrucciones, indicadas con números 1 y 0. Puede indicar que escriba, lea, etc. En un punto profundo, podemos entender que la maquina de Turing, realiza los procesos que vimos antes.

-*/-/-/*-*/¿Qué son los paradigmas de programación?*/-/-*/-*/-/-/-*
Teoría o conjunto de teorías cuto núcleo central se acepta sin cuestionar y que suministra la base y modelo para resolver problemas y avanzar en el conocimiento

Clasificación de lenguajes
Basado en sus características y entendiendo que existen lenguajes multiparadigma.

Estilo de programación
Por su forma de abordar un problema o herramienta utilizadas.

Paradigmas puros
Smalltalk → P.O.O

Haskell → Funcional

Multiparadigma
C++, Java, JavaScript, Scala, PHP, Python, Ruby, F#, etc.

¿Qué significa tener un paradigma?

Prohibir o limitar ciertas acciones:

Efectos colaterales
Uso de goto.


-*/-*/-*/-*/-/¿Cuáles son los principales paradigmas de programación?-*/-/-*/-*/-*/

Existen mas de 100 paradigmas distintos

Principales paradigmas

-*/-*Imperativo
	Por procedimientos
	Orientado a objetos

*/-/Declarativo
	Funcional
	Lógico
	Matemático
	Reactivo

-*/-Dirigido por eventos

Programación imperativa
Ordenes directas de qué hacer
Enfocado al “Cómo”
Instrucciones paso a paso
Fortran, Java, C, Python, Ruby, PHP, etc.
Ejemplos


-*/-/-/-*/Programación declarativa

Se enfoca en el resultado
Reduce o elimina efectos colaterales
Prolog, LISP, Haskell, SQL, Elixir, XPath, Regex, etc.
Ejemplos


La arquitectura de Von Neuman es en la que se basan nuestros procesadores, una maquina puede almacenar un programa y las datos del programa, esta organizada de la siguiente manera:

Unidad de control: Se encargan de las etapas de captación y decodificación de una instrucción
Unidad lógica-aritmética o ALU: Se encarga de realizar operaciones matemáticas y de lógica
Memoria: Dónde se almacena nuestro programa
Dispositivo de entrada: Los datos de entrada
Dispositivo de salida: Salida de datos


Las funciones o procedimientos son subalgoritmos del algoritmo original.
Hay diferentes motivos para dividir un algoritmo en funciones o procedimientos:

Las funciones o procedimientos evitan la repetición de instrucciones al reutilizarlas mediante una llamada a la función o procedimiento, por lo que el algoritmo se vuelve más compacto.
Las funciones y procedimientos son algoritmos más fáciles de diseñar, corregir, mantener y modificar.
Las funciones o procedimientos ocultan los detalles de su especificación, de manera que para utilizarlas sólo es necesario conocer su interfaz.

-*/-*/-/-Primero lenguajes en implementar Procedural -/-*/-*/
Fortran
Cobol
ALGOL
Basic 


-/-*/-/-*/-*/Comparación POO -*/-*/-/-*

Procedual                     POO
Procedimientos             Metodos 
Registro                   Objeto 
Modulo                     Clase
llamada                    Mensaje      

¿No están invertidos los conceptos? El molde es la clase… Los objetos son las instancias… Y lo resalto porque al inicio no es tan fácil entender la abstracción la Programación Orientada a Objetos, qué es una clase, qué es una instancia, etc.

Clase -> Persona (molde)
Objeto -> Héctor (instancia)
Objeto -> RetaxMaster (instancia)
Objeto -> Cristian (instancia)
Las clases que “heredan”, igual, no son instancias, son clases que heredan de clases…

Clase -> Profesor hereda de Persona (molde)
Objeto -> Anahí (instancia)


-*/-/-*/- SIMULA PRIMER LENGUAJE ORIENTADO A OBJETO -*/-*// 



*/-*/-/-/*-*/-/Programación funcional*-/-/-/-*/*/-/-

Es un paradigma que usa funciones como “Ciudadanas de primera clase”. Puede crear funciones de orden superior. Prioriza el uso de recursividad y HOF para resolver problemas.

Una función puede recibir y dar salidas a otros datos como resultado, incluyendo a otras funciones. Se busca eliminar o reducir los efectos secundarios.

*/-*/-*/Origen/-/-*/-/*

En los años 30, Alonzo Church desarrolla el cálculo Lambda. 

Alan Turing demuestra que este es el equivalente a las maquinas de Turing.

A finales de los 50, se desarrolla LISP, implementando la notación lambda de Church.

/-*/-/Dato curioso*/--*/

La saga de video juegos Jack and Daxter, fueron desarrollados en GOAL (Game Oriented Assembly Lisp). Está basado en Lisp, fue desarrollado con programación netamente funcional.

(print "Hello, World!")
(defun factorial (n)
(if (= n 0) 1
(* n (factorial (- n 1)))))

-*/-/Funciones/-*/-

Relación entre dos conjuntos que asigna cada elemento del primero un elemento del segundo o ninguno.

En matemáticas una función es algo similar:

-/-/-/*Programación funcional/-*-*/-/-/

Es un paradigma que usa funciones como “Ciudadanas de primera clase”. Puede crear funciones de orden superior. Prioriza el uso de recursividad y HOF para resolver problemas.

Una función puede recibir y dar salidas a otros datos como resultado, incluyendo a otras funciones. Se busca eliminar o reducir los efectos secundarios.

Origen

En los años 30, Alonzo Church desarrolla el cálculo Lambda. Alan Turing demuestra que este es el equivalente a las maquinas de Turing.

A finales de los 50, se desarrolla LISP, implementando la notación lambda de Church.

-/-/-/-//*Dato curioso

La saga de video juegos Jack and Daxter, fueron desarrollados en GOAL (Game Oriented Assembly Lisp). Está basado en Lisp, fue desarrollado con programación netamente funcional.

(print "Hello, World!")
(defun factorial (n)
(if (= n 0) 1
(* n (factorial (- n 1)))))
-/-/-*/-/*/Funciones

Relación entre dos conjuntos que asigna cada elemento del primero un elemento del segundo o ninguno.

En matemáticas una función es algo similar:

Un tipo de dato u objeto que toma un valor “X” y genera un valor “Y”

Puede o no devolver un resultado.

f(X) = X + 3

f(X) = X^2 + 3

Aquí tenemos el ejemplo de una función en python. Toma dos parámetros y nos va a retornar como resultado, la suma de ambos parámetros.

def suma (a, b)
return a + b
def suma (a, b): 
a + b
operacion_1 = suma(3, 2)
Ciudadanas de primera clase

Son reconocidas por el lenguaje, se utilizan como un tipo de dato y en cualquier parte del programa.

-/*-/-*/Funciones de orden superior

Es una función que puede:

Tomar una o más funciones como parámetro o;
Retornar una función como salida.

*-/-/-*/Funciones puras

Son determinísticas.
Un valor de entrada da un solo valor de salida.
No genera efectos secundarios.
No incluye funciones impuras.

Funciones lambda
- No es mas que una funcion que no tiene nombre, pero tiene paramentros de entrada y nos da una salida 

-*/-/-*/Función anónima.
Comportamiento de uso único.
Contexto específico o corto tiempo.
Simplicidad.

-*/-/-Efectos secundarios
Es común escucharlo cuando hablamos de programación imperativa. 
Lo podemos ver cuando manejamos funciones o variables de contexto global o que están delimitadas. 
Ej: En JavaScript es muy importante tener un manejo del SCOPE (alcance de las variables)

Cuando escribimos código sabemos que lo que esta dentro de una función, no afecta a otra, si es que usamos la sintaxis correcta. Pero también existen funciones que utilicen parámetros o que tengan alcance global y puede tener efectos secundarios.

Forma en que alguien o algo se comporta ante un determinado estímulo.

Cambios observables

Estado de la aplicación.
Valores de datos.
Modificación de archivos, etc.
Lenguajes
LISP
SCHEME
CLOJURE
RACKET
ERLANG
HASKELL
F#
Como podemos ver, aquí está la función que se llama a sí misma y solamente modifica los parámetros cuando lo hace, como característica hay muchos paréntesis, pero es simplemente parte de la sintaxis.

(defun factorial (n)
(cond
((= n 0) 1)
((= n 1) 1)
(t (* n (factorial (- n 1 ))))))
Tenemos en Haskell donde calculamos el factorial de un número, en ejemplos anteriores habíamos podido ver como se define el tipo de dato, después se asignan los tipos de valores y se empieza a llamar a la función. Podemos ver que el código no es tan amplio como si lo hubiéramos escrito de forma no recursiva con otros lenguajes.

module Main where

import Text.Printf

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n factorial (n - 1)

line x = printf "%d! = %d\n" x $
factorial x

main = mapM_ line [0..16]
Aquí también tenemos un ejemplo con F# que es un lenguaje funcional y vemos que también es recursivo porque la función factorial se está llamando a sí misma.

let rec factorial n = 
match n with
| 0 | 1 -> 1
| _ -> n * factorial(n-1)


*-/-*/-*/-*/-*/-*/¿Qué es la programación lógica?/*-/-/-*/-/-*/-/-*-*/

Paradigma declarativo que expresa los objetivos como una colección de afirmaciones o 
reglas acerca de los resultados y restricciones en lógica matemática.

*/-/-/Áreas de aplicación*/-/-/-/

NLP (Procesamiento de lenguaje natural)
Recuperación de información en BBDD
Aplicaciones matemáticas


*/-/-*/Cláusula de Horn/-/-/-*/

La programación lógica se basa en las clausulas de Horn las 
cuales son preposiciones definidas por predicados, donde 
tenemos un hecho (algo que damos por sentado) y tenemos uno o varios predicados,
 lo correcto sería tener por lo menos 2, para poder determinar si algo es verdadero o falso, 
 también se les conoce como cuerpo/body.
1.PNG

H= Hecho/Head of the rule.

P= Predicado/Body

Ejemplo:

Podemos decir que es verdadero que está nevando en la ciudad, C es el nombre de la ciudad. Si está lloviendo y hace frío, entonces es verdadero que está nevando. Y por el contrario si quisiéramos negar que está lloviendo, pero hace frío, entonces es falso que está nevando. Esto tiene una estrecha relación con las tablas de verdad.

nevando© ← lluvia©, frío©

/-/-*/-*/Origen*/-*/-*/

Se origina en los 60’s cuando Cordell Green propuso el uso de cláusulas en programas a finales de los 60.

Prolog impulsó este paradigma.

Lenguajes

Prolog -> Dio el impulso 
Alf
Fril
Mercury
Oz
Visual Prolog
XSB

No es muy frecuente este paradigma de programación en la industria, 
se usa más para investigación y cuestiones académicas, dada su naturaleza.

% Hola mundo

?- write('Hello World!'), nl
> Hello World!
> true


En este ejemplo podemos ver como le indicamos que hay personas 
que hablan un lenguaje, hacemos la evaluación de la persona 1 con la persona 2 
y cuál es el resultado. 

Luego hacemos también la evaluación, preguntando “Quién habla francés” El resultado retornado debería ser “Juan”

speaks(juan, french)
speaks(isabel, english)
speaks(eduadro, french)
speaks(eduardo, english)

talkswith(Person1, Person2) :-
speaks(Person1, L),
speaks(Person2, L),
Person1 \= Person2

?- speaks(Who, French)

-*/-*/-*/Programación dirigida por eventos/-*/-/-/-*/
Se caracteriza porque no controla la secuencia de ejecuciones, reacciona a los sucesos ocurridos.

Generalmente los programas corren indefinidamente integrando manejadores de eventos (event handlers).

Eventos

Clicks
Teclas
Sensores
Mensajes
Triggers
Casos de aplicación

GUIs
Aplicaciones web
Sistemas de booking
Sistemas de alarmas
Robótica
Videojuegos
Cómo funciona

Sí lo comparamos con la programación imperativa, tenemos una secuencia de pasos que se van a ejecutar de manera secuencial y después puede repetirse el ciclo o puede llegar a detenerse el programa porque así lo decidimos o porque forzamos su detención. En la programación dirigida por eventos, tenemos un ciclo que puede ser un while el cuál mientras haya una condición sea verdadera o falsa, se puede estar ejecutando de manera indefinida. Entonces este ciclo va a recibir ciertos eventos que van a modificar algunas variables de estado, que puede ser como el caso de un videojuego, el contador de vidas, en el cual la condición dice que mientras que el número de vidas sea mayor que 0, se va a estar ejecutando el programa, pero habrán ciertos eventos que van a hacer que ese número de vidas disminuya o aumenten y por consecuencia el videojuego termine en ese ciclo.

Lenguajes

Java

Javascript

C#

Librerías/Frameworks de GUI

-JavaFX, React.js, PyQT

Prácticamente cualquier lenguaje orientado a objetos.

-*/-*/-/-*/Programación dirigida por eventos-/-*/-/-/*
Se caracteriza porque no controla la secuencia de ejecuciones, reacciona a los sucesos ocurridos.

Generalmente los programas corren indefinidamente integrando manejadores de eventos (event handlers).

Eventos

Clicks
Teclas
Sensores
Mensajes
Triggers
Casos de aplicación

GUIs
Aplicaciones web
Sistemas de booking
Sistemas de alarmas
Robótica
Videojuegos
Cómo funciona

Sí lo comparamos con la programación imperativa, tenemos una secuencia de pasos que se van a ejecutar de manera secuencial y después puede repetirse el ciclo o puede llegar a detenerse el programa porque así lo decidimos o porque forzamos su detención. En la programación dirigida por eventos, tenemos un ciclo que puede ser un while el cuál mientras haya una condición sea verdadera o falsa, se puede estar ejecutando de manera indefinida. Entonces este ciclo va a recibir ciertos eventos que van a modificar algunas variables de estado, que puede ser como el caso de un videojuego, el contador de vidas, en el cual la condición dice que mientras que el número de vidas sea mayor que 0, se va a estar ejecutando el programa, pero habrán ciertos eventos que van a hacer que ese número de vidas disminuya o aumenten y por consecuencia el videojuego termine en ese ciclo.

Lenguajes

Java

Javascript

C#

Librerías/Frameworks de GUI

-JavaFX, React.js, PyQT

Prácticamente cualquier lenguaje orientado a objetos.


-*/-*/-/*-/-*Programación concurrente-*/-*/-/-*/-*/
Analogía: Imagina ser el propietario de una panadería, mientras se calienta el horno, estás cortando masa, cortándola, preparándola y una vez que se están horneando, al sacarlos hay que esperar a que se enfríen y después colocar una cobertura de chocolate. Tú intentarás optimizar los recursos, mientras el horno se está calentando, debes preparar más masa, para que así, cuando termine, inmediatamente meter el otro lote de masa o si contratas a una persona que te ayude, dividirás las tareas, al hacer esto, estás ejecutando el paralelismo, que es dividir las tareas entre los recursos disponibles, siempre y cuando puedan dividirse.

Concurrencia

Coincidencia, concurso simultáneo de varias circunstancias.

Es cuando hay una serie de peticiones a un mismo recurso que podría ser limitado y se están atendiendo esas solicitudes de forma parcial o totalmente desordenada. Una analogía útil para entender, puede ser la panadería, imagina que tu panadería empieza a crecer y a ser muy grande, por lo tanto es bastante concurrida y los clientes empiezan a acumularse, por lo tanto, tú no puedes atenderlos a todos, empezarían a enojarse por no ser atendidos de forma rápida y ordenada. Una forma de solucionarlo, podría ser un sistema de tickets, para así atender a los clientes en su orden de llegada.

Concurrencia vs Paralelismo

En la concurrencia

tenemos una serie de peticiones con un solo recurso limitado para atenderlos, ¿Cuál sería el orden, la prioridad? etc.

En el paralelismo

Tenemos recursos divididos que pueden atenderlos de forma simultanea sin ningún problema

El paralelismo y la concurrencia, son conceptos diferentes pero que van de la mano, por ello debemos entender ambos para entenderlos entre sí.

Secuencia vs Concurrencia

En una secuencia

Vamos a tener los pasos A, B, C, D. Y estos serán atendidos en el orden que se hizo la petición.

En la concurrencia

Podemos iniciar en el proceso A, saltar al D, luego al C, completar el A y después pasar al último proceso.

Todo esto se hace mediante los hilos de un procesamiento

Estados de un hilo

Creado: No está listo para correr.
Ejecutable/Listo: Espera para ejecutarse.
Ejecutando: Se ejecuta en el procesador.
Bloqueado: Espera a entrar al código que requiere acceso al recurso compartido o abandona el procesador.
Terminado: Se ha detenido y no puede reiniciarse.
Sección crítica del hilo

Es una sección de código que requiere acceso exclusivo a una variable compartida.

Comunicación entre hilos

Acceso exclusivo a un recurso compartido.
Intercambiar información con otro hilo.


-*/-/-/-/Problemas de concurrencia*/-/-*/-/-*/
## Carreras (Critical races)

Sucede cuando dos o más hilos desean acceder a un recurso lo más pronto posible. Podemos ver este ejemplo, 
tenemos una variable C, inicializamos en 0, pero después en alguna parte del código a C, 
le asignamos el valor de C + 1, entonces un hilo llegará primero y al ver que vale 0, 
le agregará el valor de 1, almacena ese dato y ahora C vale 1. 

Pero sí otro hilo llega después, pensará que C vale 1, entonces añadirá otro 1, 
almacenará ese dato y entonces C vale 2. Esto puede ser un problema en un 
sistema automatizado de dosificación de medicamentos. 

Sí el sistema es concurrente, ¿Entonces que hará? ¿Le dará una dosis o dos dosis? ¿Cómo se resuelve?.

## Puntos muertos (deadlock)

Ocurre cuando un hilo espera por un evento que nunca sucederá.

Para que suceda un punto muerto deben de cumplirse 4 condiciones:

Los hilos deben tener derechos exclusivos a los recursos.
Los hilos deben contener algunos recursos mientras esperan otros.
Los recursos no se pueden eliminar de los hilos en espera.
Existe una cadena circular de hilos en las que cada uno contiene uno o más recursos del siguiente hilo.
Problema de los filósofos

El problema plantea que hay una mesa redonda donde hay 5filósofos que están conversando, frente a ellos hay un plato de comida, a su derecha y a su izquierda, hay otros filósofos y hay un palillo chino a la derecha y otro a la izquierda, para comer se necesitan ambos palillos chinos, eso significa que habrá una persona que no comerá. Hay muchas formas de abordar el problema, pero esas soluciones pueden dar otros problemas, podría ser un sistema de turnos, pero entonces algunos se quedarían esperando hasta que la comida esté fría o tenga mucha hambre. Podríamos hacer que se alternen los turnos de comida.

## Estrategias

Evitar que se cumpla alguna de las condiciones

Semáforos: Funcionarían como una variable de tipo entero, asociado a un mecanismo de cola de hilos. Si el semáforo toma valores de “0” y “1”, es binario. En caso contrario es un “semáforo contador”.
Monitores: Estructuras de datos abstractas basados en los monitores o kernel de los S.O.
Los monitores tienen 4 componentes principales:

Inicialización: Contiene código a ser ejecutado.
Datos privados: Procedimientos que se utilizan desde dentro del monitor.
Métodos del monitor: Procedimientos que se pueden llamar desde fuera.
Cola de entrada: Hilos que llaman a algún método del monitor pero no tienen permiso para ejecutarse aún.

Algunos lenguajes

JavaScript
C#
Golang
Rust
Elixir
Haskell


### Historia de algunos lenguajes de programación

Década de los 40: primeras computadoras y lenguajes ensambladores.

La primer computadora no fue una maquina abstracta, eso es un concepto teórico, sin embargo, sabíamos que las computadoras épocas atrás, tenían tamaños enormes, ocupaban canchas de tennis, trabajaban con switches.

Hay distintos criterios para definir cuál fue la primer computadora y algunos autores mencionan que fue la EDSAC. Sus características:

Electrónica y digital.
Realiza 4 operaciones básicas.
Es programable.
Almacena programas y datos.
Las precursoras

Carecían de herramientas lingüísticas para ser programadas al nivel de la EDSAC.

Iniciaron con código máquina, llamados first-generation languages (1GL)

Lenguajes ensambladores

Representaciones simbólicas del lenguaje máquina.
Un programa “ensamblador” traduce las instrucciones.
Cada maquina tenía su propio lenguaje, había nula portabilidad.
Son llamados second-generation languages (2GL)


# Década de los 50: Fortran y Algol
En la Década de los 40 Aparecieron los primeros lenguajes para comunicarnos
con las máquinas pero tenían ciertas limitaciones técnicas.

## Luego

El principio de los 50 aparecieron los primeros lenguajes de alto nivel,
se caracterizaban por ignorar las limitaciones del hardware y que ahora se maneja el concepto de portabilidad.

## Primeras Máquinas

- ´El UNIVAC´
Fue la primera computadora comercial fabricada en Estados Unidos,
entregada el 31 de marzo de 1951 a la oficina del censo.

Fue diseñada principalmente por J. Presper Eckert y John William Mauchly,
autores de la primera computadora electrónica estadounidense,
la ENIAC. Durante los años previos a la aparición de sus sucesoras,
la máquina fue simplemente conocida como "UNIVAC".

Con este computador aparece por primera vez la figura del programador.
Se donó finalmente a la universidad de Harvard y Pensilvania.

- ´IBM 704´
Solo emitieron 5 en el mundo.
La máquina IBM 704 fue la primera computadora producida en
masa con hardware basado en aritmética de coma flotante,
introducida por IBM en abril de 1954.

La 704 mejoró significativamente a la IBM 701,
y en términos de arquitectura e implementación
se puede decir que no fue compatible con su predecesora

## Porque hay tantos lenguajes de programación:
- Netamente comercial
- Aplicaciones específicas
- Nuevas metodologías de trabajo
- Implementaciones como desarrollador
- Nuevos Paradigmas

# Primeros lenguajes de programación
## Fortran 1957
- Desarrollado por IBM y John Backus
- Uso de tarjetas perforadas de 80 columnas.
- Uso del GOTO.
- Uso en trabajos numéricos y científicos.

## ALGOL58-60 1960
- Uso de anotaciones matemáticas.
- Gramáticas generativas
- Estructura de control



Corregido con https://www.corrector.co/es/

## Década de los 70: C, Pascal, Smalltalk, Prolog, Meta Language

### Lenguaje C 

- C es un lenguaje de programación de propósito general 
- Originalmente desarrollado por Dennis Ritchie entre 1969 y 1972 en los Laboratorios Bell
- tiene su nombre como evolución del anterior lenguaje B-  a su vez basado en BCPL. 
- Segun su proposito puede denominarse lenguaje de alto nivel y de bajo nivel. 
- Se trata de un lenguaje de tipos de datos estáticos, débilmente tipado, de medio nivel, que dispone de las estructuras típicas de los lenguajes de alto nivel pero, a su vez, dispone de construcciones del lenguaje que permiten un control a bajo nivel.
- Causa de ser de relativamente bajo nivel y de tener un modesto conjunto de características, se pueden desarrollar compiladores de C fácilmente. En consecuencia, el lenguaje C está disponible en un amplio abanico de plataformas 
- Una biblioteca de C es una colección de funciones utilizadas en el lenguaje de programación C.

### Lenguaje Pascal 
- Es un lenguaje de programación creado por el profesor suizo Niklaus Wirth entre los años 1968 y 1969, y publicado en 1970
- Su objetivo era crear un lenguaje que facilitara el aprendizaje de programación a sus alumnos, utilizando la programación estructurada y estructuración de datos 
- Pascal se caracteriza por ser un lenguaje de programación fuertemente tipado. 
- Antes de adentrarse en el diseño de Pascal, Niklaus Wirth había desarrollado Euler y ALGOL W, y más tarde pasó a desarrollar los lenguajes Modula-2 y Oberon, al estilo de Pascal.
- Pascal fue el lenguaje primario de alto nivel utilizado para el desarrollo en el Apple Lisa, y en los primeros años del Macintosh.
- Pascal maneja el tipo de variable de manera fija en su definición; la asignación a variables de valores de tipo incompatible no está permitida
- Posee compiladores free como: Delphi, Free Pascal, GNU Pascal, Turbo Pascal, Oxygene.  

### Lenguaje Smalltalk
- Los orígenes de Smalltalk se encuentran en las investigaciones realizadas por Alan Kay, Dan Ingalls, Ted Kaehler, Adele Goldberg y otros durante los años setenta en el Palo Alto Research Center de Xerox 
- Es un lenguaje reflexivo de programación, orientado a objetos y con tipado dinámico.
- Por sus características, Smalltalk puede ser considerado también como un entorno de objetos, donde incluso el propio sistema es un objeto.
- Un programa Smalltalk consiste únicamente de objetos, un concepto que se utiliza universalmente dentro de todo sistema Smalltalk. 
- Los objetos se comunican entre sí mediante el envío de mensajes
- Las definiciones de estas operaciones en los objetos son llamadas métodos.
- En Smalltalk la recolección de basura es integrada configurable. 
- Smalltalk-80 provee reflexión computacional y estructural, ya que es un sistema implementado en sí mismo. La reflexión estructural se manifiesta en que las clases y métodos que define el sistema son en sí mismos objetos también y forman parte del sistema mismo

### Lenguaje Prolog
- Proveniente del francés PROgrammation en LOGique. 
- Maneja paradigma Programación lógica. 
-​ Es un lenguaje de programación lógico e interpretado usado habitualmente en el campo de la Inteligencia artificial.
- Se trata de un lenguaje de programación ideado a principios de los años 70 en la Universidad de Aix-Marseille I (Marsella, Francia) por Alain Colmerauer y Philippe Roussel. 
- La primera versión estable de Prolog fue programada en ALGOL. 
- Los programas en Prolog se componen de cláusulas de Horn que constituyen reglas del tipo "modus ponendo ponens", es decir, "Si es verdad el antecedente, entonces es verdad el consecuente"
- El antecedente puede ser una conjunción de condiciones que se denomina secuencia de objetivos. Cada objetivo se separa con una coma y puede considerarse similar a una instrucción o llamada a procedimiento de los lenguajes imperativos
- 

### Lenaguaje Meta Language
- Maneja paradigma declarativo 
- Diseñado en 1970 en la Universidad de Edimburgo.
- Diseñado por Robin Milner 
- Programación simbolica 
- Tomo parte de la seguridad de Pascal
- Primer lenguaje de diferencial de tipo de datos. 
- El lenguaje para el cual ML era metalenguaje es pplambda, una combinación del cálculo de predicados de primer orden y el lambda-cálculo polimórfico sencillamente tipificado. 
- Frecuentemente se clasifica a ML como un lenguaje funcional impuro dado que permite programar imperativamente con efecto colateral. 
- Entre las características de ML se incluyen evaluación por valor, álgebra de funciones, manejo automatizado de memoria por medio de recolección de basura, polimorfismo parametrizado, análisis de estático de tipos, inferencia de tipos, tipos de datos algebraicos, llamada por patrones y manejo de excepciones. 
- Esta combinación particular de conceptos hace que sea posible producir una de los mejores compiladores actualmente.  disponibles


## Notas: 
- Los lenguajes de programación C y Pascal están basados en ALGOL a diferencia Prolog esta basado en APL.



### Década de los 80: computadoras personales, POO, C++, Python

## Computadoras personales 
- Es un tipo de microcomputadora diseñada en principio para ser utilizada por una sola persona.

## POO  

## C++ 
- Se creo en 1986 definido  por Bjarne Stroustrup como parte de una extensión de C 
- Incorpo el uso de clases 
- Mejora el sistema detipado
- Manipula objetos de forma directas
- Mejora el sistema de herencia 


## Python
- 
- Es un lenguaje interpretado de alto nivel 
- Multiparadigma soporta POO, programación funcional, imperativa  
- Es administrado por la Python Software Foundation. Posee una licencia de código abierto, denominada Python Software Foundation License
- Guido van Rossum en el Centro para las Matemáticas y la Informática
- El nombre del lenguaje proviene de la afición de su creador por los humoristas británicos Monty Python
- Filosofia Sen, Bello es mejor que feo, Explicito es mejor que  implicito, Simple es mejor que complejo, la legibilidad cuenta, complejo es mejor que compicado.  



### Década de los 90: desarrollo web, Java, JavaScript

## Java 
- 1990 Desarrollado por el green team,  Dirigido por Jim Goslin en Sun Microsystems
- Top 10 de los lenguajes mas populares 
- Objetivo era ser utilizado en dispositivos de poder limitado conectados en una red. 
- Vieron el potencial en la web utilizando applests 
- Te demanda instala java mas usado en los sistema de gobierno. 
- JVM Java Virtual Machine se incorpora en 1995
- Primer navegador Netscape usa JVM
- Seguridad no genera errores de ejecución 
- Simplicidad del lenguaje
- Garbage Collector 
- Manejo implicito de punteros
- Uso de hilos para concurrencias  

## Desarrollo web
- Falto explicar esto ¿? ¿? Esta en el curso de (Curso Historia Web)[https://platzi.com/clases/introweb/]

## JavaScript
- JavaScript fue desarrollado originalmente por Brendan Eich de Netscape con el nombre de Mocha, el cual fue renombrado posteriormente a LiveScript,
- «JAVASCRIPT» es una marca registrada de Oracle Corporation
- Basado en prototipos, Funciones variádicas, Funciones como métodos, Arrays y la definición literal de objetos, Expresiones regulares, eventos. 
- Se usa del lado del cliente y del lado del servidor. 
- JavaScript está formado casi en su totalidad por objetos. Los objetos en JavaScript son arrays asociativos, mejorados con la inclusión de prototipos

https://platzi.com/clases/examen/50d78ea1-502d-4800-bb3d-e96872445526/examen_usuario/
