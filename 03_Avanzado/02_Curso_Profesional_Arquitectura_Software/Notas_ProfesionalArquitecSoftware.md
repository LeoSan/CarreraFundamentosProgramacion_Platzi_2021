# ?? Resumen Profesional  de Arquitectura  ?? 

Que es un atributo de calidad. 


"Los atributos de calidad son la expectativas de usuario, 
en general impl��citas, de cu��n bien funcionar��a un producto."
Software Requirements: 3rd Edition (Wiegers, Betty, 2013)



## ?? Atributos: Idoneidad funcional   ??  ##

La Idoneidad Funcional tiene que ver con la conexion del usuario 
(tareas u objetivos a resolver con el sistema) y como est��n implementadas 
funcionalmente en dicho sistema. Se puede dividir en 3 partes:

> Completitud funcional: Cuan completa esta la implementacion con respecto a lo que 
se espera del sistema. 

- Requerimientos Funcionales vs Funcionalidades implementadas

> Exactitud funcional: Cuan preciso es el sistema para implementar lo requerido. 
- Resultados Esperados vs Resultados Obtenidos

> Pertinencia funcional: Cuan alineado esta lo que se implemento con lo requerido. 
- Objetivos Cumplidos vs Objetivos Esperados

## ?? Atributos: Eficiencia de ejecucion   ??  ##

Trata de que tan eficiente es el sistema a la hora de responder y 
del propio sistema, como aprovecha o desaprovecha los recursos.

Se divide en 3 partes cada una con atributos que deben ser comparados entre si:

> Tiempo a Comportamiento: Este nos dice cuan bueno es el sistema respondiendo al usuario; 
  Espec��ficamente cuanto tarde el sistema y cuanto esperamos que ese sistema tarde.

- Se mide: a traves de la medicion de la respuesta, dado un estimulo y luego 
           compararlo con el tiempo que esperamos que tarde el sistema.

> Uso de Recursos: Cuanto el sistema aprovecha esos recursos en su contexto, 
  sea la RAM, el SO, ETC. el objetivo es saber cuan bien o mal se est��n usando.

- Se mide: medir cuanto ocupa el sistema del RAM o CPU 
           y si soporta o tiene la capacidad entera de recursos para soportar.

> Capacidad: Cuanto soporta el sistema en cantidad de pedidos, 
  es decir tiene un limite en la cantidad de una cantidad m��xima 
  de usuarios usando el sistema a la vez.

- Se mide: Cuanto esperamos que el sistema responda en ciertos casos, 
           por ejemplo en carga, escritura o lectura y luego de saber cuanto 
           esperamos que responda. probar cuanto responde realmente.


## ?? Atributos: Compatibilidad ??  ##

Este agrupa los atributos de cuanto el sistema coexiste o interopera con otros sistemas, 
es decir; Cuanto puede el sistema vivir en un contexto mas grande.

> Interoperabilidad: Cuan facil es comunicarse con este sistema, 
 cuanto define su sistema de comunicacion, incluso cuanto despues 
 este sistema puede comunicarse con otros.

- Se mide: A traves de casos puntuales, por ejemplo una plataforma de pagos. 
  que tan facil o dif��cil es que nuestro sistema se integre son dicha plataforma.

> Coexistencia: Esta dada por cuanto el sistema soporta o no el estar en un 
				contexto dado con otro sistema tambien. 
				¿El sistema puede coexistir dentro del mismo servidor, la misma red? ¿Eso genera fallos al sistema?

- Se mide: A traves de la cantidad de fallos que tenemos, sin que esos fallos sean generados por 
           nuestra aplicacion. Es decir, si nuestra aplicacion convive con otras y estas 
		   otras nos quita recursos o porque la aplicacion le genera un fallo de segmentacion 
		   en el sistema operativo. (Cualquier cosa externa)



## ?? Atributos: Usabilidad ??  ##

Grado en el cual un producto o sistema puede ser utilizado por usuarios espec��ficos para 
alcanzar objetivos espec��ficos con efectividad, eficiencia y satisfaccion en un contexto 
de uso espec��fico. Esta caracter��stica se compone de las siguientes subcaracter��sticas:

> Reconocimiento de idoneidad. Grado en el cual los usuarios pueden reconocer 
 si un producto o sistema es apropiado para sus necesidades.
- Ej: Appro. recog: Wordpress usado para cualquier cosa que no sea blog.

> Curva de aprendizaje. Grado en que un producto o sistema puede ser 
  utilizado por usuarios espec��ficos para lograr objetivos espec��ficos 
  de aprender a utilizar el producto o sistema con efectividad, eficiencia, 
  ausencia de riesgo y satisfaccion en un contexto de uso espec��fico.
- Ej: Lenguaje de gestos en aplicaciones moviles.

> Operabilidad. Grado en el cual un producto o sistema tiene atributos 
				que hacen que sea f��cil de operar y controlar.
- Ej: Formularios largos o de maltiples pasos. Sistemas gubernamentales.

> Proteccion de errores. de usuario Grado en el que un sistema protege a los usuarios contra errores.
- Ej: Sistemas de pago, incertidumbre en el estado del pago.

> Estetica de la interfaz de usuario. Grado en el cual una interfaz de 
  usuario permite una interaccion agradable y satisfactoria para el usuario.
- Ej: UI vs UX. -> Encuestas para preguntarle a los usuarios. 

> Accesibilidad. Grado al cual un producto o sistema puede ser utilizado 
				por personas con la m��s amplia gama de caracter��sticas y 
				capacidades para alcanzar un objetivo espec��fico en un 
				contexto de uso espec��fico.
- Ej: im��genes con texto, sin alt. Contenido redundante o mal marku.



## ?? Atributos: Confiabilidad ??  ##


Atributos que tienen que tienen que ver con el uso normal del sistema a traves del tiempo:
> Madurez, El grado en que un sistema, producto o componente satisface necesidades de confiabilidad bajo operacion normal.
- Ej: Sistemas de compras. Sistemas bancarios.

>Disponibilidad, Grado en el cual un sistema, producto o componente es operacional y accesible cuando se requiere su uso.
- Ej: SLAs, contratos de servicio. Sistemas con eventos de carga pico puntuales.

> Tolerancia a fallos, Grado en el que un sistema, producto o componente funciona segan lo previsto a pesar de la presencia de fallas de hardware o software.
- Ej Aplicaciones moviles.

> Capacidad de recuperacion, Grado en el que, en caso de interrupcion o falla, un producto o sistema puede recuperar los datos directamente afectados y restablecer el estado deseado del sistema.
- Ej Sistemas distribuidos, configuraciones auto-escalables en la nube. Puede estar conectado a la mantenibilidad.

## ?? Atributos: Seguridad ??  ##

Es grado en que un producto o sistema protege la informacion y 
los datos para que las personas u otros productos o sistemas 
tengan el grado de acceso a los datos apropiado para sus tipos 
y niveles de autorizacion. Esta caracter��stica se compone de las 
siguientes subcaracter��sticas:

> Confidencialidad, Grado en el cual un producto o sistema asegura 
  que los datos solo sean accesibles para aquellos autorizados a tener acceso.
- Ej: Redes sociales.

> Integridad, Grado en el que un sistema, producto o componente 
  impide el acceso no autorizado o la modificacion de programas o datos de computadora.
- Ej: Sistemas bancarios.

> Comprobacion de hecho, Grado en que se puede demostrar que las 
  acciones o eventos tuvieron lugar, para que los 
  eventos o acciones no puedan ser repudiados m��s tarde.
- Ej: Firmas digitales. Logs de auditor��a.

> Traza de responsabilidad, Grado en el que las acciones de 
  una entidad se pueden rastrear de manera anica a la entidad.
- Ej: Logs de auditor��a.

- Autenticidad, Grado en el cual se puede probar que la 
  identidad de un sujeto o recurso es la reclamada.
- Ej: Autenticacion de 2 factores. Correo electronico, namero de telefono. Datos biometricos.

## ?? Atributos: Mantenibilidad ??  ##

Esta caracter��stica representa el grado de efectividad y eficiencia con la que un 
producto o sistema puede ser modificado para mejorarlo, corregirlo o adaptarlo a 
los cambios en el entorno y en los requisitos. 

Esta caracter��stica se compone de las siguientes subcaracter��sticas:

> Modularidad, Grado en el cual un sistema o programa de computadora se compone de 
  componentes discretos tales que un cambio en un componente tiene un impacto m��nimo en otros componentes.
- Ej: Patrones de arquitectura. Sistemas distribu��dos.

> Reusabilidad, Grado en el cual un activo puede ser utilizado en m��s de un sistema, 
  o en la construccion de otros activos.
- Ej: Codigo de codigo abierto.

> Analizabilidad, Grado de efectividad y eficiencia con el cual es posible evaluar 
  el impacto en un producto o sistema de un cambio intencional a una o m��s de sus 
  partes, o diagnosticar un producto por deficiencias o causas de fallas, o identificar 
  partes a ser modificadas .
- Ej: Conexion entre codigo y requerimiento (pepinillo)

> Modificabilidad, Grado en que un producto o sistema puede ser modificado de manera 
  efectiva y eficiente sin introducir defectos o degradar la calidad del producto existente.
- Ej: Cobertura de codigo en tests.

> Testabilidad, Grado de eficacia y eficiencia con el que se pueden establecer 
   los criterios de prueba para un sistema, producto o componente y se pueden 
   realizar pruebas para determinar si se han cumplido esos criterios.
- Ej: Funciones puras: ayuda efectos secundarios. Principio de responsabilidad anica. Buenas pr��cticas de diseño.

## Link de apoyo 

- ( Herramientas de Testing )[https://www.sonarqube.org/] 


## ?? Atributos: Portabilidad ??  ##

Grado de eficacia y eficiencia con el que un sistema, producto o componente puede transferirse 
de un hardware, software u otro entorno operacional o de uso a otro. 

Esta caracter��stica se compone de las siguientes subcaracter��sticas:

> Adaptabilidad, Grado en el cual un producto o sistema puede 
	ser adaptado efectiva y eficientemente para hardware, software u otros 
	entornos operacionales o de uso diferentes o en evolucion.
- Ej: Arquitecturas espec��ficas de dominio. Abstraccion y separacion.

> Instalabilidad, Grado de eficacia y eficiencia con el que un producto o 
	sistema puede instalarse y / o desinstalarse con exito en un entorno espec��fico.
- Ej: Tiendas de aplicaciones.

> Reemplazabilidad, Grado en el cual un producto puede reemplazar otro 
	producto de software especificado para el mismo proposito en el mismo entorno.
- Ej: Sistemas distribuidos. Microservicios.

## Resumen de Atributos de Calidad  ##


### ***Confiabilidad:***

- Madurez.
- Disponibilidad.
- Seguridad:

### ***Autenticidad:*** .
- Confidencialidad.
- Compatibilidad:

### ***Interoperabilidad:*** .

- Atributos de calidad en crecimiento


### ***Eficiencia de ejecuci��n:*** .

- Uso de recursos.
- Capacidad.
- Compatibilidad:

### ***Seguridad*** .
- Comprobaci��n de hechos.
- Traza de responsabilidad.
- Confidencialidad.
- Atributos de calidad Gran escala


### ***Usabilidad***

- Accesibilidad.
- Reconocimiento de idoneidad.
- Operabilidad.


### ***Mantenibilidad***
- Modularidad.
- Capacidad de prueba.
- Capacidad de modificaci��n.


### ***Confiabilidad***

- Tolerancia a fallos.
- Capacidad de recuperaci��n.



## ?? Patrones de Arquitectura: ??  ##

> Son decisiones de dise?o importantes ya tomadas para generar un esquema, 
estructura o tipo de comunicaci��n entre componentes.

> Decisiones de dise?o ya tomadas para generar un esquema, 
	estructura o tipo de comunicaci��n entre componentes. 

> Estilos Arquitectonicos, son decisiones de dise?o tomadas para generar un esquema 
  o estructura de comunicaci��n entre componentes o piezas de software: 
  
> Gran Bola de Lodo. Surge cu��ndo un equipo no considera la arquitectura como algo relevante.	

> Estilos Arquitect��nicos: se refieren a estructuras y como los componentes se comunican. "Nivel Infraestructuras"
- Ejemplo: Cliente-Servidor, Arquitectura-Capas, Monolitico, MicroKernel, P2P, SOA, Microservicios, EDA, REST  

> Patrones Arquitect��nicos: soluciones implementadas bajo un estilo arquitectonico. "Dise?o Alto Nivel"
- Ejemplo: Circuite-Brake, Saga, Dahsboard, Sharding, MVC, Throttling, Polling, WebHook, LoadBalance, Pipes & Filters, Event Bus, Dashboard, CQRS, Cache Aside, Publisher/Suscriber, Backends for Frontends

> Patrones de Dise?o de Software: t��cnicas para resolver problemas comunes en el desarrollo de software, 
	estan divididos en 3 categoria: (Dise?o Bajo Nivel)

- CREACIONALES
- - Singleton, Prototype, Builder, Factory Method, Abstract Factory, Object Pool

- ESTRUCTURALES
- - Adapter, Bridge, Composite, Decorator, Facade, Flyweight, Proxy

- COMPORTAMIENTO
- - Iterator, Command, Observer, Tempalte Method, Strategy, Chain of Responsability, Interpreter, Mediator, Moment, Null Object, State, Visitor


## ?? Patrones: Modelo Vista Controlador ??  ##

> Es un patr��n de arquitectura de software, que separa los datos y la l��gica de negocio de una aplicaci��n 
de su representaci��n y el m��dulo encargado de gestionar los eventos y las comunicaciones.

> Para ello MVC propone la construcci��n de tres componentes distintos que son el modelo, la vista y el controlador, 
es decir, por un lado define componentes para la representaci��n de la informaci��n, y por otro lado para la interacci��n 
del usuario.

> Este patr��n de arquitectura de software se basa en las ideas de reutilizaci��n de c��digo y la separaci��n de conceptos, 
caracter��sticas que buscan facilitar la tarea de desarrollo de aplicaciones y su posterior mantenimiento.


## ?? Patrones: Capas / Layered ??  ##

> Cada capa va hacer responsable de cierto componente global de aplicaci��n. 
La comunicaci��n siempre es de arriba hacia abajo. nunca una capa muy inferior 
deber��a comunicarse con la del primer nivel.


> El patr��n de arquitectura de capas describe una estructura tal que
> Nota: La capa de Dominio en otros lugares se le conoce como la capa de l��gica de negocios


## ?? Orientado a eventos / Provisi��n de eventos ??  ##

> Trata sobre c��mo conectar componentes a trav��s de eventos. 
  Cada componente publica eventos a un bus de eventos com��n y los 
  componentes interesados a estos eventos pueden estar suscritos y luego 
  responder al respecto. No hay otra forma de comunicaci��n, el bus de eventos 
  pasa ser el m��todo principal de comunicaci��n entre componentes. 
  
> Algo complejo es saber si una acci��n que hicimos tuvo el resultado que esper��bamos, 
  en general suelen ser eventualmente consistentes, lo que significa que cuando hacemos una 
  escritura el sistema no nos garantiza que va a estar disponible hasta que ese evento no se 
  distribuya en todas las partes que lo necesita.



## ?? Patrones: Microkernel - Plug-ins ??  ##

Esta arquitectura esta compuesta por 2 componentes, 

- El sistema core y los modulos plug-in. 
- El core contiene la minima funcionalidad y los m��dulos plug-in son componentes aut��nomos e independientes que contienen procesamiento 
  especializado, caracter��sticas adicionales y c��digo personalizado que est�� dise?ado para mejorar o ampliar el sistema central para 
  producir capacidades empresariales adicionales. 

- Generalmente, los m��dulos plug-in deben ser independientes de otros m��dulos plug-in, pero ciertamente 
  puede dise?ar plug-ins que requieran que otros plug-ins est��n presentes. 
  De cualquier manera, es importante mantener la comunicaci��n entre plug-ins a un m��nimo para evitar 
  problemas de dependencia.

- Cuando leemos esto lo primero que se nos viene a la mente es OSGi, 
   porque este est��ndar naci�� para darle soporte a este tipo de arquitecturas 
   y el ejemplo m��s significativo de esta arquitectura sea eclipse.

- link: https://www.oreilly.com/ideas/software-architecture-patterns/page/4/microkernel-architecture

## ?? Patrones: Comparte-nada ??  ##

> Esta arquitectura es muy potente al procesar la informaci��n ya que al separar 
  los componentes se puede enfocar en el fallo 
  por que cada componente hace uso ��nico de los recursos de dicho sistema

> El compartir recursos entre componentes agrega complejidad a la hora de decidir acciones. 
  Por lo tanto, esta arquitectura plantea como no necesitar un punto de uni��n entre componentes.

> Procura que no exista un punto de uni��n entre componentes. Es muy potente a la hora de procesar 
  informaci��n. Ya que como cada componente tiene su estado, BD privado y todo lo que necesite para 
  el y solo para el. se puede optimizar ese proceso de forma que no tenemos que considerar casos de contingencia.

## ?? Patrones: Microservicios ??  ##

> Son componentes distribuidos en nuestro sistema en d��nde cada componente va a 
  exponer una funcionalidad al resto del sistema, de esta forma modularizamos nuestro 
  sistema a trav��s de estos servicios independientes.
  
>  Ventajas de una soluci��n basada en microservicios ??
Cada microservicio es relativamente peque?o, f��cil de administrar y desarrollar. ??

Es f��cil para los desarrolladores entender y empezar a trabajar r��pidamente con buena productividad. ??

Los contenedores se crean con rapidez ?, lo que permite que los desarrolladores sean m��s productivos.

Un IDE como Visual Studio ?? puede cargar proyectos m��s peque?os con rapidez, aumentando la productividad de los desarrolladores.

Cada microservicio se puede dise?ar, desarrollar e implementar con independencia de otros microservicios. Esto aporta agilidad, ???��????��?dado que es m��s f��cil implementar nuevas versiones de los microservicios con frecuencia.  

## ?? Patrones: segregaci��n de responsabilidades de consultas y comandos (CQRS) ??  ##

> Es un estilo de arquitectura que separa las operaciones de lectura de las operaciones de escritura.

> Los comandos, Deber��an basarse en tareas, en lugar de centrarse en datos. (��Reservar habitaci��n de hotel�� y no ��Establecer ReservationStatus en Reservado��). Los comandos se pueden colocar en una cola para un procesamiento asincr��nico, en lugar de que se procesen de forma sincr��nica.

> Las consultas, Nunca modifican la base de datos. Una consulta devuelve un DTO que no encapsula ning��n conocimiento del dominio.

## ?? Patrones: Hexagonal - Puertos y adaptadores ??  ##

> La arquitectura hexagonal, Es un estilo de arquitectura que mueve el foco de un programador 
 desde un plano m��s conceptual hacia la distinci��n entre el interior y el exterior del software. 
 
> La parte interior son los casos pr��cticos y el modelo domain est�� construido sobre ello. 

> La parte exterior es UI, base de datos, mensajer��a, etc. La conexi��n entre el interior y el exterior es mediante puertos, y su implementaci��n equivalente se conocen como adaptadores. 

> Por esta raz��n, este estilo de arquitectura se conoce habitualmente como Puertos y Adaptadores.

## ?? Patrones: Dise?o orientado al dominio ??  ##

> Ejemlo un sistema de inventario 

> Lo que hacemos es guiar nuestra aplicaci��n y el dise?o a trav��s del uso del lenguaje com��n entre el negocio y el desarrollo. 

>El obtener ese lenguaje del negocio y el poder hacer aplicaciones que est��n concentradas en eso mucho m��s que lo que est��n concentradas en detalles t��cnicos. 

> Va m��s all�� de una sola aplicaci��n, nos dice que busquemos modularizar nuestro sistema a trav��s de los bounded context, que tratan de encontrar d��nde el lenguaje cambia de sentido.

- Domain Driven Design (DDD) es un nuevo enfoque de desarrollo de software.

- Representa distintas claves, terminolog��ay patrones utilizados para desarrollar software donde** el dominio es lo m��s central e importante de una determinada organizaci��n**.

### Sus principios se basan en:

Colocar los modelos y** reglas de negocio de la organizaci��n, en el core de la aplicaci��n**

Basar nuestro dominio complejo, en un modelo de software.

Se utiliza para tener una mejor perspectiva a nivel de colaboraci��n entre expertos del dominio y los desarrolladores, para concebir un software con los objetivos bien claros.

**Beneficios:
**

- Comunicaci��n efectiva entre expertos del dominio y expertos t��cnicos a trav��s de Ubiquitous Languge.

- Foco en el desarrollo de un ��rea dividida del dominio (subdominio) a trav��s de Bounded Context��s.

- El software es m��s cercano al dominio, y por lo tanto es m��s cercano al cliente.

- C��digo bien organizado, permitiendo el testing de las distintas partes del dominio de manera aisladas.

- L��gica de negocio reside en un solo lugar, y dividida por contextos.

- Mantenibilidad a largo plazo.

**Inconvenientes **:

- Aislar la l��gica de negocio con un experto de dominio y el equipo de desarrollo suele llevar mucho esfuerzo a nivel tiempo.

- Necesitamos un experto de dominio

- Una curva de aprendizaje alta, con patrones, procedimientos,��

- Este enfoque solo es sugerido para aplicaciones donde el dominio sea complejo, no es recomendado para simples CRUD��s.

## ?? Pararse en hombros de gigantes ??  ##

Vamos a ver cu��les son las herramientas que tenemos disponibles para dise?ar una arquitectura a la medidas de nuestras necesidades.

Pararse en hombros de gigantes, es reaprovechar todo el conocimiento de la industria para empezar desde una base mas solida. En primer lugar debemos saber y conocer que productos ya existen que puedan resolver el problema.
Usa frameworks y librer��as.

Las arquitecturas espec��ficas del dominio son decisiones ya tomadas relacionadas con el problema que queremos resolver. Patrones de arquitectura y c��mo usarlos para empezar nuestro sistema desde un punto mas solido y restringir el dise?o ��nicamente a las partes que queremos resolver.

## ?? Tipos de componentes ??  ##

Tipos de componentes
Partes de nuestro sistema que cumplen funciones 
espec��ficas, dentro de cada componentes hay objetos o capas 
que act��an como subcomponentes.

## ?? Tipos de conectores ??  ##

- Llamado a procedimiento
Invocan de un componentes a otro componente y esperan una respuesta.
- Enlace
Vinculan fuertemente a un componente con otro.
- Evento
Permiten a un componente notificar que algo sucedi��, y a otro componente escuchar y reaccionar.
- Adaptador
Ayudan a compatibilizar la interfaz de un componente con la de otra.
- Acceso a datos
Ayudan a acceder a recursos compartidos de datos.
- Flujo
La informaci��n est�� continuamente pasando y otro componente est�� interesado en conocer ese flujo de datos y obtener algunos o todos los estos datos.
- Arbitraje
Tiene que ver como un componente y otro se coordinan para saber qui��n tiene acceso a un recurso o quien hace el trabajo para distribuir los comportamientos.
- Distribuidor
Ayuda a distribuir un mensaje a muchos componentes a trav��s de un solo conector.

- Llamado as��ncrono, 
Un componente llama a otro y luego eval��an la respuesta cu��ndo la necesitan, 
no espera respuesta para poder continuar.

- Llamado sincr��nico, El emisor espera y no 
sigue ejecutando hasta que recibe resultado por parte del receptor.

- Cliente / servidor La comunicaci��n va a ser siempre 
del cliente hacia el servidor, la diferencia en este caso 
con respecto a los llamados s��ncronos, es que el cliente no 
sabe exactamente quien es el servidor. 
Trata de la forma en que est��n distribuidos los componentes.

Enrutador:
Facilita la conexi��n entre un componente que emite un mensaje y un set de componentes que les interesa el mensaje.

Difusi��n:
Dado un mensaje de un emisor lo difunde a muchos otros de componentes interesados.










Mantenibilidad
En este caso el estimulo es un pedido de cambio (llega un requerimiento y tenemos que cambiar el sistema).

Familias de t��cticas:
1.- Confinar modificaciones. Las t��cticas van a intentar trabajar sobre nuestros m��dulos para que cada cambio que nos pidan est�� confinado a s��lo un m��dulo. Cuando logramos esto logramos que las dependencias entre m��dulos sean m��s ligeras y el cambio que nos proponen no afecte a muchas partes del sistema.
a) Coherencia sem��ntica. Habla de la relaci��n entre las responsabilidades de los m��dulos. Hablamos de acoplamiento y cohesi��n. Si logramos encontrar la cohesi��n en un m��dulo entonces vamos a poder hacer que ese m��dulo sea m��s mantenible. De lo contrario es posible que ese m��dulo cambie por diferentes razones.

Abstraer servicios comunes. Cuando encontramos que la aplicaci��n tiene servicios m��s gen��ricos de no necesario podemos abstraerlos a un punto com��n y que las dependencias vayan de los m��dulos cohesivos a un servicio o modulo externo.

b) Generalizar. Al generalizar un m��dulo podemos separar lo espec��fico de lo gen��rico.
c) Limitar opciones disponibles. Limitar el rango de modificaci��n nos ayuda a que sea m��s mantenible.
d) Anticipar cambios. Prepararnos para alg��n cambio que nosotros mismo sepamos que se deber�� de dar en el futuro tomando en cuenta una estrategia sobre como incorporar el nuevo cambio. Los patrones de dise?o suelen estar orientados a esto (Patr��n estrategia).

2.- Prevenir efectos domino. Trabaja estrictamente con las dependencias, es decir cuando podemos detectar que un cambio generar��a problemas en otros m��dulos o dependencias.

3.- Diferir enlace. Como podemos hacer para que un cambio en el c��digo no requiera desplegar toda la aplicaci��n.






Prevenir efectos domin��. Trabaja estrictamente con las dependencias. Es decir, cu��ndo podemos detectar que un cambio generar��a problemas en otros m��dulos u otras dependencias.
? Ocultar informaci��n. Cualquier m��dulo u objeto que dise?emos, tenga la capacidad de ocultar cierta parte de la informaci��n para que los agentes externos no dependan de esa informaci��n puntual sino de una interfaz clara que no puedan cambiar por m��s que la informaci��n cambie. De esta forma podemos garantizar que, si el cambio de la informaci��n es importante, los dependientes no necesiten cambiar porque est��n pasando por una interfaz que no cambi��.
? Mantener la interfaz. Si tengo un servicio que hace algo, la dependencia a ese servicio va a ser a trav��s de una interfaz clara, de lo contrario cualquier acci��n cu��ndo cambie puede poner en riesgo el m��dulo.
? Restringir comunicaci��n. Para generar sistemas que est��n acoplados de forma ligeras, en vez de conocer las dependencias de tus dependencias, siempre te limites a tus dependencias directas, de esta forma cualquier cambio en la forma que tus dependencias trabajan no afecta al m��dulo en el que est��s trabajando.
? Intermediarios. Hablamos de un punto d��nde podamos compatibilizar a un m��dulo con otro y si dejan de ser compatibles, estos intermediarios puedan servir como punto de compatibilidad.

Diferir enlace. Habla sobre c��mo podemos hacer para que un cambio en nuestro c��digo no requiera desplegar toda la aplicaci��n completa.
? Registro en ejecuci��n. Cuando un m��dulo o servicio depende de otro, si dependen fuertemente van a requerir estar compilados juntos. Si nosotros podemos diferir esa compilaci��n y que se registre un servicio en momento de ejecuci��n, es decir que se ponga disponible a sus dependencias en el momento de ejecuci��n, podemos hacer que estos servicios se puedan desplegar independientemente.
? Archivos de configuraci��n. Van a servir para en momento de ejecuci��n saber c��mo conectar varias partes. Es imprescindible que nuestros m��dulos dependan de interfaces y no de implementaciones espec��ficas.
? Polimorfismos. Un objeto pueda comportarse de forma diferente en base a su estado. A trav��s del polimorfismo podemos postergar la forma en que se resuelve un problema dependiendo de qu�� instancia del objeto ser��.
? Reemplazo de componentes. Tener la capacidad de desplegar un componente y luego desplegar su reemplazo, o quiz��s otro componente que respete esa interfaz, y que todo el resto de nuestra aplicaci��n no necesite cambiar.
? Adherir a protocolos. Nos permite tener un protocolo claro entre dos m��dulos y no necesitar saber la instancia espec��fica o el tipo espec��fico de un m��dulo.



## Nota final que y como los debes organizar en tu mente ## 

Paso 0-> Espacio del problema !! Espacio de la soluci��n 
Paso 1-> Requerimientos  Definir los Stake Holder 

Paso 2-> Funcionales  !! No funcionales 

Paso 3 -> Riesgos 

Paso 4 -> Restrinciones 



## Nota final Mis herramientas  ## 

- Atributos de calidad 
- Estilos de arquitectura 
- Patrones de Arquictetura 
- Tacticas 

## Nota final Mis herramientas  ## 
- Modelo
- Razonamiento
- Documentaci��n 
- Implementaci��n 

> Nota Evaluciacion de Arquitectura 

https://www.researchgate.net/publication/220300661_Evaluating_Software_Architectures_for_Real-Time_Systems

C��mo validamos que estas estas decisiones de arquitectura y que este dise?o que acabamos de hacer, tiene sentido?.

Dependiendo en el contexto en el que estemos, la validaci��n de una decisi��n de arquitectura va a ser un proceso 
que vamos tener que hacer antes de entrar a desarrollo o bien un proceso que va a ser continuo y va a suceder 
cada vez que iteramos, as�� es en metodolog��as tradicionales en donde la decisi��n de arquitectura es muy importante 
antes de empezar a desarrollar o en metodolog��as ��giles en donde vamos estar reevaluando la arquitectura en cada iteraci��n.

## Metodolog��a para evaluar la Arquitectura ��ATAM�� (Trade-offs de Arquitecturas)

Un ejemplo de una Metodolog��a para Evaluar Arquitecturas en momento de dise?o es ��ATAM��. 
Este m��todo se llama M��todo de an��lisis de ��Trade-offs de Arquitectura�� o por sus siglas en ingl��s ATAM.

En este m��todo vemos como, tanto los objetivos de negocio, los atributos de calidad y los escenarios que 
planteamos para nuestra arquitectura se van a combinar con la arquitectura que definamos sus estrategias 
y sus decisiones.

Todo esto se va a analizar de tal manera que todos los stakeholders, todas las partes interesadas de esta arquitectura 
puedan tener una voz y un voto y decidir qu�� es importante y a que no se le dar��a importancia.

## Este an��lisis se profundiza y se destila en diferentes decisiones. Ejemplos:

- El entender los Trade off de darle importancia a la mantenibilidad por sobre la eficiencia.

- Entender los puntos sensibles de tener una traza de auditor��a porque podemos tener problemas legales.

- El entender cuales de estos no son realmente riesgos. 

> Por ejemplo, quiz��s al principio no tenemos un riesgo en nuestra disponibilidad 
ya que todav��a no tenemos ning��n contrato de nivel de servicio, mientras que hay 
riesgos que si tambi��n los vamos a entender qu�� van hacer un feedback y van a volver 
a entrar a este m��todo como decisiones nuevas de arquitectura.

- Estos riesgos quiz��s fueron atendidos con algunos atributos de calidad o quiz��s no y los encontramos al analizar 
todas estas decisiones.

- Usar este framework implica el hacer un proceso formal de el an��lisis de la arquitectura y esto implica 
tambi��n que todav��a no tenemos todav��a el sistema en ejecuci��n entonces todo esto s��lo es un ejercicio intelectual y no es todav��a medido en el software mismo.

## Medici��n para nuestro Dise?o de Software

Si queremos medir qu�� es lo que pasa en nuestro software, lo m��s importante que tenemos que hacer es tener 
una forma de m��trica, es decir todas estas decisiones que estamos tomando como vamos a saber si el 
sistema las est�� implementando o no y c��mo vamos a saber que esa implementaci��n realmente tuvo sentido?

Entonces para cada uno de los atributos de calidad deber��amos encontrar una m��trica 
que tenga sentido en nuestra aplicaci��n, luego tener una prueba automatizada para 
esa m��trica es decir alguna forma de obtener en tiempo real la informaci��n de 
c��mo est�� nuestro sistema con respecto a esa m��trica y luego umbrales configurados 
de tolerancia o de cu��n bien o mal estamos respecto a eso.

Por ejemplo en el caso de la disponibilidad si podemos medir a trav��s de un ping o a 
trav��s de un Health check nuestra disponibilidad, tenemos que tener esa m��trica 
visible y saber cu��l es el porcentaje o el umbral que queremos poner para decir 
que tenemos una disponibilidad acorde a nuestra arquitectura. 

Si dij��ramos que la disponibilidad es del 95% y luego en el per��odo de un mes tenemos m��s del 5% de 
sistema fuera de servicio, entonces ese umbral deber��a disparar una alerta y poder hacernos trabajar 
nuevamente sobre ese atributo de calidad. Lo mismo podr��a pasar con la seguridad si tenemos ataques, 
lo mismo podr��a pasar con cualquier otro atributo de calidad y es s��per importante recordar c��mo medirlos 
para poder accionar sobre ellos

## Arquitectura en Evoluci��n

La arquitectura en evoluci��n es un desaf��o especialmente para las metodolog��as ��giles 
ya que en una metodolog��a m��s tradicional se asume que la arquitectura es lo suficientemente 
detallada como para funcionar en todo la especificaci��n del desarrollo que se va hacer sin embargo 
la metodolog��a ��gil plantea que la arquitectura se va a ir construyendo, va a emerger del equipo autogestionado.

## Entonces c��mo hacemos para que emerja la arquitectura correcta y a su vez que a medida que el sistema evoluciona la arquitectura, evolucione junto al sistema?

Como vimos en fundamentos de arquitectura es importante incluir la arquitectura en nuestro ciclo, 
entonces c��mo es que la incluimos? 

Por un lado en el planeamiento del Sprint tenemos que hablar de arquitectura, tenemos que hablar 
de estas m��tricas que tenemos, tenemos que ser conscientes de estos umbrales y de cu��n bien o 
mal estamos en todos los atributos de calidad que estamos priorizando.

Luego cuando priorizamos el backlog y decidimos en que vamos a trabajar vamos a priorizar todas esas 
��reas de arquitectura, en donde encontramos que deber��amos trabajar nuevamente, esto va a requerir 
esfuerzo para implementarlo.

Una vez que se despliegue esta nueva implementaci��n, vamos a trav��s de retrospectivas dond�� fueron 
los puntos en donde no pudimos trabajar correctamente, es decir donde tenemos todav��a problemas en 
la mantenibilidad o tenemos problemas de seguridad que todav��a no podemos cubrir o detectamos alg��n 
problema en nuestra eficiencia de ejecuci��n qu�� tenemos que volver a priorizar.

Este feedback se da no solamente por encontrar nosotros proactivamente problemas, sino de nuevo con m��tricas 
y con alertas programadas en el sistema.

Los test automatizados tambi��n pueden ser buenas alertas incorporarlas en nuestro pipeline de despliegue 
para saber si alguna de estas m��tricas no s��lamente en ejecuci��n sino m��tricas del c��digo mismo est��n 
siendo comprometidas y luego este feedback se cierra cuando volvemos a planear el sprint y reevaluamos 
nuestras decisiones de arquitectura .

As�� Cada vez que avanzamos encontramos los puntos en donde nuestra nuestra arquitectura ya no est�� 
cumpliendo con las expectativas que ten��amos y volvemos a pensar qu�� es lo que hay que hacer para mejorarla.



## Arquitectura restrictiva
Restringe las decisiones que quedan por tomar (por ejemplo cu��ndo se le da a un equipo de desarrollo)

## Arquitectura descriptiva
Documenta las decisiones tomadas y describe el estado actual del sistema, restricciones del pasado m��s las actuales

El arquitecto va a trabajar con diferentes personas para garantizar que la arquitectura se ejecute correctamente:

- Analista: Negociaci��n de requerimientos
- Operaciones: C��lculo de recursos
- Desarrolladores: Restricciones y libertades para desarrollar
- Dise?adores de productos dependientes (Product Managers): Definici��n de interoperabilidad. Comunicaci��n entre productos. Requerimientos de comunicaci��n como una API. Sincronizar equipos
- Gestores de proyecto (Project Manager): Gesti��n de equipos y recursos
- Equipo de calidad (QA): M��tricas y conformidad


## C��mo comunicar la arquitectura: Vistas y Puntos de vista

��Esencialmente, todo modelo es incorrecto. Pero algunos son ��tiles.��

- Arquitectura Restrictiva: Como vamos a utilizar este modelo para restringir las acciones que quedan por tomar. 
						  la arquitectura va a funcionar como restricciones de dise?o.

- Arquitectura Descriptiva: Habla de un sistema ya existente y que habla del estado actual del sistema.
                            Es nuestra responsabilidad conectar el estado actual con nuestro modelo o documentaci��n arquitect��nica.

- El arquitecto va a negociar con el analista y encontrar los trade-offs (Negociaci��n de requerimientos).

- El arquitecto junto a operaciones va poder entender esta propuesta arquitect��nica y empezar a calcular el 
  costos de los recursos que vamos a empezar a consumir.

- El equipo de desarrollo va utilizar toda la documentaci��n anterior para entender las restricciones 
   y libertades a desarrollar.

- Dise?adores de producto se comparte la arquitectura para entender la interoperabilidad del producto.

- Gestores de Proyecto Aprovechan la documentaci��n del proyecto para entender que equipo deben armar para garantizar el ��xito del proyecto.

- Equipo de calidad (QA) va utilizar la documentaci��n de arquitectura para poder entender como es que puede medir estas garant��as.



## Modelo de Arquitectura:

Se compone de elementos tales como m��dulos, componentes, conetores, restricciones, estilo, patrones, atributos de calidad.

- C��digo fuente:
Hace referencia a paquetes, clases, interfaces, m��todos, funciones, par��metros, tipos.

La ��fuente de la verdad�� va a ser el c��digo y no el documento de arquitectura. 
Se deben buscar estrategias para sincronizar el estado actual del c��digo con el documento de arquitectura.

## Las posibles estrategias son las siguientes:

- Ignorar la divergencia:
Aplica cuando el equipo de trabajo es peque?o y mientras todos conozcan la difernecia entre el modelo de la arquitecura y la implementaci��n consiste en mantener el documento de arquitectura tal y como se encuentra concebido, sabiendo que es lo que hace falta completar y que est�� en el c��digo fuente.

- Modelado Ad-hoc:
Se tiene una idea de la diferencia entre el modelado y el c��digo fuente, de tal forma que se puede enunciar el modelo de arquitectura a pesar de que no se encuentra en el documento.

- Modelos de alto nivel:
Se puede seguir modelando la arquitectura con modelos de alto nivel que tienden a cambiar menos y por ende, son m��s baratos.

- Sincronizaci��n en hitos del ciclo de vida:
Consiste en actualizar el modelo de arquitectura en alg��n punto del ciclo de vida de la aplicaci��n. Permite versionar el modelo de arquitectura y saber en cada momento del proyecto cual era el estado del modelo de arquitectura.

- Sincronizar en una crisis:
Actualizar el modelo de arquitectura cuando dentro del desarrollo, el codigo fuente ri?e contra alguna definici��n plasmada en el modelo arquitect��nico.

- Sincronizaci��n constante:
Es la estrategia mas obvia, pero la menos eficiente de todas porque es la mas costosa y mas complicada de ejecutar porque es bastante complicado tener el modelo actualizado contra el c��digo fuente.

- Los Estilos de Arquitectura son Modelos, m��dulos, componentes conectores, restricciones, etc. 

- Que nos permiten tener una gu��a de como aplicar el desarrollo del software y sobretodo como hacerlo a la hora de programar.

- La fuente de la verdad siempre ser�� el c��digo Entonces queda a nuestro criterios basarnos en estrategias para poder mantener este equilibrio con nuestra arquitectura.

- Modelodo Ad Hoc: Sabemos como es la arquitectura, sin embargo esta no se ha establecido programado.

- Modelar solo arquitecturas de alto nivel: Modelar estar arquitectura tienden a ser mas permisivos durante el tiempo y son m��s baratos.

- Actualizar el modelo a medida de que se programa.

