########################################################################################################################
## Que son las base de datos? : 


Son lugares fisicos donde guardamos la informacion para que podamos: Crear nueva informacion, 
consultar informacion, editar informacion, eliminar informacion. No importa cuanto tiempo pase
Los modelos en que puede estar construida una base de datos son 2 hasta la fecha:

- Relacionales (Sql Server, MySql,Maria Db)

- Norelacionales: (Cassandra,Mongo Db). Las no relacionales pueden usar Java Scrip Objet Notation para manipular su informacion

Una base de datos puede ser.
- ?Con servicion auto administrados: Donde tu instalas la base de datos en el servidor o de manera local en tu laptop y eres la persona responsable de dar mantenimiento a esa base de datos y garantizar la confiabilidad y seguridad de la informacion
- ?Con servicios administrados: Pagarle a una compatia externa (AMAZON con Amazon Web services o Google con firebase para que sea responsable de la seguridad y accesibilidad de tu informacion)

########################################################################################################################
## HISTORIA

- Tallada en piedra.
- Papiro y Pergamino.
- Papel
- Microfilm
- Medios digitales (Discos Duros, Disquetes, CD, Discos de estado Solido)
- La nube.

########################################################################################################################
## Historia de las RDB

Las bases de datos surgen de la necesidad de conservar la informacion mas all de lo que existe en la memoria RAM.

Las bases de datos basadas en archivos eran datos guardados en texto plano, faciles de guardar pero muy difÃ­ciles 
de consultar y por la necesidad de mejorar esto nacen las bases de datos relacionales. Su inventor Edgar Codd dejo 
ciertas reglas para asegurarse de que toda la filosofÃ­a de las bases de datos no se perdiera, estandarizando el proceso.

########################################################################################################################
## Las Reglas y mandamientos de Edgar Frank Ted Codd 

- Regla 0: Regla de fundacion.
a) Cualquier sistema que se proclame como relacional, debe ser capaz de gestionar sus bases de datos 
	enteramente mediante sus capacidades relacionales.

-  Regla 1: Regla de la informacion.
a) Todos los datos deben estar almacenados en las tablas
b) Esas tablas deben cumplir las premisas del modelo relacional
c) No puede haber informacion a la que accedemos por otra via

-  Regla 2: Regla del acceso garantizado.
a) Cualquier dato es accesible sabiendo la clave de su fila y el nombre de su columna o atributo
b) Si a un dato no podemos acceder de esta forma, no estamos usando un modelo relacional

- ?Regla 3: Regla del tratamiento sistematico de valores nulos.
a) Esos valores pueden dar significado a la columna que los contiene
b) El SGBD debe tener la capacidad de manejar valores nulos
c) El SGBD reconocera este valor diferenciandolo de cualquier otro
d) El SGBD debera aplicarsele la logica apropiada
e) Es un valor independiente del tipo de datos de la columna

- ?Regla 4: Catalogo dinamico en lÃ­nea basado en el modelo relacional.
a) El catalogo en lÃ­nea es el diccionario de datos
b) El diccionario de datos se debe de poder consultar usando las mismas tocnicas que para los datos
c) Los metadatos, por tanto, se organizan tambion en tablas relacionales
d) Si SELECT es una instruccion que consulta datos, tambion sera la que consulta los metadatos

- ?Regla 5: Regla comprensiva del sublenguaje de los datos completo.
a) Al menos tiene que existir un lenguaje capaz de hacer todas las funciones del SGBD
b) No puede haber funciones fuera de ese lenguaje
c) Puede haber otros lenguajes en el SGBD para hacer ciertas tareas
d) Pero esas tareas tambion se deben poder hacer con el ?œlenguaje completo??

- ?Regla 6: Regla de actualizacion de vistas.
a) Las vistas tienen que mostrar informacion actualizada
b) No puede haber diferencias entre los datos de las vistas y los datos de las tablas base

- ?Regla 7: Alto nivel de insercion, actualizacion, y cancelacion.
a) La idea es que el lenguaje que maneja la base de datos sea muy humano
b) Eso implica que las operaciones del lenguaje de manipulacion de los datos (DML) trabajen con conjuntos de filas a la vez
c) Para modificar, eliminar o aÃ±adir datos, no hara falta programar de la forma en la que lo hacen los lenguajes de tercera generacion como C o Java

- ?Regla 8: Independencia fÃ­sica de los datos.
a) Cambios en la fÃ­sica de la BD no afecta a las aplicaciones ni a los esquemas logicos
b) El acceso a las tablas (elemento logico) no cambia porque la fÃ­sica de la base de datos cambie

- ?Regla 9: Independencias logicas de los datos.
a) Cambios en el esquema logico (tablas) de la BD no afectan al resto de esquemas
b) Si cambiamos nombres de tabla, o de columna o modificamos informacion de las filas, las aplicaciones (esquema externo) no se ven afectadas
c) Es mas difÃ­cil de conseguir

- ?Regla 10: Independencia de la integridad.
a) Las reglas de integridad (restricciones) deben de ser gestionadas y almacenadas por el SGBD

- ?Regla 11: Independencia de la distribucion.
a) Que la base de datos se almacene o gestione de forma distribuida en varios servidores, no afecta al uso de esta ni a la programacion de las aplicaciones de usuario
b) El esquema logico es el mismo independientemente de si la BD es distribuida o no

- ?Regla 12: La regla de la no subversion.
a) La base de datos no permitira que exista un lenguaje o forma de acceso, que permita saltarse las reglas anteriores


Una entidad es algo similar a un objeto (programacion orientada a objetos) y representa algo en el mundo real, incluso algo abstracto. Tienen atributos que son las cosas que los hacen ser una entidad y por convencion se ponen en plural.

Los atributos compuestos son aquellos que tienen atributos ellos mismos.

Los atributos llave son aquellos que identifican a la entidad y no pueden ser repetidos. Existen:

########################################################################################################################
## Entidades y atributos


- ?Naturales: son inherentes al objeto como el numero de serie
- ?Clave artificial: no es inherente al objeto y se asigna de manera arbitraria.
- ?Entidades fuertes: son entidades que pueden sobrevivir por si solas.

- ?Entidades debiles: no pueden existir sin una entidad fuerte y se representan con un cuadrado con doble lÃ­nea.

- ?Identidades debiles por identidad: no se diferencian entre si mas que por la clave de su identidad fuerte.
- ?Identidades debiles por existencia: se les asigna una clave propia.

- ?Entidad: es un objeto que existe y es distinguible de otros objetos (se encierra en un recuadro)
- ?Atributos: Caracterasticas o propiedades que describen a la entidad (se encierra en un ovalo)
- ?Atributo multivaluado: Tiene un conjunto de valores para una entidad (Se encierra en un doble ovalo)
- ?Atributo compuesto: Se puede dividir en subpartes (es decir, en otros atributos) (de ol salen otros atributos)
- ?Atributo especial o derivados: Su valor se puede obtener a partir de valores de otros atributos (se encierra en un ovalo punteado)
- ?Atributos llave: Caracterastica o propiedad t¨¦cnica de la entidad, lo que lo diferencia de los demas


- ?Atributos llave naturales: Son parte de la entidad y no se pueden separar.
- ?Atributo llave artificial: No son partes de la entidad y se les asignan de manera arbitraria para facilitar el manejo de la informacion.
- ?Entidades fuertes- son entidades que pueden sobrevivir por si solo, tip: al leer la tabla sabes que son las entidades (se encierra en un recuadro)
- ?Entidades debiles no puede existir sin una entidad fuerte, tip: al leer la tabla no puedes saber que son las entidades (se encierra en un recuadro doble)
- ?Entidades debiles por identidad: es cuando solo se diferencian entre si por la clave de su entidad fuerte
- ?Entidades debiles por existencia: se le da su propio ID para diferenciarse de la entidad fuerte

########################################################################################################################
## Relaciones

Una relacion es una asociacion entre diferentes entidades. 
Es un vinculo que nos permite definir una dependencia, es decir, 
nos permite exigir que varias entidades compartan ciertos atributos 
de forma indispensable.

########################################################################################################################
## Cardinalidades

Llamada tambi¨¦n multiplicidad. Indica la cantidad de elementos o 
instancias de una entidad A que se relacionan con una instancia de una 
Entidad B y viceversa. Esta puede ser de 3 tipos.

-  Uno a Uno (1:1): Esta se da cuando un registro o elemento de una entidad A se relaciona unicamente con un solo registro de una entidad B y viceversa.
-  Uno a Muchos (1:M): Esta se da cuando un registro de una entidad A se relaciona con cero o varios registros de una entidad B, y cada registro de la entidad B se relaciona unicamente con un registro de la entidad A.
-  Muchos a Muchos (N:M): Esta se da cuando un registro de una entidad A se relaciona con cero o varios registros de una entidad B, y un registro de una entidad B se relaciona con cero o varios registros de la entidad A.
-  Las relaciones nos permiten ligar o unir nuestras diferentes entidades y se representan con rombos. Por convencion se definen a trav¨¦s de verbos.



Cardinalidad: 1 a 1
Cardinalidad: 0 a 1
Cardinalidad: 1 a N
Cardinalidad: 0 a N

########################################################################################################################
## Tipos de dato 

Los tipos de datos de una base de datos pueden ser: Texto, Numeros, Fecha y Logicos.
Datos de tipo Texto.
- CHAR(n): Permite almacenar Caracteres.
- VARCHAR(n): Tambien permite almacenar caracteres, a diferencia de CHAR es que la longitud de caracteres es variable, a diferencia de la anterior que es de longitud fija y serviria mas para cadenas cortas de texto.
- TEXT: Tambien sirve para almacenar caracteres, a diferencia de los 2 anteriores, funciona para guardar cadenas que sean mayores a 255 caracteres.

Datos de tipo Numero
- INTEGER: Sirve para almacenar numeros de tipo entero (no decimales).
- BIGINT: Tiene la misma funcionalidad que el anterior, pero para numeros de cantidades grandes.
- SMALLINT: Igual que el anterior, pero para numeros peque?os.
- DECIMAL(n, s): Funciona para numeros decimales. Lo primero es el numero (n) y lo siguiente seria el decimal (s).
- NUMERIC(n, s): Funciona tambi¨¦n para decimales, a diferencia del anterior, se deben definir los decimales que se especifiquen en (s).

Tipos de dato Fecha/hora
- DATE: Solo especifica la fecha, es decir, a?o, mes y dia.
- TIME: Solo se especifica la hora.
- DATETIME: Especifica fecha y hora.
- TIMESTAMP: Funciona de manera similar a DATETIME.

Datos de tipo logico
- BOOLEAN: El tipo de dato booleano solo tiene 2 datos, que seria 1 o 0 (verdadero o falso).


Constraints (Restricciones)

- NOT NULL: Se asegura que la columna no tenga valores nulos
- UNIQUE: Se asegura que cada valor en la columna no se repita
- PRIMARY KEY: Es una combinacion de NOT NULL y UNIQUE
- FOREIGN KEY: Identifica de manera unica una tupla en otra tabla
- CHECK: Se asegura que el valor en la columna cumpla una condicion dada
- DEFAULT: Coloca un valor por defecto cuando no hay un valor especificado
- INDEX: Se crea por columna para permitir busquedas mas rapidas


Proceso de normalizacion El proceso de normalizacion es un estandar que consiste, basicamente, en un proceso de conversion de las relaciones entre las entidades, evitando:

La redundancia de los datos: repeticion de datos en un sistema.
Anomalias de actualizacion: Inconsistencias de los datos como resultado de datos redundantes y actualizaciones parciales.
Anomalias de borrado: P¨¦rdidas no intencionadas de datos debido a que se han borrado otros datos.
Anomalias de insercion: Imposibilidad de adicionar datos en la base de datos debido a la ausencia de otros datos.

1FN Primera forma normal: Atributos atomicos (Sin campos repetidos). Esto quiere decir que ningun campo puede tener el mismo tipo de valor como varios campos materia (materia1, materia2,¡­).

2FN Segunda forma normal: Cumplir con 1FN y Cada campo de la tabla debe depender de una clave unica. Es decir en las tablas no se puede repetir los campos primarios ya que los mismos son unicos por tanto si existe una relacion uno a muchos se debe crear una tabla aparte donde cohabitaran la llave primaria de la primera tabla y la llave primaria de la segunda tabla de esta forma logramos relacionar de manera efectiva dos tablas respetando las llaves primarias.

3FN Tercera forma normal: Cumple 1FN y 2FN y los campos que NO son clave NO deben tener dependencias. Esto nos indica que todos los campos de la tabla deben estar estrechamente relacionados con el campo primario y no serlo de manera transitiva, por ejemplo, en una tabla torneos tenemos el codigo del torneo el nombre el ganador y la fecha de nacimiento del ganador, como observamos no podemos tener la fecha de nacimiento del ganador en dicha tabla ya que no esta relacionada para nada con el torneo y ademas existe la posibilidad que en varios registros el mismo ganador tenga diferentes fechas de nacimiento por lo cual no mantendria la consistencia de los datos.

4FN Cuarta forma normal: Cumplir 1FN 2FN y 3FN. Los campos multivaluados se identifican por una clave unica. Cuando relacionamos dos tablas totalmente independientes cada una de la otra debemos relacionarlas a trav¨¦s de una tabla aparte de las mismas donde solo colocaremos las llaves primarias de cada tabla ya que colocar cualquier otra informacion relacionada con las tablas implicaria repetir datos, ademas de hacer la tarea de actualizacion de registros primarias mas compleja, ya que por ejemplo si deseo actualizar el nombre del curso no solo lo tendria que hacer en la tabla cursos sino tambi¨¦n en cada tabla donde coloque el nombre lo cual no garantiza la integridad de la informacion, adiciona informacion innecesaria en los registros y hace mas complejo el trabajo de administrar los datos.


########################################################################################################################
## Que es  RDBMS


Significa Relational Database Management System o sistema manejador de bases de datos relacionales. 
Es un programa que se encarga de seguir las reglas de Codd y se puede utilizar de manera programatica.

RDB (relational database)

RDBMS (Relational DataBase Magement System) Sistema Manejador de Bases de datos relacionales.

La diferencia entre ambos es que las BBDD son un conjunto de datos pertenecientes ( o al menos en teoria) a un mismo tipo de contexto, que guarda los datos de forma persistente para un posterior uso, y el Sistema de gestion de BBDD o sistema manejador, es el que nos permite acceder a ella, es un software, herramienta que sirve de conexion entre las BBDD y el usuario (nos presenta una interfaz para poder gestionarla, manejarla).

RDBMS

MySQL
PostgreSQL
Etc
Todas toman un lenguaje base, pero cada uno lo apropia, imponi¨¦ndole diferentes reglas y caracteristicas.

###########################################################################################################
## Servicios administrados: 


Hoy en dia muchas empresas ya no tienen instalados en sus servidores los RDBMS 
sino que los contratan a otras personas. Estos servicios administrados cloud te 
permiten concentrarte en la base de datos y no en su administracion y actualizacion. 


###########################################################################################################
## SQL 



Es un lenguaje de acceso a bases de datos que explota la flexibilidad 
y potencia de los sistemas relacionales y permite asi gran variedad de operaciones.

- SQL -> Lenguaje de Consulta Estructurado -> NOSQL -> Not Only Strutured Query Language 

- SQL es un estandar aceptado por ANSI (Instituto Nacional Estadounidense de Estandares)
- PL/SQL es un lenguaje de programacion de la base de datos de Oracle, el nombre viene de 
Procedural Language/Structured Query Language
- T-SQL es un lenguaje de programacion de la base de datos de Microsoft SQL Server y el nombre viene de TRANSACT-SQL

###########################################################################################################
## LENGUAJES SQL 




- DML
o Data Manipulation Language o Lenguaje de Manipulacion de Datos
o Lenguaje procedimental y declarativo ? conjunto de instrucciones 
  que apoyaran al proceso de construccion de la BD
o Las sentencias DML afectan los registros en una tabla. Estas son 
  operaciones basicas que realizamos sobre datos tales como seleccionar 
  algunos registros de una tabla, insertar nuevos registros, eliminar 
  registros innecesarios y actualizar / modificar registros existentes.
o Opciones DML

? SELECT: para seleccionar registros de tablas
? INSERT: para insertar nuevos registros
? UPDATE: para actualizar y modificar registros
? DELETE: para eliminar registros existentes.

- DDL 
o Data Definition Language o Lenguaje de Definicion de Datos
o Aqui ya se especifica el esquema de la BD, generando un diccionario 
  de datos, las restricciones de integridad y las autorizaciones para que 
  ciertos usuarios no vean cierto contenido.
o Sentencias DDL son las necesarias para poder modificar la BD, esquema 
  y ESTRUCTURA de las tablas. Son las utiles para el dise?o y control de 
  objetos que se encuentran dentro de las BD.
o Opciones DDL
? CREATE: Crear una nueva base de datos, una tabla o esquema.
? ALTER: Alterar tabla existente, descripcion de columnas, etc.
? DROP: Eliminar objetos existentes de la BD.


o 3 objetos que manipularemos con el lenguaje DDL
? Database
? Tables 
? traduccion a SQL de las entidades
? View 
? se ofrece la proyeccion de los datos de la BD de forma entendible

DCL
o Lenguaje de Control de Datos
o Las declaraciones DLC son las encargadas de controlar el acceso de los usuarios a las BD.
o Opciones DDL
? GRANT:
? Declaracion que permite a los usuarios leer / escribir en objetos que digamos de la BD.
? REVOKE:
? Es la que ofrece a los usuarios estar sin permiso de lectura / escritura en objetos de la BD.

TLC
o Lenguaje de Control de Transacciones
o Instrucciones que permiten administrar transacciones 
  y tener integridad de datos dentro de las declaraciones SQL. 
  Se gestiona a trav¨¦s de las siguientes declaraciones
? BEGIN Transaction
? Nos permite abrir una transaccion
? COMMIT Transaction
? Ofrece confirmar una transaccion
? ROLLBACK Transaction
? Devuelve una transaccion en caso de error cometido.


--a veces se usa "SCHEMA" en vez de "DATABASE" en SQL
CREATE DATABASE test_db;
--USE DATABASE sirve para saber a qu¨¦ base de datos te refieres
USE DATABASE test_db;

########################################################################################################################
## Diferencia entre CREATE SCHEMA y CREATE DATEBASE

La diferencia exacta es una sola, que se llaman diferente, pero hacen lo mismo. Asi lo afirma la documentacion de MySQL:

CREATE DATABASE crea una base de datos con el nombre dado. Para utilizar esta declaracion, es necesario el privilegio CREATE para la base de datos.

CREATE SCHEMA es sinonimo de CREATE DATABASE.

Schema
Conceptualmente, un schema es un conjunto interrelacionado de objetos de bases de datos, tales como tablas, columnas de tablas, tipos de datos de las columnas, indices, claves externas, y asi sucesivamente. Estos objetos estan conectados a trav¨¦s de la sintaxis SQL, debido a que las columnas representan las tablas, las claves externas se refieren a tablas y columnas, y asi sucesivamente. Idealmente, estan conectados logicamente en cuanto que trabajan juntos como parte de una aplicacion unificada o marco flexible. Por ejemplo, en las bases de datos INFORMATION_SCHEMA y performance_schema utilizan ¡°schema¡± en sus nombres para destacar las estrechas relaciones entre las tablas y columnas que contienen.

En MySQL, fisicamente, schema y database son sinonimos, por lo que en la sintaxis SQL puede usar la palabra clave SCHEMA en lugar de DATABASE, por ejemplo, en lugar de utilizar CREATE SCHEMA puede usar CREATE DATABASE.

Algunos otros productos de base de datos establecen una distincion. Por ejemplo, en el producto de base de datos Oracle, un schema solo representa una parte de un diagrama de base de datos: las tablas y otros objetos propiedad de un unico usuario.

## **Views **
- Toman datos de la base de datos, las ordenan de manera presentable, y las convierten en algo consultable recurrentemente.
- Se crea con _CREATE VIEW _ (nombreDeLaVista) AS
SELECT¡­ (por ej. FROM platziblog.people, es decir de cada persona de platziblog -> hacer algo, por ejemplo, trabajar con un atributo, o filtrarla, etc.).
- En el Workbench, se hace click derecho en Views -> Create View, y luego va la sentencia de arriba.


EJEMPLO PARA CREAR TABLA 

create table people(
	person_id INTEGER NOT NULL auto_increment PRIMARY KEY,
    last_name VARCHAR(255) NULL,
    first_name VARCHAR(255) NULL,
    address VARCHAR(255) NULL,
    city VARCHAR(255) NULL
);

select * from people;

describe people;


INSERTAR TABLA 

INSERT INTO `platziblog`.`people` (`person_id`, `last_name`, `first_name`, `address`, `city`) 
VALUES ('1', 'Vasquez', 'Israel', 'Calle Famosa Num 1', 'M¨¦xico'),
	       ('2', 'Hernandez', 'Monica', 'Reforma 222', 'M¨¦xico'),
	       ('3', 'Alanis', 'Edgar', 'Central 1', 'Monterrey');
		   
CREAR VISTAS 

CREATE VIEW 'ESQUEMA.V_NOMBRE' AS 
SELECT * FROM ESQUEMA.NOMBRETABLA 

CREATE OR REPLACE VIEW v_people AS SELECT * FROM PEOPLE;

ALTER TABLE platziblog.people
CHANGE COLUMN date_of_brith a?o_nacimiento datetime;

########################################################################################################################
## QUE TAN STANDARD ES SQL ?

SQL unifico la manera en que sea hacen preguntas a un repositorio de datos.
Se convirtio en un standard util a la hora de usar bases de datos.
Existen otros manejadores de datos como Oracle o PostgreSQL.
Sin embargo, si escribimos en lenguaje SQL todos los manejadores funcionaran de manera similar.		   

########################################################################################################################
## Tablas transitivas 


Las tablas transitivas sirven como puente para unir dos tablas. No tienen contenido semantico.

Reverse Engineer nos reproduce el esquema del cual nos basamos para crear nuestras tablas. 
Es util cuando llegas a un nuevo trabajo y quieres entender cual fue la mentalidad que tuvieron al 
momento de crear las bases de datos.

########################################################################################################################
## Los queries


Los queries son la forma en la que estructuramos las preguntas que se haran a la base de datos. 

Transforma preguntas en sintaxis.

El query tiene basicamente 2 partes: SELECT y FROM y puede aparecer una tercera como WHERE.

La estrellita o asterisco (*) quiere decir que vamos a seleccionar todo sin filtrar campos.


SELECT se encarga de proyectar o mostrar datos.

El nombre de las columnas o campos que estamos consultando puede ser cambiado utilizando AS despu¨¦s del nombre del campo y poniendo el nuevo que queremos tener:
SELECT titulo AS encabezado
FROM posts;
Existe una funcion de SELECT para poder contar la cantidad de registros. Esa informacion (un numero) sera el resultado del query:
SELECT COUNT(*)
FROM posts;


########################################################################################################################
## FROM


FROM indica de donde se deben traer los datos y puede ayudar a hacer sentencias y filtros 
complejos cuando se quieren unir tablas. La sentencia compa?era que nos ayuda con este proceso es JOIN.

Los diagramas de Venn son circulos que se tocan en algun punto para ver 
donde esta la interseccion de conjuntos. Ayudan mucho para poder formular 
la sentencia JOIN de la manera adecuada dependiendo del query que se quiere hacer.


FROM: indica de donde vamos a extraer los datos. Va de la mano con el comando JOIN para hacer consultas a distintas tablas. Para entender JOIN recordemos teoria de conjuntos.


Diferencia: LEFT JOIN, RIGTH JOIN (WHERE A.key is null/WHERE B.key is null)
Interseccion: INNER JOIN
Union: OUTER JOIN
Diferencia Sim¨¦trica: OUTER JOIN (WHERE A.key is NULL or B.key is NULL)
Nota:

Consideramos A y B a los conjuntos de datos que estamos operando
Para excluir una seccion en especifico usamos el comando WHERE


########################################################################################################################
## WHERE


Nos ayuda a filtrar registros (filas de la tabla). Podemos filtrar por ejemplo, a partir de cierto numero de ID (con el operador de mayor o menor).
LIKE : cuando no conocemos la cadena exacta. Podemos filtrar segun alguna caracteristica. Por ejemplo, como explica en el video:
WHERE titulo LIKE ¡®%escandalo%¡¯ lo que hace es buscar aquellos titulos que tengan la palabra escandalo en alguna parte. Sin embargo, como los signos porcentuales indican que hay algo mas, si quitamos, por ejemplo, el del final (quedando ¡®%escandalo¡¯), estaremos buscando aquellos titulos que terminen con la palabra ¡®escandalo¡¯, ya que indicamos que despues de esta palabra no hay nada mas.
BETWEEN : la traduccion de esta palabra al espa?ol es ¡®entre¡¯. Por lo tanto, como podemos imaginar, filtrara entre dos valores a designar. Por ejemplo:
WHERE fechaDePublicacion BETWEEN ¡®2019-01-01¡¯ AND ¡®2019-01-10¡¯ filtrara las publicaciones con fecha de publicacion entre el 1 de enero de 2019 y 10 de enero de 2019. Puede utilizarse tambien con valores numericos (y por lo tanto, por ejemplo, con los IDs).

########################################################################################################################
## ORDER BY : va a ordenar la consulta en el orden que ti lo determines , puedes utilizar como herramientas

<>** para determinar que los datos seran discriminados de mayor o menor a que
ASC para indicar si el orden segun la discriminacion sera ascendente
DESC para indicar si el orden segun la discriminacion sera descendente
LIMIT esta herramienta apoyada con ASC o DESC nos indicara segun el valor que le asignemos, que datos nos datos nos arrojara dentro de esas especificaciones
HAVING en este caso lo utilizamos para seleccionar las tuplas asignadas

########################################################################################################################
## Los Nested queries 


significan que dentro de un query podemos hacer otro query. Esto sirve para hacer join de tablas, estando una en 
memoria. Tambi¨¦n teniendo un query como condicional del otro.

Este proceso puede ser tan profundo como quieras, teniendo infinitos queries anidados.
Se le conoce como un producto cartesiano ya que se multiplican todos los registros de una tabla con todos los del nuevo query. Esto provoca que el query sea dificil de procesar por lo pesado que puede resultar.


SELECT  idioma, precio, 
CASE
	WHEN precio > 1000 THEN "Muy caro"
	WHEN precio > 500 THEN "Precio modico"
	ELSE "Muy barato"
END AS "informe"
FROM libros;

########################################################################################################################
## GROUP_CONCAT 


GROUP_CONCAT toma el resultado del query y lo pone como campo separado por comas.


########################################################################################################################
CORTE FIN DE BD RELACIONADAS  
########################################################################################################################
########################################################################################################################
CORTE FIN DE BD RELACIONADAS 
########################################################################################################################


########################################################################################################################
##  BASE DE DATOS NO RELACIONALES 


## ?? Tipos de bases de datos no relacionales: ??

Solo responden diferentes necesidades cada una, ya que con las RDB surgen problemas al ir creciendo



- Clave - valor: 
                 Son ideales para almacenar y extraer datos con una clave unica. 
		         Manejan los diccionarios de manera excepcional. Ejemplos: DynamoDB, Cassandra.
				 
				 
- Basadas en documentos: Son una implementacion de clave valor que varia en la forma 
						 semiestructurada en que se trata la informacion. 
						 Ideal para almacenar datos JSON y XML. Ejemplos: MongoDB, Firestore.


- Basadas en grafos:  Basadas en teoria de grafos, (Nodos) sirven para entidades que se encuentran interconectadas 
					  por multiples relaciones. Ideales para almacenar relaciones complejas. 
					  Ejemplos: neo4j, TITAN.
- Basadas en objetos de tipo JSON. Ideal para almacenar datos JSON y XML
- Son las mas utilizadas despues de los RDBMS
- Son una implementacion de clave valor que varia en la forma semiestructurada en que se trata la informacion
- Guarda la forma actual de una aplicacion, no son buenas para hacer consulta complejas.					  

- Nodos o entidades que tienen multiples relaciones. Estan relacionadas TODOS CON TODOS
- Se usan en el mundo de la inteligencia artificial, para formar redes neuronales
- En memoria: Pueden ser de estructura variada, pero su ventaja radica en la velocidad, 
			  ya que al vivir en memoria la extraccion de datos es casi inmediata. 
			  Ejemplos: Memcached, Redis.
- Su mayor ventaja es que son sumamente rapidas
- La respuesta llega en el minimo de tiempo
- Su desventaja es que son limitadas y hay que guardar cosas en disco
- Otra desventaja es que son volatiles (si se reinicia, hay que indexar, volver a traer la informacion del disco)			  

- Optimizadas para busquedas: Pueden ser de diversas estructuras, su ventaja radica en que 
							  se pueden hacer queries y busquedas complejas de manera sencilla. 
							  Ejemplos: BigQuery, Elasticsearch.
- Se usa para hacer queries complejos
- Sirven como grandes repositorios de datos, muchas veces historicos
- Son utilizadas en Business Inteligent y Machine learning							  



## ?? Firebase: ??

Firebase (Firestore). Es una plataforma muy utilizada para el desarrollo de aplicaciones web y 
aplicaciones moviles. Como usa un conjunto de herramientas multiplataforma es compatible con 
grandes plataformas, como IOS, Android, aplicaciones web, Unity y C++. Es muy recomendable para desarrollos.

Jerarquia de datos

1. Base de Datos: Contiene toda la informacion que se quiere guardar.

2. Coleccion: Es igual a las tablas en las bases de datos relacionales. 
			  Son objetos que agrupan (Documentos) la informacion que se desea guardar.

3. Documento: Es la informacion que se quiere guardar. Se guarda en un 
			  formato muy parecido al formato JSON (es un lenguaje que se utiliza para 
			  comunicarse con diferentes lenguajes o aplicaciones). Los documentos dentro de ellos contienen datos.

El modelo de bases de datos no relacionales es un poco mas cercano al mundo real en su comportamiento.

Las top level collections son las colecciones que se tienen de inmediato o entrada en el proyecto.
Firebase es un servicio que tiene multiples opciones y esta pensado principalmente para aplicaciones moviles y web.			  



##  ?? BASES DE DATOS EN LA VIDA REAL ?? ## 

Hoy en dia, se utilizan diversos tipos de bases de datos segun el problema que se quiera resolver:
Las bases de datos relacionales, durante mucho tiempo, fueron utilizadas para resolver todo tipo de situaciones, 
pero al aumentar enormemente el numero de datos a manejar, se volveron ineficientes en muchos casos.

Firestore o MongoDB nos permiten obtener los datos actuales de la aplicacion de manera simple. 
Sin embargo, no nos permite hacer, por ejemplo, queries muy complejos.
En una misma disciplina, es probable que haya que utilizar mas de un tipo de bases de datos.

##  ?? BIG DATA ?? ## 

Las 5 V del Big Data.

Gran Volumen, Variabilidad de fuentes, Velocidad de generacion de informacion, Veracidad, Valor

Los macrodatos (Big Data) se pueden describir por las siguientes caracteristicas:

Volumen: la cantidad de datos generados y guardados.
Variedad: el tipo y naturaleza de los datos para ayudar a las personas a analizar los datos y usar los resultados de forma eficaz. Los macrodatos usan textos, imagenes, audio y video. Tambi¨¦n completan pedazos ?Qu¨¦ pedazos? pedidos a trav¨¦s de la fusion de datos.
Velocidad: en este contexto, la velocidad a la cual se generan y procesan los datos para cumplir las exigencias y desafios de su analisis.
Veracidad: la calidad de los datos capturados puede variar mucho y asi afectar a los resultados del analisis.
Valor: los datos generados deben ser utiles, accionables y tener valor.32

##  ?? Data Warehouse ?? ## 

Satisfacen la necesidad de guardar masivas cantidades de datos historicos, 
lo que se conoce como archivo muerto, es decir son un almac¨¦n de datos. 

Tienen el fin analizar el historial de datos y generar conclusiones interesantes

Data Warehouse: Almac¨¦n de datos, se utiliza para almacenar grandes cantidades de 
datos de manera historica una de las tipos de base de datos que se utiliza es big table o big Query.

Ejemplos

Big Table ¡ú se guardan los datos en una sola tabla (Google)
Big Query ¡ú almacena gran cantidad de datos optimizados para querys

Un Data Warehouse es una coleccion de datos

- orientada a sujetos
- integrada
- variante en el tiempo
- no volatil

Que soporta el proceso de toma de decisiones. Un Data Warehouse soporta procesamiento informatico,
brindando una solida plataforma de datos historicos, integrados, de los cuales hacer analisis.

En primer lugar, DW no es un producto que pueda ser comprado en el mercado, sino mas bien un concepto que debe ser construido. 
DW es una combinacion de conceptos y tecnologia que cambian significativamente la manera en que es entregada la informacion
 a la gente de negocios. El objetivo principal es satisfacer los requerimientos de informacion internos de la empresa para 
 una mejor gestion, con eficiencia y facilidad de acceso.

El DW puede verse como una bodega donde estan almacenados todos los datos necesarios para realizar las 
funciones de gestion de la empresa, de manera que puedan utilizarse facilmente segun se necesiten.


##  ?? Data Mining ?? ## 

Se utiliza para minar datos, se basa en extraer datos de donde sea que est¨¦n, 
organizarlos y que puedan ser utilizables.

Es la t¨¦cnica aplicada a fuentes de datos que pueden bien organizadas o no estar 
organizadas, para extraer datos que proveen de valor y sentido a los datos existentes, 
pero organizados de una manera mas aprovechable. 


##  ??  ETL(Extract, Transform and Load) ?? ## 

ETL son las siglas de Extract, Transform, Load (extraer, transformar y cargar). 
Es una disciplina 
Se trata de tomar datos de archivos muertos y convertirlos en algo que sea de utilidad para el negocio.

Tambi¨¦n ayuda a tomar los datos vivos de la aplicacion, transformarlos y guardarlos en un data warehouse periodicamente.

No necesariamente etl toma datos de origen como bases de datos 
como Oracle, SQL, MySQL (bds relacionales) o alguna que otra BD no relacional. 

Tambi¨¦n puede tomar o extraer informacion desde archivos planos, csv, Excel o desde otro DTW.

LAs ETL se usan en el ambito del DataWarehouse, sin embargo con el desarrollodel 
cloud nace el DataLake que usa las ELT, entonces, la diferencia entre ETL y ELT depende de 
donde se transforman los datos y cuantos datos se retienen en almacenes de datos operativos.

ETL es una de las herramientas/t¨¦cnicas que se utilizan en Data Mining.

##  ??  Business Intelligence ?? ##

 Es una parte muy importante de las carreras de datos ya que es el punto final 
 del manejo de estos. Su razon de ser es tener la informacion lista, clara y que 
 tenga todos los elementos para tomar decisiones en una empresa.
 
 Business intelligence: Tener todos los datos (actuales e historicos) de manera clara y oportuna, 
 para que sean utiles para el momento de tomar decisiones de negocios basados en esos datos.
 
 
Es necesario tener una buena sensibilidad por entender el negocio, sus necesidades y la 
informacion que puede llevar a tomar decisiones en el momento adecuado al momento de 
realizar business intelligence.

En definitiva, una solucion BI completa permite:

Observar ?qu¨¦ esta ocurriendo?

Comprender ?por qu¨¦ ocurre?

Predecir ?qu¨¦ ocurriria?

Colaborar ?qu¨¦ deberia hacer el equipo?

Decidir ?qu¨¦ camino se debe seguir?

Fuente: https://www.sinnexus.com/business_intelligence/

Esta clase es mas importante de lo que parece. Se toca un tema que muchos ignoran en su vida profesional. 
Un hecho. Los clientes no son colegas. Si vendes un sitio web, ahorrate el hablar de HTML, CSS, JS, etc. Al cliente
 no le interesa.
 
Claro que tenemos que explicar ciertos detalles, como que se debe pagar una cuota anual de x cantidad 
para poder mantener el sitio web online. Pero cero tecnicismos.

Recuerda que estas con un cliente para venderle. Explicale por qu¨¦ le debe 
importar el cambio, no el proceso del cambio.

##  ??  Machine Learning ?? ##

Machine Learning tiene significados que varian. Es una serie de t¨¦cnicas que involucran la inteligencia 
artificial y la deteccion de patrones.

Machine learning para datos tiene un gran campo de accion y es un paso mas alla del business intelligence.
Nos ayuda a hacer modelos que encuentran patrones fortuitos encontrando correlaciones inesperadas.

### Tiene dos casos de uso particulares:

- Clasificacion
- Prediccion


Nos ayuda a crear Modelos para encontrar patrones (Clasificacion), tambi¨¦n para prediccion, analizando 
por ejemplo ventas con relacion a informacion transversal, en un rango de fecha determinada pasada, 
luego se genera un modelo y este se usa con todos los datos de las ventas hasta la actualidad y puede 
encontrar relaciones como por ejemplo ventas en vacaciones aumentan, y asi se puede predecir como seran 
las ventas en las proximas vacaciones

- IA: Abarca a machine learning y deep learning y busca eliminar al humano en la creacion 
	  de algoritmos y que todo ese proceso lo haga una computadora

Machine learning: como dijo Israel, crea modelo y al se?arle te encontrada modelos fortuitos, 
				  cuando le des una mar de datos ¨¦l te va encontrar patrones

Deep learning: le busca sentido a los datos.

Una IA es un sistema que es inteligente, usando machine learning puedes buscar en una BBDD 
cuando tus clientes te compran mas y te daras cuenta que es en finales de a?os y usando deep 
learning la computadora es capaz de encontrar el porqu¨¦ te compran mas.


##  ??  Data Science ?? ##

es aplicar todas las t¨¦cnicas de procesamiento de datos. En su manera mas pura tiene 
que ver con gente con un background de estadisticas y ciencias duras.

 Es aplicar todo lo que hemos visto, tecnicas de ETL, Data Mining, Business Intelligence. 
 Aunque esta mas dirigida a personas con background de estadisticas, hoy en dia tambien 
 participan personas con el perfil de Data Engineering. Al hacer Data Science estamos aplicando 
 todo lo visto en los temas anteriores, no solo a nivel tecnico sino que desarrollamos la experiencia 
 y conocimientos sobre las distintas tecnologias, en que parte del desarrollo de nuestro proyecto tenemos 
 que utilizarlas, etc. Con lo cual el Data Science juega el papel de manager dentro de un equipo de profesionales 
 de datos.
 
 
 El teorema CAP te ayuda a tomar en cuenta 3 factores clave:

Consistencia.
Disponibilidad.
Tolerancia a la particion.

