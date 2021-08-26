## Ventajas de Buenas Practicas. 

- Podras recordar de manera coherente un proyecto si lo dejaste de usar
- Mantenimiento mejorado tanto los colaboradores 
- El cliente 

Ejes que hacen la calidad del código

Caracteristicas  Externas: 
Son las características que observan los usuarios al interactuar con el software.

Caracteristicas Internas: 
	Son aquellas características que solo estarán visibles cuando analicemos el código independientemente del software que se haya producido con ese código
	
		- Legibilidad : Cuanto esfuerzo implica leer el código y entenderlo 
		- Mantenibilidad: Si toma  mucho tiempo en adaptar el código a nuevos requerimientos 
		- Testibilidad: El esfuerzo en realizar pruebas para demostrar el funcionamiento del código. 

Código prolijo 

El codigo debe ser claro y debe ser entendible para humanos
Usar standars, todo el codigo debe tener la misma sintaxis

Tips para un código limpio

- Definir estandar respetalo
- Define un estandar de codificación. (Buscar standar de codificación)
- Respeta el estándar elegido.
- Apóyate en alguna herramienta linter para revisar la legibilidad de tu código.

	
Tips 
Lindo es mejor que feo.
Explícito es mejor que implícito.
Simple es mejor que complejo.
Complejo es mejor que complicado.
Plano es mejor que anidado.
Espaciado es mejor que denso.
La legibilidad es importante.
Los casos especiales no son lo suficientemente especiales como para romper las reglas.
Sin embargo la practicidad le gana a la pureza.
Los errores nunca deberían pasar silenciosamente.
A menos que se silencien explícitamente.
Frente a la ambigüedad, evitá la tentación de adivinar.
Debería haber una, y solamente una, manera obvia de hacerlo.
A pesar de que no sea obvio a menos que seas Holandés (como GvR)
Ahora es mejor que nunca.
A pesar de que nunca es muchas veces mejor que justo ahora.
Si la implementación es dificil de explicar, es una mala idea.
Si la implementación es fácil de explicar, quizás sea una buena idea.
Los espacios de nombres son una gran idea, ¡tengamos más de esas!	


Identificadores mnemotécnicos, específicos y precisos
💡 Recuerda: Atención a los identificadores que creas, es importante que estos sean explicativos y podamos entender que es lo que hacen o contiene.

def fac(num):
	if (num==0 or num==1):
		return 1
	else:
		return num*fac(num-1)

def fibonacci(num):
	if (num==1 or num==2):
		return 1
	else:
		return fibonacci(num -1) + fibonacci(num-2)
	
print(fac(5))
print(fibonacci(10))

list( $variable1, $variable2 ) = nombre_funcion_retorna_array( $variable );

## Código modular
Este se trata de hacer código que este organizado de forma en pequeños bloques que se unan mediante código.

⚠ A mayor cantidad de código menos visible los bugs.

El tipo de código que con frecuencia vamos a modularizar son:

Los bloques que están dentro de un Ciclo for o while
Los bloques dentro de un condicional
Código que hace calculos complejos


## Código reutilizable
La idea del código reusable nace de la necesidad de ‘Don´t repeat yourself’ o mejor conocido como DRY. Este nos ayudará a prevenir bugs y también, encontrar los más fácil.

⚠ Copiar código será tu peor enemigo para tener un código fácil de mantener

Código organizado
Cuando hablamos de código organizado nos referimos a cómo está el código distribuido en nuestro sistema de archivos. Esto significa que necesitas organizar el código y que según cómo se llame el archivo, este adentro debe contener únicamente lo que su nombre indica.

Quiere decir, que agruparemos archivos que tengan un contenido similar en directorios.

⭐ Esto se trata de convención, no una imposición.

PHP ej:
/public
/src
/tests
/vendor

## Evitar el hardcoding
El hardcoding es la práctica de escribir valores literales en vez de identificadores. Debemos asegurarnos de que solo necesitemos hacer un cambio en un solo lugar y que el código este correcto.

Evitar Efectos Colaterales 

Es preferible que todas estas variables que potencialmente van a ser modificadas se encuentre en un lugar común y no en las partes del código complejo.

Es importante conocer las características del lenguaje de programación con el que se está codificando. Por ejemplo, yo en realidad no conozco PHP, pero en otros lenguaje de programación compilados y orientados a objetos, existe algo llamado el ámbito de las variables, concepto que evita (o busca evitar) lo que conocemos cómo código espagueti.
Hablando estrictamente de las variables globales, si bien estas deben ser usadas al mínimo, siguen siendo un recurso que es importante tener en cuenta, no son prohibidas, solamente hay que saber usarlas, y por supuesto: evitar que se modifiquen una vez asignadas, por ejemplo las variables de inicio de sesión que necesitaremos para validar el acceso por roles a distintas partes de nuestros sistemas.
Un par de links al respecto:
Ámbito
El ámbito de una variable (llamado "scope" en inglés) es la zona del programa en la que se define la variable. JavaScript define dos ámbitos para las variables: global y local.

Espagueti

El código espagueti es un término peyorativo para los programas de computación que tienen una estructura de control de flujo compleja e incomprensible. Su nombre deriva del hecho que este tipo de código parece asemejarse a un plato de espaguetis, es decir, un montón de hilos intrincados y anudados.

Variables globales
El problema de las variables globales es que crea dependencias ocultas. Cuando se trata de aplicaciones grandes, ni tú mismo sabes/recuerdas/tienes claro los objetos que tienes y sus relaciones.

Principios SOLID: Single Responsibility Principle
SOLID son cinco principios básicos de la programación orientada a objetos que ayudan a crear software mantenible en el tiempo.

## SOLID significa:

S: Single Reponsibility Principle (SRP): Una clase deberia tener un unico objetivo o responsabilidad, es tener alta cohesion 
O: Open/Closed Principle (OCP): Es la habilidad de adaptabilidad sin derrumbar la estructura principal.  
L: Liskov Substitution Principle (LSP): Este principio permite que una clase hijo que extiende de padre pueda usar funciones sin importar si es hijo o padre, herencia entendible y sostenible en el tiempo
I: Interface Segregation Principle (ISP): Este principio es como estructurar nuestras interfaces, no se le exija metodos que no son propios o que no necesita, mantener las interfaces organizadas recuerda una interfaz implemente lo que realmente necesita 
D: Dependency Inversion Principle (DIP): Este principio como se vinculan las diferentes clases que deben darle soporte a otras, se dividen clases de alto nivel  son las que manejan la logica e negocio, las clases de bajo nivel solo ayudan a las clases de alto nivel cumplir sus tareas. 

La S se trata de una clase que debe tener sólo una razón para cambiar.

Patrones de diseño: Singleton 
El patrón Singleton permite restringir la creación de objetos pertenecientes a una clase o al valor de un tipo a un único objeto. 

Una abstracción se enfoca en la visión externa de un objeto, separa el comportamiento específico de un objeto, a esta división que realiza se le conoce como la barrera de abstracción, la cuál se consigue aplicando el principio de mínimo compromiso.
.
Pero… ¿Qué es el principio de mínimo compromiso? Se refiere al proceso por el cuál la interfaz de un objeto muestra su comportamiento específico y nada más, absolutamente nada más.
(Fuente)
.
En otras palabras la abstracción se enfoca en “que hace” sin importar en “cómo lo hace”.
.
Es como solo fijarse en el nombre de una función calcularHorasDelAño(), sin importar el código que hay dentro, solo nos quedamos con el nombre, que ya nos dice “que hace”, y no "como lo hace".


function nombre_funcion_retorna_array(){

	Procesos
	return [$variable1, $variable2 ];
}

list( $variable1, $variable2 ) = nombre_funcion_retorna_array( $variable );


## Patrones de diseño: Singleton

Estos son soluciones conceptuales que se pueden aplicar a la hora de cómo diseñar tus clases. Y existen 3 tipos de patrones:

Creación → Se encargan de cómo crear nuevas instancias de nuestro objetos.
Estructurales → Nos dicen cómo debemos estructurar nuestras clases.
Comportamiento → Nos dicen cómo deben comportase nuestros objetos.
⚠ Esto no se trata de código, sino de ayudas de cómo pensar nuestra aplicaciones.

También recuerda que estos patrones no son aplicables siempre. Son ideas que nos pueden ayudar a pensar.

Singleton
Este patrón se puede pensar como un patrón de creación o de comportamiento. La idea consiste en tener un clase que tenga una sola instancia en nuestra aplicación. Usualmente este patrón se utiliza para optimizar recursos.

Este se encarga de evitar a toda costa de exista más de una instancia. Para conseguir esto debemos hacer private el constructor. Para instanciar esta clase, crearemos una función que normalmente se llamará getInstance y está se encargará de comprobar si ya existe una instancia, si no existe una, la función la creará.

Patrones de diseño: Factory
Se trata de un patrón creacional, o sea, que nos ayuda a crear nuevas instancias de objetos.

El patrón factory consiste en utilizar una clase constructora abstracta con unos cuantos métodos definidos y otro(s) abstracto(s).

Patrones de diseño: Command
Se trata de un patrón de comportamiento, y este se utiliza cuando existe alguna operación especialmente compleja que debe ser realizada desde diferentes puntos de entrada.

¿Qué es una interfaz y qué son las clases abstractas?
La siguiente explicación menciona a Java pero se puede aplicar a muchos lenguajes de programación las misma definiciones:



Las clases abstractas cuando tienen métodos define lo que tienen qué hacer pero no cómo se debe de hacer. Estas clases pueden ser heredadas por X clases que necesitemos pero no pueden ser instanciadas.

En Java no se puede heredar de más de una clase, para esto utilizamos las interfaces. Aquí igual se especifica qué se debe de hacer pero no el cómo.

A diferencia de una clase abstracta una interfaz no puede hacer nada por si sola, o sea, que las clases hijas están encargadas de definir el comportamiento de todos los métodos abstractos de forma obligatoria.

En otra palabras, las interfaces serán contratos que indicarán que es lo que se debe de hacer sin proveer ninguna funcionalidad.

Resumen Clase:
Una parte importante del desarrollo de SW es la corrección de los errores que siempre va estar ahí y es imposible de evitarlos. Para eso es identificarlos lo mas pronto posible y para eso existen muchas formas de encontrar estos problemas en el código. Pero hay una que nunca debe dejarse de lado y son las pruebas, pruebas manuales, y estas pruebas son realizadas por personas que están probando el nuevo sistema lo cual consume tiempo y esfuerzo, costoso y poco confiable. Otra técnica que se utiliza bastante es el testing automatizado es decir escribir programas que sean capazas de probar los programas y reportar los fallos, esto es mas rápido, menos costoso y mas confiable, pero ahí cosas que no se pueden testiar en forma automatizada como es fácil de manejar, tiene buen diseño esto se tiene que realizar de manera manual.
Para testing automatizado se tienen los testing unitarios y testing de integración.
Testing unitarios tomamos cada unidad de SW y validarlo por separado para ver si hace lo que tiene que hacer, esto nos ayuda a refactorizar, tener mas estructurado el código, fácil al integración con otras partes y documentado…
Testing de integración, es el complemento de test unitarios, es decir validar la interacción entre los diferentes componentes de del SW.
Si tenemos buenas pruebas unitarias también debemos re realizar unas pruebas de itegracion.

https://sourcemaking.com/design_patterns


Test Driven Development
Este consiste en primeros las pruebas y luego el software. Etapas:

Escribir un test que falle
Hacer que el código funcione
Eliminar la redundancia
Escribir el siguiente comando para que nos de los resultados del test mas el nombre del test.

php vendor/phpunit/phpunit/phpunit --testdox tests/CalculatorTest.php


Pull requests
El Pull Requests es una herramienta desarrollada por Github. Este se trata de generar una solicitud al dueño del repositorio ofreciéndole una mejora del código.

Documentación
Una buena práctica cuando se trabaja en equipo es documentar. Se trata de dejar por escrito las decisiones que hemos tomado, como está funcionando el código, etc.

¿Qué documentar?
El estado de nuestro código para que se puede implementar nuevas funcionalidades a futuro.
¿Cómo documentar?
¿Quiénes van a leer nuestra documentación?
¿Cuál el perfil de nuestra audiencia?
¿Dónde documentar?
En nuestro código
Otro repositorio externo, algo tipo Notion o una página web como Atlanssian.
¿Cuándo documentar?
Lo ideal es escribirla mientras el código se va desarrollando.

A quién beneficia el código bien escrito

La primera persona a quien beneficiará es a nosotros mismos, lograremos entender nuestro código no importa el tiempo que pase.

Nuestros compañeros lograrán entender muchísimo más nuestro código luego de todas las buenas prácticas que hemos realizado.

Y finalmente a nuestro cliente que aunque no pueda ver al detalle nuestro código, estará mejor organizado y podrá ser leído,mantenido por cualquier persona.

El código bien escrito debe cumplir con

Legibilidad (entendible al primer vistaso),
Mantenibilidad (Pueda evolucionar sin ningún problema o agregar nuevas funcionalidades)

Testeabilidad (que se puedan realizar pruebas automatizadas).

Temas a Tener en cuenta

La forma de escribir codigo

Los nombres utilizados

El diseño de las clases

No solo se trata de código la documentación es importante

Los Framework aplican todas buenas practicas y te permiten concentrarte en los problemas puntuales de tu APP