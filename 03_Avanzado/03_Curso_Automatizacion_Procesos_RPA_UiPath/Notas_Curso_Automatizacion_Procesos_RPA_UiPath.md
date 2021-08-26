# RPA: Automatización robótica de procesos # 

> RPA: Automatización robótica de procesos repetitivos mediante un software (Robotic Process Automation)


## Reglas:

- Entradas digitales
- Proceso estandarizado
- Proceso con reglas de negocio definidas
- Tareas repetitivas
- Consumen mucho tiempo

## Clase - ¿Quiénes participan en un proyecto RPA?

Para realizar una automatización de un proceso, existen múltiples involucrados, 
cada uno con una función específica, así mismo hay una relación muy estrecha entre 
los participantes. Ya que al ser una automatización de un proceso la mayor parte del 
desarrollo conlleva interactuar directamente con el dueño del proceso.

> Los participantes se pueden dividir en 2 grupos:

- Solicitante de la Automatización:

- - Infraestructura de TI.
- - Soporte de TI.
- - Seguridad de la Información.
- - Dueño del Proceso.

- Equipo de Desarrollo: 

- - Desarrollador RPA.
- - Arquitecto RPA.
- - Analista de Negocio RPA.
- - Ingeniero de Infraestructura RPA.

A continuación, te comparto una breve descripción de las funciones principales de los participantes.

> Infraestructura de TI:

- Despliegan la infraestructura para los robots.
- Administran la infraestructura.
- Administran las redes de la infraestructura.
- Refrescan la información para las pruebas.
- Instalan las aplicaciones de la automatización.

> Soporte de TI:

- Administración de credenciales.
- Dar permisos de acceso.
- Monitoreo de robots y procesos.
- Atención de incidentes.
- Solucionar problemas de la Aplicación.

> Seguridad de la Información:

- Certificación de la plataforma ¿Funciona como deseamos?

> Dueño del Proceso:
Son los solicitantes de una automatización.
Quienes proporcionan toda la información del proceso (catálogo de datos, reglas de negocio, etc).
Proporcionan demostración en vivo del proceso (se recomienda grabarla) al Arquitecto, 
Analista y Ing. de Infraestructura RPA. (muchas veces es recomendable llevar al Desarrollador a esta demostración).

> Desarrollador RPA:

- Desarrollador de la solución RPA.
- Trabaja de manera muy cercana al Analista y al Arquitecto.
- Mueve los procesos de etapa: de Desarrollo a Pruebas de Calidad cuando el desarrollo es finalizado.
- Provee asistencia nivel 1 al soporte de la aplicación durante las etapas de Prueba de Calidad.

> Arquitecto RPA:

El encargado de definir la solución ¿Cuántos módulos crearemos por proceso? ¿Cuál será la dependencia de ejecución de estos módulos?
Trabaja en conjunto con el Analista de Negocio.
Analista de Negocio RPA:

- ¿El proceso deseado cumple los requerimientos para ser automatizado? 
- ¿Cuáles son los riegos de automatizar este proceso? ¿Robots atendidos o desatendidos?

> Ingeniero de Infraestructura RPA:

Definir la infraestructura para el robot 
- ¿Cuántos robots necesitamos? ¿Cuántos orquestadores? 
- ¿Equipos físicos o Servidores AWS?


## Instalar y explorar Studio.

> Herramienta -> UIPath

- Robot: Servicio de windows que ejecuta
- Orchestrator: Control y monitoreo, agendas
- Studio: Desarrollo (drag and drop)
 
> Nota : Un proceso como definición es “un conjunto de acciones que cumplen un objetivo”… Entonces, al definir un proyecto de tipo Proceso, es qué vas a programar y automatizar “una serie de pasos específicos”.
Entonces, estos pasos pueden ser un pequeño pedazo de un o todo un sistema complejo de un proceso empresarial.
Para procesos empresariales complejos se recomienda mucho el uso de REF el cual se explica en el último bloque del curso, ya qué requiere las bases que se aprenden en los bloques anteriores.


## Contenedores: Secuencias y Diagramas de Flujo

Sequences & Flowcharts son los nombres en inglés de los agrupadores de actividades que UiPath permite utilizar. Durante esta lectura te compartiré ejemplos del uso de estas actividades y las nombraré por su nombre en español, Secuencias y Diagramas de Flujo respectivamente.

## ¿Dónde se encuentran?
Se encuentran dentro de la lista de Actividades por su nombre en inglés. (Esto es así, aunque cambies el idioma del Studio).

Pantalla de Actividades 1
Pantalla de Actividades 2

## ¿Cómo se usan?
Estos contenedores, se pueden incrustar dentro del archivo del proyecto “Main.xaml” y cualquier otro archivo XAML (tranquilos, esto lo veremos a fondo en las clases siguientes).

Los contenedores de Secuencia y Diagramas de Flujo, pueden contener dentro de ellos múltiples contenedores de Secuencias y Diagramas de Flujo.

Pantalla de Registro
Pantalla de Registro
Las pantallas anteriores son una pequeña demostración de cómo puedes añadir múltiples Secuencias y Diagramas de Flujo. A continuación, les comparto un ejemplo de Diagrama de Flujo que contiene múltiples Secuencias que utilicé para realizar autenticación en un portal web que requiere certificados.

Pantalla de Registro
Las secuencias del flujo anterior, contienen acciones específicas, como ejemplo podemos ver la Secuencia de Abrir e Ingresar Credenciales.

Pantalla de Registro
Renombrar actividades
Para cambiar el nombre de un Diagrama de Flujo (Flowchart), una Secuencia (Sequence) o cualquier Actividad (Activity), solo deben dar doble clic sobre el nombre por defecto que se encuentra en la barra azul/gris.

Otra forma de realizar esta edición es presionar F2 con el objeto previamente seleccionado.

Pantalla de Registro
Reto para la siguiente clase
Como un reto para ti es, en el Proyecto que creamos la clase pasada, deben abrir el archivo Main.xaml y dentro de este crear la estructura de secuencias para cada clase que veremos durante el curso.

Pueden navegar a la vista del curso completo, solo requieren Sencuencias para clases prácticas (vídeos).
Para dominar mejor el arte de los diagramas de flujo, decisiones y diagramación de procesos, les recomiendo el Curso de Pensamiento Lógico instruido por Marcela Valenzuela.

Spoiler

Les dejo una imagen de mi propuesta, pero puede acomodar sus secuencias libremente.

Pantalla de Registro


## Programar actividades: Open Application & Type Into

> Paso 1:  Debemos crear un proyecto 

> Paso 2: Debemos crear una variable 

> Paso 3: Buscar en actividades "Esribir en linea prubas " 



## Programar actividades: Attach Windows y uso de selectores.



## Modo depuración y puntos de ruptura.

- Permite pausar las ejecuciones
- Ver errores durante la ejecución
- Mostrar ventanas complementarias

F Por la clase minuto 3:31.

## Leer datos: PDF e imagen
- Se necesita instalar un plugin llamado UiPathActivities
- Extraer texto de un archivo
- Generar una imagen JPG del archivo
- Requiere un paquete de actividades


## Utilizar decisiones

- If: Continuo
- Switch: Periodico

## Interacción con navegador web
- Paso 1: Clic en  home/ Herramientas / Escoger el navegador 
> Abrira el navegador y hay que aceptar  la instalación del Plugin 

- Paso 2:  Buscamos en Avitividades el proyecto claro podemos crear una secuencia antes y debemos buscar Open Browser 
- Ingresamos  las siguientes actividaes -> Ir a, Clic, Escribir en, clic. 
- Le Damos Play y listo -> Veo esto como una forma de crear pruebas 



## Extraer datos con Data Scrappting Lo siento esto esta fastidioso 
- Paso 1: Extraer información creamos nuestra secuencia y creamos nuestra acción Ir a. 
- Paso 2: Tienes una herramienta en boton llamada extraer datos 
- Organizar información
- Interacción de datos mediante filas y columnas

Actividades:
Consulta a base de datos
Lectura de Excels
Almacenar información estructurada


## Interactuar con Excel

Paso 1: Buscar el paquete Excel  UIPAT.Excel.Activities 


## Interactuar con Correo
En la versión más reciente en Español el Reenviar se llama: Avanzar: MensajeDeCorreo.
En la versión más reciente se llama: “Forward: MailMessage”.
Aparece solo en Send SMTP Mail Message Activity.
Está arriba de donde colocas el Puerto y SMTP Server.

- Comunicación
- Leer correos
- Enviar y responder
- Guardar adjuntos


## Manejo de una base de datos con UiPath

Paso 1: Cremos nuestro esquema 
Paso 2: Insertamos de actividades Conecion y Disconect 

- Connection String -> "Server=DESKTOP-(PC);Database=CursoUiPathPlatzi;User Id=sa;Password=pass" 
- ProviderName ->  System.Data.SqlCliente
- **Out Put **
- DatabaseConnection -> Creamos un avariable tipo Database varConeccionAbierta -> UIPath.Database.
- Disconet 

Paso 3: Podemos hacer  in insert agregando un Insert 
- Como valor podemos pasadr el varConeccionAbierta 

Notas: Con Control + K => puedes crear variables en las propiedades 



# ¿Qué es?

Plantilla de maquinas de estados
Integrada a Orquestador
Basado en estados y mejores practicas
Ejemplos:

Automatizar pagos
Automatizar generación de gráficos
Automatizar minado de datos

## Como instalar REF 

Paso 1: Ubicar Inicio / Nuevo Proyecto / Robotic Enterprise Framework 
Paso 2: Creamos el nombre del proyecto 


## Sincronizar Robot con Orquestador.

>Orquestador: Esta sincronización te permite acceder a los recursos generados para el robot y monitorearlos 

>Cola: Nos permite organizar las transaciones que el robot ejecutará 

>Aset: Es un contenedor de información, alamecena información que el robot podra leer mientras este trabaja puede ser configurado y manipulado por un administrador 


## Inicialización del proyecto REF

- inicialización: Leer archivo y crear listas de palabras
- Procesar transacción: Leer palabra clave y registrar en excel
- Finalizar transacción: Enviar archivo por correo


**Solución estándar.**
UiPath recomienda la siguiente configuración como estándar, sin Alta disponibilidad; la estructura cuenta con los siguientes miembros:

- Robots: Es quien ejecuta las tareas desarrolladas, generalmente en un equipo independiente.
- Orquestador: Servidor Windows Server qué debe tener comunicación hacía SQL Server y hacía los Robots.
- SQL Server: Es un Servidor (o servicio, según la infraestructura) que aloja la base de datos del Orquestador.
(Opcional) Elasticsearch: Servicio opcional, ElasticSearch es utilizado por el Orquestador para alojar los Logs de ejecuciones, de control, de fallos, esto es recomendado para:
- No saturar la base de datos SQL con logs.
- Elasticsearch puede ser combinado con otros softwares (como Kibana) para una explotación de los LOGS, generación de reportes, visualización gráfica, etc.

**Solución de Alta Disponibilidad.**
La estructura de Alta Disponibilidad que UiPath recomienda es la siguiente:

- Robots: Deben estar conectados por un balanceador a los orquestadores.
- 2 orquestadores: Conectador por Redis, un orquestador funciona como activo y el otro como pasivo. Solo el activo opera, si el que opera falla, entra el pasivo a seguir dando soporte a los robots.
- 2 SQL Server: Ambos balanceados por instancia, funcionan de manera activa – pasiva igual que los orquestadores.
- 3 Redis: Mantienen un monitoreo de comunicación entre los Orquestadores, si el activo cae, son los Redis los encargados de activar el Orquestador en “espera” para operar
- (Opcional) 2 o más Elasticsearch: Ambos balanceados por instancia, funcionan de manera activa – pasiva igual que los orquestadores.


## Centro de excelencia

Es una practica que se tiene con los clientes. 

El centro de excelencia se divide en dos partes: 

- Documentación completa del Proceso automatizado
  - Lo primero es la generación de los documentos para montar el robot en un ambiente de calidad

- Capacitación: 
  - Se hace bajo demanda es la capacitación de los usuarios para poder usar los orquestadores y la creación de los robot. ya que hay empresas que pagan los servicios para la administración de los robots 
  


