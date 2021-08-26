# ?? Resumen Profesional  de Arquitectura  ?? 

Que es un atributo de calidad. 


"Los atributos de calidad son la expectativas de usuario, 
en general impl赤citas, de cu赤n bien funcionar赤a un producto."
Software Requirements: 3rd Edition (Wiegers, Betty, 2013)



## ?? Atributos: Idoneidad funcional   ??  ##

La Idoneidad Funcional tiene que ver con la conexion del usuario 
(tareas u objetivos a resolver con el sistema) y como est赤n implementadas 
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
  Espec赤ficamente cuanto tarde el sistema y cuanto esperamos que ese sistema tarde.

- Se mide: a traves de la medicion de la respuesta, dado un estimulo y luego 
           compararlo con el tiempo que esperamos que tarde el sistema.

> Uso de Recursos: Cuanto el sistema aprovecha esos recursos en su contexto, 
  sea la RAM, el SO, ETC. el objetivo es saber cuan bien o mal se est赤n usando.

- Se mide: medir cuanto ocupa el sistema del RAM o CPU 
           y si soporta o tiene la capacidad entera de recursos para soportar.

> Capacidad: Cuanto soporta el sistema en cantidad de pedidos, 
  es decir tiene un limite en la cantidad de una cantidad m赤xima 
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
  que tan facil o dif赤cil es que nuestro sistema se integre son dicha plataforma.

> Coexistencia: Esta dada por cuanto el sistema soporta o no el estar en un 
				contexto dado con otro sistema tambien. 
				聶El sistema puede coexistir dentro del mismo servidor, la misma red? 聶Eso genera fallos al sistema?

- Se mide: A traves de la cantidad de fallos que tenemos, sin que esos fallos sean generados por 
           nuestra aplicacion. Es decir, si nuestra aplicacion convive con otras y estas 
		   otras nos quita recursos o porque la aplicacion le genera un fallo de segmentacion 
		   en el sistema operativo. (Cualquier cosa externa)



## ?? Atributos: Usabilidad ??  ##

Grado en el cual un producto o sistema puede ser utilizado por usuarios espec赤ficos para 
alcanzar objetivos espec赤ficos con efectividad, eficiencia y satisfaccion en un contexto 
de uso espec赤fico. Esta caracter赤stica se compone de las siguientes subcaracter赤sticas:

> Reconocimiento de idoneidad. Grado en el cual los usuarios pueden reconocer 
 si un producto o sistema es apropiado para sus necesidades.
- Ej: Appro. recog: Wordpress usado para cualquier cosa que no sea blog.

> Curva de aprendizaje. Grado en que un producto o sistema puede ser 
  utilizado por usuarios espec赤ficos para lograr objetivos espec赤ficos 
  de aprender a utilizar el producto o sistema con efectividad, eficiencia, 
  ausencia de riesgo y satisfaccion en un contexto de uso espec赤fico.
- Ej: Lenguaje de gestos en aplicaciones moviles.

> Operabilidad. Grado en el cual un producto o sistema tiene atributos 
				que hacen que sea f赤cil de operar y controlar.
- Ej: Formularios largos o de maltiples pasos. Sistemas gubernamentales.

> Proteccion de errores. de usuario Grado en el que un sistema protege a los usuarios contra errores.
- Ej: Sistemas de pago, incertidumbre en el estado del pago.

> Estetica de la interfaz de usuario. Grado en el cual una interfaz de 
  usuario permite una interaccion agradable y satisfactoria para el usuario.
- Ej: UI vs UX. -> Encuestas para preguntarle a los usuarios. 

> Accesibilidad. Grado al cual un producto o sistema puede ser utilizado 
				por personas con la m赤s amplia gama de caracter赤sticas y 
				capacidades para alcanzar un objetivo espec赤fico en un 
				contexto de uso espec赤fico.
- Ej: im赤genes con texto, sin alt. Contenido redundante o mal marku.



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
y niveles de autorizacion. Esta caracter赤stica se compone de las 
siguientes subcaracter赤sticas:

> Confidencialidad, Grado en el cual un producto o sistema asegura 
  que los datos solo sean accesibles para aquellos autorizados a tener acceso.
- Ej: Redes sociales.

> Integridad, Grado en el que un sistema, producto o componente 
  impide el acceso no autorizado o la modificacion de programas o datos de computadora.
- Ej: Sistemas bancarios.

> Comprobacion de hecho, Grado en que se puede demostrar que las 
  acciones o eventos tuvieron lugar, para que los 
  eventos o acciones no puedan ser repudiados m赤s tarde.
- Ej: Firmas digitales. Logs de auditor赤a.

> Traza de responsabilidad, Grado en el que las acciones de 
  una entidad se pueden rastrear de manera anica a la entidad.
- Ej: Logs de auditor赤a.

- Autenticidad, Grado en el cual se puede probar que la 
  identidad de un sujeto o recurso es la reclamada.
- Ej: Autenticacion de 2 factores. Correo electronico, namero de telefono. Datos biometricos.

## ?? Atributos: Mantenibilidad ??  ##

Esta caracter赤stica representa el grado de efectividad y eficiencia con la que un 
producto o sistema puede ser modificado para mejorarlo, corregirlo o adaptarlo a 
los cambios en el entorno y en los requisitos. 

Esta caracter赤stica se compone de las siguientes subcaracter赤sticas:

> Modularidad, Grado en el cual un sistema o programa de computadora se compone de 
  componentes discretos tales que un cambio en un componente tiene un impacto m赤nimo en otros componentes.
- Ej: Patrones de arquitectura. Sistemas distribu赤dos.

> Reusabilidad, Grado en el cual un activo puede ser utilizado en m赤s de un sistema, 
  o en la construccion de otros activos.
- Ej: Codigo de codigo abierto.

> Analizabilidad, Grado de efectividad y eficiencia con el cual es posible evaluar 
  el impacto en un producto o sistema de un cambio intencional a una o m赤s de sus 
  partes, o diagnosticar un producto por deficiencias o causas de fallas, o identificar 
  partes a ser modificadas .
- Ej: Conexion entre codigo y requerimiento (pepinillo)

> Modificabilidad, Grado en que un producto o sistema puede ser modificado de manera 
  efectiva y eficiente sin introducir defectos o degradar la calidad del producto existente.
- Ej: Cobertura de codigo en tests.

> Testabilidad, Grado de eficacia y eficiencia con el que se pueden establecer 
   los criterios de prueba para un sistema, producto o componente y se pueden 
   realizar pruebas para determinar si se han cumplido esos criterios.
- Ej: Funciones puras: ayuda efectos secundarios. Principio de responsabilidad anica. Buenas pr赤cticas de dise簽o.

## Link de apoyo 

- ( Herramientas de Testing )[https://www.sonarqube.org/] 


## ?? Atributos: Portabilidad ??  ##

Grado de eficacia y eficiencia con el que un sistema, producto o componente puede transferirse 
de un hardware, software u otro entorno operacional o de uso a otro. 

Esta caracter赤stica se compone de las siguientes subcaracter赤sticas:

> Adaptabilidad, Grado en el cual un producto o sistema puede 
	ser adaptado efectiva y eficientemente para hardware, software u otros 
	entornos operacionales o de uso diferentes o en evolucion.
- Ej: Arquitecturas espec赤ficas de dominio. Abstraccion y separacion.

> Instalabilidad, Grado de eficacia y eficiencia con el que un producto o 
	sistema puede instalarse y / o desinstalarse con exito en un entorno espec赤fico.
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


### ***Eficiencia de ejecuci車n:*** .

- Uso de recursos.
- Capacidad.
- Compatibilidad:

### ***Seguridad*** .
- Comprobaci車n de hechos.
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
- Capacidad de modificaci車n.


### ***Confiabilidad***

- Tolerancia a fallos.
- Capacidad de recuperaci車n.



## ?? Patrones de Arquitectura: ??  ##

> Son decisiones de dise?o importantes ya tomadas para generar un esquema, 
estructura o tipo de comunicaci車n entre componentes.

> Decisiones de dise?o ya tomadas para generar un esquema, 
	estructura o tipo de comunicaci車n entre componentes. 

> Estilos Arquitectonicos, son decisiones de dise?o tomadas para generar un esquema 
  o estructura de comunicaci車n entre componentes o piezas de software: 
  
> Gran Bola de Lodo. Surge cu芍ndo un equipo no considera la arquitectura como algo relevante.	

> Estilos Arquitect車nicos: se refieren a estructuras y como los componentes se comunican. "Nivel Infraestructuras"
- Ejemplo: Cliente-Servidor, Arquitectura-Capas, Monolitico, MicroKernel, P2P, SOA, Microservicios, EDA, REST  

> Patrones Arquitect車nicos: soluciones implementadas bajo un estilo arquitectonico. "Dise?o Alto Nivel"
- Ejemplo: Circuite-Brake, Saga, Dahsboard, Sharding, MVC, Throttling, Polling, WebHook, LoadBalance, Pipes & Filters, Event Bus, Dashboard, CQRS, Cache Aside, Publisher/Suscriber, Backends for Frontends

> Patrones de Dise?o de Software: t谷cnicas para resolver problemas comunes en el desarrollo de software, 
	estan divididos en 3 categoria: (Dise?o Bajo Nivel)

- CREACIONALES
- - Singleton, Prototype, Builder, Factory Method, Abstract Factory, Object Pool

- ESTRUCTURALES
- - Adapter, Bridge, Composite, Decorator, Facade, Flyweight, Proxy

- COMPORTAMIENTO
- - Iterator, Command, Observer, Tempalte Method, Strategy, Chain of Responsability, Interpreter, Mediator, Moment, Null Object, State, Visitor


## ?? Patrones: Modelo Vista Controlador ??  ##

> Es un patr車n de arquitectura de software, que separa los datos y la l車gica de negocio de una aplicaci車n 
de su representaci車n y el m車dulo encargado de gestionar los eventos y las comunicaciones.

> Para ello MVC propone la construcci車n de tres componentes distintos que son el modelo, la vista y el controlador, 
es decir, por un lado define componentes para la representaci車n de la informaci車n, y por otro lado para la interacci車n 
del usuario.

> Este patr車n de arquitectura de software se basa en las ideas de reutilizaci車n de c車digo y la separaci車n de conceptos, 
caracter赤sticas que buscan facilitar la tarea de desarrollo de aplicaciones y su posterior mantenimiento.


## ?? Patrones: Capas / Layered ??  ##

> Cada capa va hacer responsable de cierto componente global de aplicaci車n. 
La comunicaci車n siempre es de arriba hacia abajo. nunca una capa muy inferior 
deber赤a comunicarse con la del primer nivel.


> El patr車n de arquitectura de capas describe una estructura tal que
> Nota: La capa de Dominio en otros lugares se le conoce como la capa de l車gica de negocios


## ?? Orientado a eventos / Provisi車n de eventos ??  ##

> Trata sobre c車mo conectar componentes a trav谷s de eventos. 
  Cada componente publica eventos a un bus de eventos com迆n y los 
  componentes interesados a estos eventos pueden estar suscritos y luego 
  responder al respecto. No hay otra forma de comunicaci車n, el bus de eventos 
  pasa ser el m谷todo principal de comunicaci車n entre componentes. 
  
> Algo complejo es saber si una acci車n que hicimos tuvo el resultado que esper芍bamos, 
  en general suelen ser eventualmente consistentes, lo que significa que cuando hacemos una 
  escritura el sistema no nos garantiza que va a estar disponible hasta que ese evento no se 
  distribuya en todas las partes que lo necesita.



## ?? Patrones: Microkernel - Plug-ins ??  ##

Esta arquitectura esta compuesta por 2 componentes, 

- El sistema core y los modulos plug-in. 
- El core contiene la minima funcionalidad y los m車dulos plug-in son componentes aut車nomos e independientes que contienen procesamiento 
  especializado, caracter赤sticas adicionales y c車digo personalizado que est芍 dise?ado para mejorar o ampliar el sistema central para 
  producir capacidades empresariales adicionales. 

- Generalmente, los m車dulos plug-in deben ser independientes de otros m車dulos plug-in, pero ciertamente 
  puede dise?ar plug-ins que requieran que otros plug-ins est谷n presentes. 
  De cualquier manera, es importante mantener la comunicaci車n entre plug-ins a un m赤nimo para evitar 
  problemas de dependencia.

- Cuando leemos esto lo primero que se nos viene a la mente es OSGi, 
   porque este est芍ndar naci車 para darle soporte a este tipo de arquitecturas 
   y el ejemplo m芍s significativo de esta arquitectura sea eclipse.

- link: https://www.oreilly.com/ideas/software-architecture-patterns/page/4/microkernel-architecture

## ?? Patrones: Comparte-nada ??  ##

> Esta arquitectura es muy potente al procesar la informaci車n ya que al separar 
  los componentes se puede enfocar en el fallo 
  por que cada componente hace uso 迆nico de los recursos de dicho sistema

> El compartir recursos entre componentes agrega complejidad a la hora de decidir acciones. 
  Por lo tanto, esta arquitectura plantea como no necesitar un punto de uni車n entre componentes.

> Procura que no exista un punto de uni車n entre componentes. Es muy potente a la hora de procesar 
  informaci車n. Ya que como cada componente tiene su estado, BD privado y todo lo que necesite para 
  el y solo para el. se puede optimizar ese proceso de forma que no tenemos que considerar casos de contingencia.

## ?? Patrones: Microservicios ??  ##

> Son componentes distribuidos en nuestro sistema en d車nde cada componente va a 
  exponer una funcionalidad al resto del sistema, de esta forma modularizamos nuestro 
  sistema a trav谷s de estos servicios independientes.
  
>  Ventajas de una soluci車n basada en microservicios ??
Cada microservicio es relativamente peque?o, f芍cil de administrar y desarrollar. ??

Es f芍cil para los desarrolladores entender y empezar a trabajar r芍pidamente con buena productividad. ??

Los contenedores se crean con rapidez ?, lo que permite que los desarrolladores sean m芍s productivos.

Un IDE como Visual Studio ?? puede cargar proyectos m芍s peque?os con rapidez, aumentando la productividad de los desarrolladores.

Cada microservicio se puede dise?ar, desarrollar e implementar con independencia de otros microservicios. Esto aporta agilidad, ???﹦????﹦?dado que es m芍s f芍cil implementar nuevas versiones de los microservicios con frecuencia.  

## ?? Patrones: segregaci車n de responsabilidades de consultas y comandos (CQRS) ??  ##

> Es un estilo de arquitectura que separa las operaciones de lectura de las operaciones de escritura.

> Los comandos, Deber赤an basarse en tareas, en lugar de centrarse en datos. (※Reservar habitaci車n de hotel§ y no ※Establecer ReservationStatus en Reservado§). Los comandos se pueden colocar en una cola para un procesamiento asincr車nico, en lugar de que se procesen de forma sincr車nica.

> Las consultas, Nunca modifican la base de datos. Una consulta devuelve un DTO que no encapsula ning迆n conocimiento del dominio.

## ?? Patrones: Hexagonal - Puertos y adaptadores ??  ##

> La arquitectura hexagonal, Es un estilo de arquitectura que mueve el foco de un programador 
 desde un plano m芍s conceptual hacia la distinci車n entre el interior y el exterior del software. 
 
> La parte interior son los casos pr芍cticos y el modelo domain est芍 construido sobre ello. 

> La parte exterior es UI, base de datos, mensajer赤a, etc. La conexi車n entre el interior y el exterior es mediante puertos, y su implementaci車n equivalente se conocen como adaptadores. 

> Por esta raz車n, este estilo de arquitectura se conoce habitualmente como Puertos y Adaptadores.

## ?? Patrones: Dise?o orientado al dominio ??  ##

> Ejemlo un sistema de inventario 

> Lo que hacemos es guiar nuestra aplicaci車n y el dise?o a trav谷s del uso del lenguaje com迆n entre el negocio y el desarrollo. 

>El obtener ese lenguaje del negocio y el poder hacer aplicaciones que est谷n concentradas en eso mucho m芍s que lo que est芍n concentradas en detalles t谷cnicos. 

> Va m芍s all芍 de una sola aplicaci車n, nos dice que busquemos modularizar nuestro sistema a trav谷s de los bounded context, que tratan de encontrar d車nde el lenguaje cambia de sentido.

- Domain Driven Design (DDD) es un nuevo enfoque de desarrollo de software.

- Representa distintas claves, terminolog赤ay patrones utilizados para desarrollar software donde** el dominio es lo m芍s central e importante de una determinada organizaci車n**.

### Sus principios se basan en:

Colocar los modelos y** reglas de negocio de la organizaci車n, en el core de la aplicaci車n**

Basar nuestro dominio complejo, en un modelo de software.

Se utiliza para tener una mejor perspectiva a nivel de colaboraci車n entre expertos del dominio y los desarrolladores, para concebir un software con los objetivos bien claros.

**Beneficios:
**

- Comunicaci車n efectiva entre expertos del dominio y expertos t谷cnicos a trav谷s de Ubiquitous Languge.

- Foco en el desarrollo de un 芍rea dividida del dominio (subdominio) a trav谷s de Bounded Context＊s.

- El software es m芍s cercano al dominio, y por lo tanto es m芍s cercano al cliente.

- C車digo bien organizado, permitiendo el testing de las distintas partes del dominio de manera aisladas.

- L車gica de negocio reside en un solo lugar, y dividida por contextos.

- Mantenibilidad a largo plazo.

**Inconvenientes **:

- Aislar la l車gica de negocio con un experto de dominio y el equipo de desarrollo suele llevar mucho esfuerzo a nivel tiempo.

- Necesitamos un experto de dominio

- Una curva de aprendizaje alta, con patrones, procedimientos,＃

- Este enfoque solo es sugerido para aplicaciones donde el dominio sea complejo, no es recomendado para simples CRUD＊s.

## ?? Pararse en hombros de gigantes ??  ##

Vamos a ver cu芍les son las herramientas que tenemos disponibles para dise?ar una arquitectura a la medidas de nuestras necesidades.

Pararse en hombros de gigantes, es reaprovechar todo el conocimiento de la industria para empezar desde una base mas solida. En primer lugar debemos saber y conocer que productos ya existen que puedan resolver el problema.
Usa frameworks y librer赤as.

Las arquitecturas espec赤ficas del dominio son decisiones ya tomadas relacionadas con el problema que queremos resolver. Patrones de arquitectura y c車mo usarlos para empezar nuestro sistema desde un punto mas solido y restringir el dise?o 迆nicamente a las partes que queremos resolver.

## ?? Tipos de componentes ??  ##

Tipos de componentes
Partes de nuestro sistema que cumplen funciones 
espec赤ficas, dentro de cada componentes hay objetos o capas 
que act迆an como subcomponentes.

## ?? Tipos de conectores ??  ##

- Llamado a procedimiento
Invocan de un componentes a otro componente y esperan una respuesta.
- Enlace
Vinculan fuertemente a un componente con otro.
- Evento
Permiten a un componente notificar que algo sucedi車, y a otro componente escuchar y reaccionar.
- Adaptador
Ayudan a compatibilizar la interfaz de un componente con la de otra.
- Acceso a datos
Ayudan a acceder a recursos compartidos de datos.
- Flujo
La informaci車n est芍 continuamente pasando y otro componente est芍 interesado en conocer ese flujo de datos y obtener algunos o todos los estos datos.
- Arbitraje
Tiene que ver como un componente y otro se coordinan para saber qui谷n tiene acceso a un recurso o quien hace el trabajo para distribuir los comportamientos.
- Distribuidor
Ayuda a distribuir un mensaje a muchos componentes a trav谷s de un solo conector.

- Llamado as赤ncrono, 
Un componente llama a otro y luego eval迆an la respuesta cu芍ndo la necesitan, 
no espera respuesta para poder continuar.

- Llamado sincr車nico, El emisor espera y no 
sigue ejecutando hasta que recibe resultado por parte del receptor.

- Cliente / servidor La comunicaci車n va a ser siempre 
del cliente hacia el servidor, la diferencia en este caso 
con respecto a los llamados s赤ncronos, es que el cliente no 
sabe exactamente quien es el servidor. 
Trata de la forma en que est芍n distribuidos los componentes.

Enrutador:
Facilita la conexi車n entre un componente que emite un mensaje y un set de componentes que les interesa el mensaje.

Difusi車n:
Dado un mensaje de un emisor lo difunde a muchos otros de componentes interesados.










Mantenibilidad
En este caso el estimulo es un pedido de cambio (llega un requerimiento y tenemos que cambiar el sistema).

Familias de t芍cticas:
1.- Confinar modificaciones. Las t芍cticas van a intentar trabajar sobre nuestros m車dulos para que cada cambio que nos pidan est谷 confinado a s車lo un m車dulo. Cuando logramos esto logramos que las dependencias entre m車dulos sean m芍s ligeras y el cambio que nos proponen no afecte a muchas partes del sistema.
a) Coherencia sem芍ntica. Habla de la relaci車n entre las responsabilidades de los m車dulos. Hablamos de acoplamiento y cohesi車n. Si logramos encontrar la cohesi車n en un m車dulo entonces vamos a poder hacer que ese m車dulo sea m芍s mantenible. De lo contrario es posible que ese m車dulo cambie por diferentes razones.

Abstraer servicios comunes. Cuando encontramos que la aplicaci車n tiene servicios m芍s gen谷ricos de no necesario podemos abstraerlos a un punto com迆n y que las dependencias vayan de los m車dulos cohesivos a un servicio o modulo externo.

b) Generalizar. Al generalizar un m車dulo podemos separar lo espec赤fico de lo gen谷rico.
c) Limitar opciones disponibles. Limitar el rango de modificaci車n nos ayuda a que sea m芍s mantenible.
d) Anticipar cambios. Prepararnos para alg迆n cambio que nosotros mismo sepamos que se deber芍 de dar en el futuro tomando en cuenta una estrategia sobre como incorporar el nuevo cambio. Los patrones de dise?o suelen estar orientados a esto (Patr車n estrategia).

2.- Prevenir efectos domino. Trabaja estrictamente con las dependencias, es decir cuando podemos detectar que un cambio generar赤a problemas en otros m車dulos o dependencias.

3.- Diferir enlace. Como podemos hacer para que un cambio en el c車digo no requiera desplegar toda la aplicaci車n.






Prevenir efectos domin車. Trabaja estrictamente con las dependencias. Es decir, cu芍ndo podemos detectar que un cambio generar赤a problemas en otros m車dulos u otras dependencias.
? Ocultar informaci車n. Cualquier m車dulo u objeto que dise?emos, tenga la capacidad de ocultar cierta parte de la informaci車n para que los agentes externos no dependan de esa informaci車n puntual sino de una interfaz clara que no puedan cambiar por m芍s que la informaci車n cambie. De esta forma podemos garantizar que, si el cambio de la informaci車n es importante, los dependientes no necesiten cambiar porque est芍n pasando por una interfaz que no cambi車.
? Mantener la interfaz. Si tengo un servicio que hace algo, la dependencia a ese servicio va a ser a trav谷s de una interfaz clara, de lo contrario cualquier acci車n cu芍ndo cambie puede poner en riesgo el m車dulo.
? Restringir comunicaci車n. Para generar sistemas que est谷n acoplados de forma ligeras, en vez de conocer las dependencias de tus dependencias, siempre te limites a tus dependencias directas, de esta forma cualquier cambio en la forma que tus dependencias trabajan no afecta al m車dulo en el que est芍s trabajando.
? Intermediarios. Hablamos de un punto d車nde podamos compatibilizar a un m車dulo con otro y si dejan de ser compatibles, estos intermediarios puedan servir como punto de compatibilidad.

Diferir enlace. Habla sobre c車mo podemos hacer para que un cambio en nuestro c車digo no requiera desplegar toda la aplicaci車n completa.
? Registro en ejecuci車n. Cuando un m車dulo o servicio depende de otro, si dependen fuertemente van a requerir estar compilados juntos. Si nosotros podemos diferir esa compilaci車n y que se registre un servicio en momento de ejecuci車n, es decir que se ponga disponible a sus dependencias en el momento de ejecuci車n, podemos hacer que estos servicios se puedan desplegar independientemente.
? Archivos de configuraci車n. Van a servir para en momento de ejecuci車n saber c車mo conectar varias partes. Es imprescindible que nuestros m車dulos dependan de interfaces y no de implementaciones espec赤ficas.
? Polimorfismos. Un objeto pueda comportarse de forma diferente en base a su estado. A trav谷s del polimorfismo podemos postergar la forma en que se resuelve un problema dependiendo de qu谷 instancia del objeto ser芍.
? Reemplazo de componentes. Tener la capacidad de desplegar un componente y luego desplegar su reemplazo, o quiz芍s otro componente que respete esa interfaz, y que todo el resto de nuestra aplicaci車n no necesite cambiar.
? Adherir a protocolos. Nos permite tener un protocolo claro entre dos m車dulos y no necesitar saber la instancia espec赤fica o el tipo espec赤fico de un m車dulo.



## Nota final que y como los debes organizar en tu mente ## 

Paso 0-> Espacio del problema !! Espacio de la soluci車n 
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
- Documentaci車n 
- Implementaci車n 

> Nota Evaluciacion de Arquitectura 

https://www.researchgate.net/publication/220300661_Evaluating_Software_Architectures_for_Real-Time_Systems

C車mo validamos que estas estas decisiones de arquitectura y que este dise?o que acabamos de hacer, tiene sentido?.

Dependiendo en el contexto en el que estemos, la validaci車n de una decisi車n de arquitectura va a ser un proceso 
que vamos tener que hacer antes de entrar a desarrollo o bien un proceso que va a ser continuo y va a suceder 
cada vez que iteramos, as赤 es en metodolog赤as tradicionales en donde la decisi車n de arquitectura es muy importante 
antes de empezar a desarrollar o en metodolog赤as 芍giles en donde vamos estar reevaluando la arquitectura en cada iteraci車n.

## Metodolog赤a para evaluar la Arquitectura ※ATAM§ (Trade-offs de Arquitecturas)

Un ejemplo de una Metodolog赤a para Evaluar Arquitecturas en momento de dise?o es ※ATAM§. 
Este m谷todo se llama M谷todo de an芍lisis de ※Trade-offs de Arquitectura§ o por sus siglas en ingl谷s ATAM.

En este m谷todo vemos como, tanto los objetivos de negocio, los atributos de calidad y los escenarios que 
planteamos para nuestra arquitectura se van a combinar con la arquitectura que definamos sus estrategias 
y sus decisiones.

Todo esto se va a analizar de tal manera que todos los stakeholders, todas las partes interesadas de esta arquitectura 
puedan tener una voz y un voto y decidir qu谷 es importante y a que no se le dar赤a importancia.

## Este an芍lisis se profundiza y se destila en diferentes decisiones. Ejemplos:

- El entender los Trade off de darle importancia a la mantenibilidad por sobre la eficiencia.

- Entender los puntos sensibles de tener una traza de auditor赤a porque podemos tener problemas legales.

- El entender cuales de estos no son realmente riesgos. 

> Por ejemplo, quiz芍s al principio no tenemos un riesgo en nuestra disponibilidad 
ya que todav赤a no tenemos ning迆n contrato de nivel de servicio, mientras que hay 
riesgos que si tambi谷n los vamos a entender qu谷 van hacer un feedback y van a volver 
a entrar a este m谷todo como decisiones nuevas de arquitectura.

- Estos riesgos quiz芍s fueron atendidos con algunos atributos de calidad o quiz芍s no y los encontramos al analizar 
todas estas decisiones.

- Usar este framework implica el hacer un proceso formal de el an芍lisis de la arquitectura y esto implica 
tambi谷n que todav赤a no tenemos todav赤a el sistema en ejecuci車n entonces todo esto s車lo es un ejercicio intelectual y no es todav赤a medido en el software mismo.

## Medici車n para nuestro Dise?o de Software

Si queremos medir qu谷 es lo que pasa en nuestro software, lo m芍s importante que tenemos que hacer es tener 
una forma de m谷trica, es decir todas estas decisiones que estamos tomando como vamos a saber si el 
sistema las est芍 implementando o no y c車mo vamos a saber que esa implementaci車n realmente tuvo sentido?

Entonces para cada uno de los atributos de calidad deber赤amos encontrar una m谷trica 
que tenga sentido en nuestra aplicaci車n, luego tener una prueba automatizada para 
esa m谷trica es decir alguna forma de obtener en tiempo real la informaci車n de 
c車mo est芍 nuestro sistema con respecto a esa m谷trica y luego umbrales configurados 
de tolerancia o de cu芍n bien o mal estamos respecto a eso.

Por ejemplo en el caso de la disponibilidad si podemos medir a trav谷s de un ping o a 
trav谷s de un Health check nuestra disponibilidad, tenemos que tener esa m谷trica 
visible y saber cu芍l es el porcentaje o el umbral que queremos poner para decir 
que tenemos una disponibilidad acorde a nuestra arquitectura. 

Si dij谷ramos que la disponibilidad es del 95% y luego en el per赤odo de un mes tenemos m芍s del 5% de 
sistema fuera de servicio, entonces ese umbral deber赤a disparar una alerta y poder hacernos trabajar 
nuevamente sobre ese atributo de calidad. Lo mismo podr赤a pasar con la seguridad si tenemos ataques, 
lo mismo podr赤a pasar con cualquier otro atributo de calidad y es s迆per importante recordar c車mo medirlos 
para poder accionar sobre ellos

## Arquitectura en Evoluci車n

La arquitectura en evoluci車n es un desaf赤o especialmente para las metodolog赤as 芍giles 
ya que en una metodolog赤a m芍s tradicional se asume que la arquitectura es lo suficientemente 
detallada como para funcionar en todo la especificaci車n del desarrollo que se va hacer sin embargo 
la metodolog赤a 芍gil plantea que la arquitectura se va a ir construyendo, va a emerger del equipo autogestionado.

## Entonces c車mo hacemos para que emerja la arquitectura correcta y a su vez que a medida que el sistema evoluciona la arquitectura, evolucione junto al sistema?

Como vimos en fundamentos de arquitectura es importante incluir la arquitectura en nuestro ciclo, 
entonces c車mo es que la incluimos? 

Por un lado en el planeamiento del Sprint tenemos que hablar de arquitectura, tenemos que hablar 
de estas m谷tricas que tenemos, tenemos que ser conscientes de estos umbrales y de cu芍n bien o 
mal estamos en todos los atributos de calidad que estamos priorizando.

Luego cuando priorizamos el backlog y decidimos en que vamos a trabajar vamos a priorizar todas esas 
芍reas de arquitectura, en donde encontramos que deber赤amos trabajar nuevamente, esto va a requerir 
esfuerzo para implementarlo.

Una vez que se despliegue esta nueva implementaci車n, vamos a trav谷s de retrospectivas dond谷 fueron 
los puntos en donde no pudimos trabajar correctamente, es decir donde tenemos todav赤a problemas en 
la mantenibilidad o tenemos problemas de seguridad que todav赤a no podemos cubrir o detectamos alg迆n 
problema en nuestra eficiencia de ejecuci車n qu谷 tenemos que volver a priorizar.

Este feedback se da no solamente por encontrar nosotros proactivamente problemas, sino de nuevo con m谷tricas 
y con alertas programadas en el sistema.

Los test automatizados tambi谷n pueden ser buenas alertas incorporarlas en nuestro pipeline de despliegue 
para saber si alguna de estas m谷tricas no s車lamente en ejecuci車n sino m谷tricas del c車digo mismo est芍n 
siendo comprometidas y luego este feedback se cierra cuando volvemos a planear el sprint y reevaluamos 
nuestras decisiones de arquitectura .

As赤 Cada vez que avanzamos encontramos los puntos en donde nuestra nuestra arquitectura ya no est芍 
cumpliendo con las expectativas que ten赤amos y volvemos a pensar qu谷 es lo que hay que hacer para mejorarla.



## Arquitectura restrictiva
Restringe las decisiones que quedan por tomar (por ejemplo cu芍ndo se le da a un equipo de desarrollo)

## Arquitectura descriptiva
Documenta las decisiones tomadas y describe el estado actual del sistema, restricciones del pasado m芍s las actuales

El arquitecto va a trabajar con diferentes personas para garantizar que la arquitectura se ejecute correctamente:

- Analista: Negociaci車n de requerimientos
- Operaciones: C芍lculo de recursos
- Desarrolladores: Restricciones y libertades para desarrollar
- Dise?adores de productos dependientes (Product Managers): Definici車n de interoperabilidad. Comunicaci車n entre productos. Requerimientos de comunicaci車n como una API. Sincronizar equipos
- Gestores de proyecto (Project Manager): Gesti車n de equipos y recursos
- Equipo de calidad (QA): M谷tricas y conformidad


## C車mo comunicar la arquitectura: Vistas y Puntos de vista

※Esencialmente, todo modelo es incorrecto. Pero algunos son 迆tiles.§

- Arquitectura Restrictiva: Como vamos a utilizar este modelo para restringir las acciones que quedan por tomar. 
						  la arquitectura va a funcionar como restricciones de dise?o.

- Arquitectura Descriptiva: Habla de un sistema ya existente y que habla del estado actual del sistema.
                            Es nuestra responsabilidad conectar el estado actual con nuestro modelo o documentaci車n arquitect車nica.

- El arquitecto va a negociar con el analista y encontrar los trade-offs (Negociaci車n de requerimientos).

- El arquitecto junto a operaciones va poder entender esta propuesta arquitect車nica y empezar a calcular el 
  costos de los recursos que vamos a empezar a consumir.

- El equipo de desarrollo va utilizar toda la documentaci車n anterior para entender las restricciones 
   y libertades a desarrollar.

- Dise?adores de producto se comparte la arquitectura para entender la interoperabilidad del producto.

- Gestores de Proyecto Aprovechan la documentaci車n del proyecto para entender que equipo deben armar para garantizar el 谷xito del proyecto.

- Equipo de calidad (QA) va utilizar la documentaci車n de arquitectura para poder entender como es que puede medir estas garant赤as.



## Modelo de Arquitectura:

Se compone de elementos tales como m車dulos, componentes, conetores, restricciones, estilo, patrones, atributos de calidad.

- C車digo fuente:
Hace referencia a paquetes, clases, interfaces, m谷todos, funciones, par芍metros, tipos.

La ※fuente de la verdad§ va a ser el c車digo y no el documento de arquitectura. 
Se deben buscar estrategias para sincronizar el estado actual del c車digo con el documento de arquitectura.

## Las posibles estrategias son las siguientes:

- Ignorar la divergencia:
Aplica cuando el equipo de trabajo es peque?o y mientras todos conozcan la difernecia entre el modelo de la arquitecura y la implementaci車n consiste en mantener el documento de arquitectura tal y como se encuentra concebido, sabiendo que es lo que hace falta completar y que est芍 en el c車digo fuente.

- Modelado Ad-hoc:
Se tiene una idea de la diferencia entre el modelado y el c車digo fuente, de tal forma que se puede enunciar el modelo de arquitectura a pesar de que no se encuentra en el documento.

- Modelos de alto nivel:
Se puede seguir modelando la arquitectura con modelos de alto nivel que tienden a cambiar menos y por ende, son m芍s baratos.

- Sincronizaci車n en hitos del ciclo de vida:
Consiste en actualizar el modelo de arquitectura en alg迆n punto del ciclo de vida de la aplicaci車n. Permite versionar el modelo de arquitectura y saber en cada momento del proyecto cual era el estado del modelo de arquitectura.

- Sincronizar en una crisis:
Actualizar el modelo de arquitectura cuando dentro del desarrollo, el codigo fuente ri?e contra alguna definici車n plasmada en el modelo arquitect車nico.

- Sincronizaci車n constante:
Es la estrategia mas obvia, pero la menos eficiente de todas porque es la mas costosa y mas complicada de ejecutar porque es bastante complicado tener el modelo actualizado contra el c車digo fuente.

- Los Estilos de Arquitectura son Modelos, m車dulos, componentes conectores, restricciones, etc. 

- Que nos permiten tener una gu赤a de como aplicar el desarrollo del software y sobretodo como hacerlo a la hora de programar.

- La fuente de la verdad siempre ser芍 el c車digo Entonces queda a nuestro criterios basarnos en estrategias para poder mantener este equilibrio con nuestra arquitectura.

- Modelodo Ad Hoc: Sabemos como es la arquitectura, sin embargo esta no se ha establecido programado.

- Modelar solo arquitecturas de alto nivel: Modelar estar arquitectura tienden a ser mas permisivos durante el tiempo y son m芍s baratos.

- Actualizar el modelo a medida de que se programa.

