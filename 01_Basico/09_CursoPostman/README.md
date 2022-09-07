# Uso --- Postman 21 /05 /2021 

## Estudiando el protocolo HTTP, verbos y status 

- Un protocolo especifica reglas en la comunicacion entre dos entes, en este caso entre dos computudoras.

- HTTP (Hyper Text Transfer Protocol) fue creado especificamente para la web.

**Una de las cosas que especifica el protocolo HTTP son los verbos:**

- GET: solicitar datos o algun recurso.
- HEAD: traer headers (como una peticion GET pero sin contenidos). Es util cuando vamos a utilizar APIs, para comprobar si lo que vamos a enviar esta correcto y puede ser procesado.
- POST: enviar datos a un recurso para la creación.
- PUT: reemplazar por completo un recurso.
- PATCH: reemplazar parcialmente un recurso.
- OPTIONS: Permite ver el detalle del end-point-> como que verbos usa y que metodos permite enviar Ejemplo ->"parses": [ "application/json", "application/x-www-form-urlencoded", "multipart/form-data" ],
- DELETE: eliminar un recurso.

## (status codes) 

- Otra de las cosas que especifica el protocolo HTTP son los codigo de estado (status codes). 
- Sirven para describir el estado de la peticion hecha al servidor.

```
1xx: Indican que la peticion fue recibida y el servidor sigue trabajando en el proceso, es decir, no fue exitosa ni fue errónea, sino que esta siendo procesada aun.
2xx: Indican que la peticion fue recibida y procesada correctamente.
3xx: Indican que hay que tomar acciones adicionales para completar la solicitud. Por lo general estos codigos indican redireccion. Generalmente en los APIs no se usan redirecciones porque no contienen estados, es decir, toda la informacion esta contenida en una solicitud, no se guarda un estado en el servidor con una sesion por ejemplo.
4xx: Indican errores del lado del cliente, por ejemplo: se hizo mal la solicitud, faltan datos, headers o cualquier otro error que pueda ocurrir.
5xx: Indican errores del servidor. Suelen aparecer cuando existe un fallo en la ejecución en el servidor.
```

## Los codigos mas comunes

**Los codigos mas comunes a la hora de interactuar con un API son:**

- 200: Todo esta OK.
- 201: Todo OK cuando se hizo una solicitud POST, el recurso se creo y se guardo correctamente.
- 204: Indica que la solicitud se completo correctamente pero no devolvio informacion. Es muy comun cuando se hacen peticiones con el verbo DELETE.

- 400: Bad Request, algo esta mal en la peticion. Se nos olvido enviar un dato o algo relacionado. Por lo general la respuesta nos especifica cuales fueron los errores a la hora de hacer la peticion.
- 401: Unauthorized, es decir, no estamos autorizados (autenticados) a realizar la peticion.
- 403: Forbidden, yo no tengo acceso a ese recurso aunque este autenticado.
- 404: Not Found, no existe el recurso que se esta intentando acceder.
- 500: Interna Server Error, es un error que retorna el servidor cuando la solicitud no pudo ser procesada. Por lo general, si no tenemos acceso al backend, no tenemos control sobre los errores 500 que retorna un API.

Si quieren saber mas a detalle sobre los HTTP Status Codes, les dejo esta URL muy útil:
https://httpstatuses.com/


## API 

> En un API es importante tener bien estructuradas las rutas por las cuales se usarán cada uno de los endpoints que contiene. Antes de entrar de lleno a explicar el API con el que trabajaremos en este curso veamos unos conceptos muy importantes a la hora de trabajar con APIs.

**Recurso**
- Es la instancia o la representación de un objeto o la representación de algo, tiene datos y operaciones asociadas a él. Por ejemplo: course, material y video son recursos que tenemos disponibles en el API con la que trabajaremos y podemos realizar operaciones sobre ellos: crear, actualizar y eliminar.

**Colecciones**
- Es un conjunto de recursos, por ejemplo: courses es una colección de course.

**URL**
- (Uniform Resource Locator) es la ruta en la cual puede ser ubicado un recurso y ejecutar las operaciones sobre él.

**CRUD**
- Siglas que hacen referencia a las operaciones básicas que se pueden ejecutar sobre un recurso:

```
C: Create (crear)
R: Read (leer)
U: Update (actualizar)
D: Delete (eliminar)
```
**Endpoints**
- Es el punto final de la comunicación con un ente, en este caso, un endpoint está asociado a una URL y a las operaciones que podemos ejecutar. Este término es muy utilizado en las APIs.
- Los endpoint definen operaciones que se quieren ejecutar sobre un recurso. Por ejemplo: si queremos un conjunto de operaciones CRUD sobre Cursos podríamos crear los siguientes endpoints:

**Ejemplo**

- /get-all-courses : para obtener una colección de Cursos.
- /add-new-course: para crear un nuevo recurso de Cursos.
- /delete-all-courses: para eliminar todos los Cursos.
- Y así sucesivamente. Pero, esto implicaría un problema. El API puede llenarse de endpoints que ejecutan una sola operación, esto no es escalable, significa que si por ejemplo el recurso Cursos pasa a llamarse Clases habría que actualizar absolutamente todas las URLs y asegurarse de ello puede convertirse en un dolor de cabeza.
- /courses: Dependiendo del verbo HTTP se ejecutará una operación en particular. Quedaría así:
- GET /courses/2/: vemos que acá se le está pasando algo que en los endpoints anteriores no veíamos, es el número 2, ese es el identificador único, de esta manera el API sabe que tiene que buscar el curso con ID 2 y retornarlo.
- Así sucesivamente con cada uno de los verbos, por ejemplo: casi nunca se hace una eliminación en masa en un API, como el ejemplo que tenemos más arriba donde se eliminan todos los cursos. Lo ideal es que se elimine un recurso individualmente y no una colección, igualmente pasa con la actualización.

**Recursos anidados**
- Hay veces en las que un recurso depende de otro recurso, por ejemplo, comentarios depende de materiales; usualmente en los APIs las anidaciones se hacen hasta dos niveles, es decir:
- materials/1/comments: estos son dos niveles
- materials/1/comments/2/answers/: son tres niveles, ahí lo ideal sería entonces separar el endpoint de comentarios y ejecutar comments/2/answers/

**Nota**
- Postman es multiplataforma, lo que implica que no importa el sistema operativo que uses Postman funcionará.
- Es esta dirección https://www.getpostman.com/downloads/ puedes encontrar la versión de Postman más reciente y descargarla, por defecto, el sitio sabe desde qué sistema operativo estás accediendo y te muestra como primera opción, si no, más abajo aparecen los demás sistemas operativos que soporta Postman.



## DOCKER

> Es una versión simple de una API desarrollada con Django y Django Rest Framework usando Docker.

Cómo correr este proyecto
Instala Docker y Docker Compose
Descarga los archivos de la api haciendo click en este enlace. Estos archivos también se encuentran disponibles en la sección de archivos de la siguiente clase.
Ejecuta en la terminal sudo docker-compose up -d para activar los contenedores de la aplicación.
Entra en el contenedor ejecutando sudo docker exec -it postman-course-master_web_1 bash
Ejecuta cd ./project
Ejecuta migraciones de Django python manage.py migrate
Dentro del contenedor ejecuta source admin_info.sh para crear al superusuario.
Carga los datos iniciales con: python manage.py loaddata courses/fixtures/initial_data.json
Ejecuta exit para salir del contenedor.
Reinicia la aplicación con sudo docker-compose stop y nuevamente sudo docker-compose up -d.
Comprueba que tu servidor se encuentre disponible entrando a la siguiente url http://localhost:8000/api/
Cómo usarlo
Con el servidor de desarrollo corriendo puedes acceder al Django Admin, ahí puedes ejecutar tus acciones CRUD sobre tus datos.

Otras API públicas
Rick & Morty API
Repository with Public APIs
Puedes aprender a crear tus propias APIs en los siguientes cursos:
Curso de API REST
Curso de Django
Curso Avanzado de Django
Curso de Fundamentos de Docker


## FORM DATA

- Es usado para enviar archivos y poder usar nuestros  files -> videos,imagenes,texto 
- Llamados a un API con el método post utilizando Form Data
- Hay veces en las que necesitamos hacer peticiones por el método post pero sin enviar información, sino que en toda URL está la información para crear el registro en la base de datos.
- Un ejemplo de esto es un Like o Dislike a un comentario.

**Podemos usar tres maneras enviar y consumir datos**⠀⠀
- JSON -> (JavaScript Object Notation) -> es un estandar que nos permite enviar y consumir datos bajo uns estructura unica permitiendo la comuniación multiplataforma 
- x-www-form-urlencoded -> Envia información atraves de la url 
- form-data -> Simila el envio de datos como si fuera un formulario 


## Pruebas Automaticas 

> Postman tiene la posibilidad de escribir e interpretar código javascript, esto da la oportunidad de crear pruebas automáticas validando el status decada API. 


**Ejemplo**
> Con este codigo podemos validar el status de un resultado y generar un token 
```
//Guardar la variable tokens 
let jsonData = JSON.parse(responseBody);
postman.setEnvironmentVariable("Token", jsonData.token);

//const json = JSON.parse(responseBody);
//pm.environment.set("token", `Token ${json.token}`);
```

**Enlace**
- Para mayor información podemosviistar este enlace  -> https://learning.postman.com/docs/writing-scripts/script-references/test-examples/ 
- Descargar esta guia en español [Guia Postman](https://github.com/LeoSan/CarreraFundamentosProgramacion_Platzi_2021/blob/main/01_Basico/09_CursoPostman/Postman.pdf)

