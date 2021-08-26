 ##   Arquitectura de software    ## 
 
Una arquitectura de software se selecciona y diseña con base en objetivos (requisitos) y restricciones

Los objetivos son aquellos prefijados para el sistema de informacion, pero no solamente los de tipo 
funcional, tambi¨¦n otros objetivos como la mantenibilidad, auditabilidad, flexibilidad e interaccion 
con otros sistemas de informacion.


Las restricciones son aquellas limitaciones derivadas de las tecnologias disponibles para implementar 
sistemas de informacion.

La arquitectura de software define, de manera abstracta, los componentes que llevan a cabo alguna tarea 
de computacion, sus interfaces y la comunicacion entre ellos.

Toda arquitectura debe ser implementable en una arquitectura fisica, que consiste simplemente en determinar 
qu¨¦ computadora tendra asignada cada tarea.



 ##    Etapas del proceso desarrollo de software:   ## 

-Analisis de Requerimiento: Se entiende qu¨¦ se tiene que contruir, requerimientos funcionales y no funcionales. 
							 El resultado es una comprension muy clara del problema al resolver.

-Diseo de la Solucion: Un equipo de desarrollo plantea cuales son las posibles soluciones al problema. 
						 Y el resultado es un detalle de la solucion en el formato que tenga que ser dado.

-Desarrollo y Evaluacion: Desarrollo y testing, existen criterios de aceptacion para la solucion. 
						   El resultado es un Artefacto de Software.

-Despliegue: Se necesitara infraestructura para la realizacion de Operaciones. 
			  El resultado de esto es el Software Disponible.

-Mantenimiento y Evolucion: Se detectan errores y se agregan funcionalidades. 
							  Cuando termina el Software queda deprecado.
							  
							  

##     Existen dos tipos de problemas: Los problemas esenciales y los problemas accidentales.    ##

### Esenciales: Se dividen en 4 tipos de problemas

-Complejidad: Cuando un dominio de un problema es complejo en si mismo. 
			    En el caso de adiciones y todas las acciones que conlleven al sistema a ser mas complejo.
				Manejo del problema de complejidad: No desarrollar: Comprar - OSS

-Conformidad: En qu¨¦ contexto se usa el software y como debe adecuarse al mismo. 
			   Se incluyen todo lo que le compete. 
			   Ej: Ambiente, conectividad, impuestos, etc.
				Manejo del problema: Prototipado rapido, feedback y ciclos rapidos para soluciones pequeas.

-Tolerancia al Cambio: Posibilidad del cambio en el mismo y que sea responsivo a diferentes contextos.
						Manejo del problema: Desarrollo Evolutivo, desarrollos pequeos. Paso a paso pero de manera firme e ir haciendo crecer el software.

-Invisibilidad: Problemas de tangibilidad nula.
				 Manejo del problema: Grandes diseadores, Arquitectos que saben abtraer el problema 
				 y que realiza soluciones elegantes, de manera simple, con la mejor calidad posible 
				 en los componentes que lo necesitan.


### Accidentales: Esta relacionado con la plataforma que vamos a implementar, 
				  tecnologia, lenguajes, frameworks, integraciones, entre otros, que tienen 3 Entornos:

-Lenguajes de alto nivel
-Multi-procesamiento
-Entornos de programacion

-Concidero a la especificacion, 
diseo y comprobacion del **concepto **la parte dificil de hacer software. 
(- Si esto es cierto, hacer software siempre sera dificil. 
No existe la bala de plata.-- 
Del libro **No Silver Bullet **(Frederick P. Brooks Jr., 1986)							  


## Las Metodologias Agiles Redifinieron los Roles para acomodarlos a su filosofia de Trabajo (Tradicional vs Metodologias Agiles).

-Experto de Dominio: (tradicional) 
					  Era la persona que acudiamos para resolver 
					  las necesidades de los REQUERIMIENTOS{Que se requiere para este Software}

-Experto de Dominio: (Metodologias Agiles) 
					   Hace un analisis de los stakeholders (Que resolver de su Producto)

-Analista (Tradicional): Es la Persona que indaga en Que es lo que hay q resolver, define un problema-

-Analista (Metodologias Agiles): Es la persona que define los requerimientos es El Cliente, 
								  el va ir definiendo como sera el software a medida Cual es su Problematica.

-Administrador de sistemas (Tradicional): Se encargaban de toda la operacion del sistma 
										 (Si habia servidores, actualizar librerias, Encontrar Errores en los logs y dar el Feedback al equipo de desarrollo)

-Administrador de sistemas (Metodologias Agiles) Fue reemplazado por el DevOps (Operaciones y Desarrollo unidos) Es la persona Responsable de Entender la Infraestructura 
												  a la que va nuestra app y Entender los Requerimientos de ese lado del mundo

-Administrador de sistemas (Metodologias Agiles) Fue reemplazado por el SRE (Ing de la Confianza del Sitio) es similar al Administrador de Sistemas 
											      pero Conectando el mundo de sistemas con el mundo del dia-dia de la app

-QA - Equipo de Texting (Tradicional): Evaluacion de Software

-QA - Equipo de Texting (Metodologias Agiles): Fueron Unidos en un Solo Equipo de Desarrollo (QA-Tester, Desarrollador, Aquitecto) Se Encarga de Tomar las decisiones arquitectonicas (La arquitectura Emergera de un Equipo Autogestionado)

-Gestor del Proyecto (Tradicional): Se ecargaba de todo lo que era la entrega, Cumplir con toda la gestion del ciclo de Vida del Proyecto

-Gestor del Proyecto (Metodologias Agiles): Se conoce como Facilitador (SCRUM Master) lleva al equipo atraves de el ciclo de (Entender que es lo nos Para)


##      La arquitectura  ## 

Mas que un modelo es algo estructural. 
El concepto de arquitectura de software se refiere a la estructuracion del sistema 
que, idealmente, se crea en etapas tempranas del desarrollo. 

Esta estructuracion representa un diseo de alto nivel del sistema que tiene dos propositos

-Satisfacer los atributos de calidad (desempeo, seguridad, modificabilidad)
-Servir como guia en el desarrollo.

El no crear este diseo desde etapas tempranas del desarrollo puede limitar severamente 
el que el producto final satisfaga las necesidades de los clientes. 

Ademas, el costo de las correcciones relacionadas con problemas en la arquitectura es muy elevado. 

Es asi que la arquitectura de software juega un papel fundamental dentro del desarrollo.


##    La importancia de la comunicacion - Ley de Conway ## 

Ley de Conway

-Cualquier pieza de software refleja la estructura organizacional que la produjo.-

##    Objetivos del arquitecto ## 

El arquitecto conecta los stakeholder con el sistema a construir. 

Cada uno de los roles que tienen los SH afectan de diferente forma el sistema.

Cada uno de los stakeholder tiene que ser conectado por el Arquitecto con sus requerimientos.
Stakeholder -> Arquitecto -> Requerimientos = Implementaciones en el Sistema.

Los Requerimientos de cada stakeholder afectan de forma Ãºnica el sistema.

- Cliente: Entrega a tiempo y dentro del presupuesto.
- Manager: Permite equipos independientes y comunicacion clara.
- Dev: Que sea facil de implementar y de mantener.
- Usuario: Es confiable y estara disponible cuando lo necesite.
- QA: Es facil de comprobar.

La union de todos estos requerimientos (funcionales o no funcionales) van a llevar al arquitecto a 
tomar decisiones que impacten sobre el sistema.


##   Arquitectura y metodologias   ## 

La arquitectura nace en metodologias tradicionales en donde su objetivo era principalmente 
encontrar los problemas y disear una solucion a gran escala que ataque a esos problemas esenciales, 
como tambi¨¦n a los de alto riesgo del desarrollo a realizar.

Las metodologias Agiles plantean que la arquitectura emerge de un equipo auto-gestionado 
y por ende ven al diseo de una solucion como algo evolutivo y que se va dando de sprint a sprint.

Diferencias:

- Tradicional: En la etapa de diseo es donde se tiene la definicion del problema, 
				requerimientos, restricciones y riesgos todos estos son los agentes que van ayudar 
				al arquitecto a tomar decisiones, el arquitecto contara con herramientas de diseo 
				para poder tomar esto como entrada, para luego tener un modelo de la arquitectura y la 
				documentacion para implementar ese modelo, la etapa de diseo no implementa software, 
				sino que le da a la etapa de desarrollo las herramientas para implementar lo que se analizo, 
				al modelo tradicional lo que le falta es el feedback ya que el arquitecto no tiene nociones de 
				lo que el sistema ya hace y como el usuario interactÃºa con ese sistema, hasta que el arquitecto 
				no hace toda esa solucion y la solucion no se implementa y se despliega no se tiene feedback de 
				como esas decisiones son tomadas o si son buenas decisiones.

-  Agile: En la metodologia agil todo se trata de momentos en donde podemos evaluar o reevaluar nuestras decisiones, 
		   esto se realiza en el planeamiento del spring que es donde planeamos los momentos arquitectonicos 
		   importantes. Una vez planeado el spring y se define lo que se tiene que definir arquitectonicamente se 
		   ejecuta en base a las prioridades que se tienen y luego se le lleva al usuario haciendo el despliegue y 
		   gracias a eso se obtiene feedback, cabe destacar que una vez que se obtiene feedback se pueden reevaluar 
		   las decisiones de la arquitectura. (Todo se basa en momento)
		   
		   Frase el planear los momentos importante o el ultimo momentos responsable -> No te adelantes a tomar desiciones 
		   


##    Entender el problema	  ## 	   


 Entender el problema
	La parte mas importante de entender el problema es: 
														separar la comprension del problema de la propuesta de solucion, 
														si no se entiende la diferencia entre estos dos puntos se tiende 
														a solucionar problemas inexistentes y a hacer sobreingenieria.


-  Problema:

			Detalla que es lo que se va a resolver (y qu¨¦ no se va a resolver) sin entrar en detalles del -Como- 
			-> (analisis del problema)

-  El espacio del problema nos ayuda a entender que es lo que vamos a resolver y exactamente como imaginamos como 
			esto va agregar un valor a nuestros usuarios sin entrar en detalle de como lo va a resolver el sistema.


Idea: Que queremos resolver
Criterios de exito: Como identificamos si estamos resolviendo el problema
Historias de usuario: Supuestos de historias de lo que va a ganar el usuario al utilizar la solucion usando las caracteristicas del problema a resolver.

Solucion:

Brinda el detalle del -Como-se va a resolver, reflejando los detalles del problema detectado y evitando resolver problemas 
que no se quiere o necesita resolver. --> (detalles t¨¦cnicos)

Se refleja en el espacio del problema y trata de resolverlo teniendo en cuenta todos los detalles t¨¦cnicos necesarios.

Consta de:

Diseño: todo lo referente a la planificacion del software, desde diseo UI, UX hasta diseo de sistemas
Desarrollo: escribir el codigo, configuraciones y contrataciones de servicios
Evaluacion: medir la eficiencia y eficacia del software frente al problema
Criterios de aceptacion: medir el impacto del software, no importa lo bueno que sea el problema si los usuarios no lo usan o no le ven uso
Despliegue (deploy): lanzar el software en ambientes productivos (mercado) y empezar a mejorar las caracteristicas con un feedback loop (crear, medir, aprender)

  ----------- Espacio del problema:  --------------
- Idea
- Criterios de ¨¦xito
- Historias de usuario

----    Espacio de la solucion: ---------------- 
- Diseo
- Desarrollo
- Evaluacion
- Criterios de aceptacion
- Despliegue


No olvidar: Separar la comprension del problema de la propuesta de solucion.


##     Requerimientos     ## 	 

Una vez que entendemos el espacio del problema y el espacio de la solucion, 
vamos a entrar a analizar los requerimientos de nuestro sistema.

---- Requerimientos de producto -----

Los podemos dividir en tres (03):

-Capa de requerimientos de negocio: 
									Son reglas del negocio que alimentan los requerimientos del negocio.

-Capa de usuario: 
					Tienen que ver en como el usuario se desenvuelve usando el sistema, 
					qu¨¦ atributos del sistema se deben poner por encima de otros.
					
-Capa Funcional: Se ven alimentados por requerimientos del sistema, 
				  qu¨¦ cosas tienen que pasar operativamente
					Esta capa se ve afectada por las restricciones que pueden afectar operativamente a lo funcional.

Requerimientos Significativos para la Arquitectura del Producto:

-Requerimientos funcionales: (Funciones indispensables) Tienen que ver con las historias de usuarios, 
								que hablan sobre especificamente lo que hace el sistema, 
								por ejemplo que usuario ingrese al sistema.
-Requerimientos no funcionales: (Atributos de calidad): son aquellos que agregan cualidades al 
								 sistema, por ejemplo que el ingreso de ese usuario sea de manera segura.

Requerimientos de proyecto

-Tienen que ver mas con el rol de gestor de proyectos, se usan para dar prioridad a los requerimientos del producto.
-Estos dos mundos de requerimientos hablan de las prioridades del equipo de trabajo del proyecto.
-Tiene que ver con requerimientos logisticos, que no tienen que ver con el desarrollo del software.


##     Riesgos     ## 	

Los riesgos son importantes para priorizarlos y atacarlos en orden y asegurar que las soluciones arquitectonicas 
que propongamos resuelvan los problemas mas importantes.

Intenta tratar los riesgos con posibles escenarios de fracaso y que pasaria en caso de que ese riesgo se haga real.

Veamos como identificar los riesgos:

En la toma de requerimientos --> dificultad / complejidad
En los atributos de calidad --> incertidumbre, cuanto mas incertidumbra hay, mas alto es el riesgo.
Conocimiento del dominio --> Riesgo prototipico, son aquellos que podemos atacar de forma estandar.

Una vez que tenemos los riesgos identificados, 
debemos priorizarlos, recuerda que no es necesario mitigarlos todos, 
debemos siempre tener en cuenta y dar prioridad a aquellos riesgos que ponen 
en peligro la solucion que se esta construyendo.

--- Priorizar riesgos -----

Es importante porque generalmente no podemos resolver todos, entonces si nos concentramos en 
resolver riesgos que no eran importantes, entonces estaremos invirtiendo mucho tiempo en algo 
que no era tan relevante. Debemos siempre tener en cuenta qu¨¦ riesgos ponen en peligro el ¨¦xito
 o fracaso de la solucion. 
 
 
 ---- Restricciones ---- 
 
 Las restricciones en el contexto de un proceso de desarrollo de software se refiere a las restricciones 
 que limitan las opciones de diseo o implementaciones disponibles al desarrollar.

Los StakeHolders, nos pueden poner limitaciones relacionadas con su contexto de negocio, ejemplo:

-Las limitaciones legales, la implementacion de un producto podria tener restricciones en algÃºn pais, y esto seria una limitante a considerar para el desarrollo del producto.
-Limitaciones t¨¦cnicas, relacionadas con integraciones con otros sistemas.
-El ciclo de vida del producto, agregara limitaciones al producto, por ejemplo a medida que avanza el proceso de implementacion el modelo de datos va a ser mas dificil de modificar.

Nota:
El arquitecto debe balancear entre los requerimiento y las restricciones.

Recomendacion : usar lenguaje natural y normal , evitar lenguaje t¨¦cnico.

##     Arquitectura, panorama y definicion     ## 	


Panorama Arquitectonico
Hay muchas librerias, muchos frameworks, mucho conocimiento arquitectonico implicito entre las comunidades.

Qu¨¦ es un estilo de arquitectura
Cuando hablamos de estilo de arquitectura hablamos de algo gen¨¦rico.

Un estilo de arquitectura es una coleccion de decisiones de diseo, 
aplicables a un contexto determinado, que restringen las decisiones arquitectonicas 
especificas en ese contexto y obtienen beneficios en cada sistema resultante.


Nota: Siempre hay un beneficio y consecuencias de la desiciones de diseo que tomamos. 
  	
_Software Architecture: Foundations, Theory and Practice (Taylor, 2010)


ESTILOS DE ARQUITECRTURA

Llamado y Retorno: Programa y subrutinas
Flujo de Datos: Tubos y filtros
Componentes Independientes: Invocacion implicita
Centradas en Datos: Pizarron
Orientado a servicios 


## Nota final que y como los debes organizar en tu mente ## 

Paso 0-> Espacio del problema !! Espacio de la solucion 
Paso 1-> Requerimientos 

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
- Documentacion 
- Implementacion 
