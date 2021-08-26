#  Curso de Introducción a la Web: Historia y Funcionamiento de Internet

## ¿Cómo empezó todo?
⠀
⠀
Los problemas que se intentaban recolver con las máquinas y computadoras era el Cálculo.
⠀
El Ábaco es considerado como la primera computadora. El uso del Ábaco consiste en conteos decimales.
⠀
Aparecieron las máquinas mecánicas no eléctricas que ayudaban a hacer cálculos con mayor complejidad.
⠀
Luego aparecieron las computadoras humanas, consistía en que las personas eran las encargadas de cálculos manualmente.
⠀
En los años 40, aprecieron las máquinas que se podian programar, estuvieron muy presentes durante la guerra, pero existía el problema de la falta de almacenamiento de datos, asi que aparecieron las tarjetas perforadas que tenían como principal función el de guardar información.
⠀
Posteriormente nació el Maquine Code (Lenguaje de Máquina), para realizar los cálculos utilizando el sistema binario. Esto presentaba un gran nivel de dificultad así que nacieron los lenguajes de programación.
⠀
Entre los primeros lenguajes se encontraban Fortran, Cobol, Basic, C, Pascal y C++.
⠀
Maquine Code es considerado como un lenguaje de bajo nivel.

## -*/-/-*/-/-*/-*/-*/Binario-/-*/-/-*/-/-/-/
⠀
Machine Code es un lenguaje binario. El sistema binario es basicamente un sistema de conteo.

La computadora solo entiende en ceros y unos.

⠀

Ejemplo: Número 70 a binario
128 64 32 16 8 4 2 1 → estos números son usados como referencia para convertir un número decimal a binario.
⠀
128 → 0 (128 > 70, el dígito es 0)
64 → 1 (64 < 70, el dígito es 1 y utilizamos el resto 70 - 64 = 6)
32 → 0 (32 > 6, el dígito es 0)
16 → 0 (16 > 6, el dígito es 0 )
8 → 0 (8 > 6, el dígito es 0 )
4 → 1 (4 < 6, el dígito es 1 y utilizamos el resto 6 - 4 = 2)
2 → 1 (2 = 2, el dígito es 1, como el resto llegó a ser 0, el resto de dígitos es 0)
1 → 0 (1 > 0, el dígito es 0)
⠀
El resultado es 70(decimal) → 01000110(binario)
⠀

Ejemplo: Número 151 a binario
128 64 32 16 8 4 2 1 → estos números son usados como referencia para convertir un número decimal a binario.
⠀
128 → 1 (128 < 151, el dígito es 1 y utilizamos el resto 151 - 128 = 23)
64 → 0 (64 > 23, el dígito es 0)
32 → 0 (32 > 23, el dígito es 0)
16 → 1 (16 < 23, el dígito es 1 y utilizamos el resto 23 - 16 = 7)
8 → 0 (8 > 7, el dígito es 0 )
4 → 1 (4 < 7, el dígito es 1 y utilizamos el resto 7 - 4 = 3)
2 → 1 (2 < 3, el dígito es 1 y utilizamos el resto 3 - 2 = 1)
1 → 1 (1 = 1, el dígito es 1)
⠀
El resultado es 151(decimal) → 10010111(binario)


## /*-*/-*/-*/-*/-*/Bits y Bytes-*/-*/-*/-*/-*
⠀

⠀
La computadora entiende todo en base a un sistema binario compuesto por bits y bytes.
⠀
Bit = Cada dígito del sistema binario.
Byte = La combinación de 8 bits.
⠀
Transistores: La forma en que la computadora entiende los unos y ceros.

Funciona con 2 estados: ON-OFF; True-False; 0-1


*/-/-/-*/-*/-*/-/-/-*//-*/-*/
¡ = 173 --> 10101101
H = 72 --> 01001000
o = 111 --> 01101111
l = 108 --> 01101100
a = 97 --> 01100001
! = 33 --> 00100001

## */-/-*/-*/-*/-*/-*/*-/-*/-*/ UNICODE -/-/-*/-*/-*/-*/-*/-*/-/-/-
Unicode es un estándar de que se usa para admitir caracteres no compatibles con ASCII.

Unicode permite todos los idiomas del mundo y sus caracteres únicos. Los caracteres ASCII solo requieren 7 bits, mientras que UNICODE usa 16.

Unicode define tres formas de codificar bajo el nombre UTF (Unicode Transformation Format).

UTF-8: Codificación orientada a Byte con símbolos de longitud variable.
-** UTF-16**: codificación de 16 bits de longitud variable optimizada para la representación del plano básico multilingüe (BMP).
UTF-32: codificación de 32 bits de longitud fija, y la más sencilla de las tres.


## */-/-*/-/-/-*/-*/-*/--*/-*RGB-*/-/-/-*/-*/-*/-*/
Es un formato de colores.
Cada pixel dentro de una imagen está compuesta por 3 subpixeles: Rojo (Red), Verde (Green) y Azul (Blue) con un tono de 0 a 255.
⠀
Ejemplos:
- Negro (0, 0, 0)
- Blanco (255, 255, 255)
- Rojo (255, 0, 0)
⠀
Combinando tonalidades se pueden formar colores específicos.
⠀
Ejemplos:
- Plum Purple (178, 80, 228) - 10110010, 01010000, 11100100
⠀
Cada pixel representa un cálculo de la computadora.


## ¿De dónde viene el Internet?
⠀

⠀
El internet viene directamente de los cables, los cuales hacen que podamos establecer una conexión con otras computadoras.
⠀
La mayoría están dentro del mar. Internet backbone (mapa de infraestructura).
⠀
Internet es una abreviación de Internetworking, se creó lso años 70 para referirse a los cables físicos y las computadoras que se conectan entre sí.
⠀
Nace de un proyecto de investigación académico llamado ARPANET (Advanced Research Projects Agency NETwork), la intención era conectar computadoras para compartir información.
⠀
Posteriormente empiezan a surgir los protocolos de Internet.


## -/-/-/-/-/-/-/La web ≠ Internet/-/-/-/-/-/-/
La web o World Wide Web es un sistema que funciona a través de internet por el cual se pueden transmitir diversos tipos de datos del protocolo de transferencia de hipertexto o HTTP, que son los enlaces de las páginas web.
Internet es un conjunto de redes de comunicación interconectadas. Permite una comunicación mediante el protocolo TCP/IP -transmission control protocol/ internet protocol.

## -*/-/-/-/-*/Datos interesantes de los ISP-*/-/-/-/-*/

Los ISP en pocas palabras lo que nos dan es acceso a la dirección IP

Un ISP conecta a sus usuarios a Internet a través de diferentes tecnologías como fibra óptica, ADSL, cablemódem, GSM, dial-up, etc.

Los ISP son como Telmex, GTD, Claro, Telecentro, Cablevision, Axtel, etc.

La velocidad promedio de internet en latinoamérica es de 6 mbps

ISP o Proveedor de Servicios de Internet (Del inglés Internet Service Provider), es el término con el que se identifica a las compañías que proporcionan acceso a Internet, tanto a los hogares como a otras empresas.

## -*/-*/-*/-/¿CÓMO FUNCIONA UN ISP?-*/-*/-*/-/-/-*/
Básicamente, lo que hace un ISP es desplegar una red de telecomunicaciones que se conecta a otras redes.

Existe una jerarquía de proveedores en función del nivel de red al que se conecta cada ISP. El nivel más bajo se denomina Tier 3, y conecta redes privadas empresariales y ordenadores personales con los ISP de nivel Tier 2. Éstos tienen una cobertura de ámbito local o nacional y pueden conectarse entre si o también conectarse con los ISP de nivel Tier 1, que son los que tienen cobertura internacional.

## -*/-*/-*/-*/-/¿QUÉ TIPOS DE ISP EXISTEN?-*/-*/-/-/-/-/*
En los inicios de Internet, los únicos ISP que tenían autorización para proporcionar conexiones eran organismos gubernamentales, empresas de investigación y universidades. Con el paso de los años y la expansión de la red se multiplicaron los ISP, aunque estas son, en su mayoría, empresas de telecomunicaciones.

➡️PROVEEDORES DE ACCESO TELEFÓNICO
➡️PROVEEDORES DE ACCESO POR DSL
➡️PROVEEDORES DE ACCESO POR CABLE
➡️PROVEEDORES DE BANDA ANCHA INALÁMBRICA
➡️PROVEEDORES DE ACCESO POR SATÉLITE
➡️PROVEEDORES DE FIBRA ÓPTICA


## -*/-*/-/-/Los DNS podría verse como:-*/-/-/--*/*-/
DNS (Domain Name System)
Se crean para poder identificar a quien tenemos que contactar sin poner la dirección IP.
Ejemplo: 172.217.7.23 es la ip de Google, en vez de escribir la direccion ip podemos ingresar a la dirección a traves del dominio de Google
⠀
El DNS hace que sea mas fácil tener interacción con otro equipo.

Nuestro amigo tiene un número de teléfono: 300 211 9822 pero tengo el teléfono de tantas personas que no lo recordaré es muy difícil, entonces le asigno un nombre a ese contacto, por ejemplo Paco - 300 211 9822 así no tengo que digitar el número sino buscar a Paco y se llama a ese número.
Aparte del curso de fundamentos de ingeniería de software, mucho que lo que hemos visto es de redes y hay un curso (Y el avanzado) en Platzi: https://platzi.com/cursos/redes/


## -*/-/-*/-*/-*/-*/-/*-*El primer desarrollador Web*-/-*/-/-/-/-/-/-/*
⠀
Utilizamos la Web para compartir información.
⠀
Hubo un primer desarrollador Web, su nombre es Tim Berners-Lee.

Hizo la propuesta de W3, la cual es una forma de globalizar la información y poderla linkear.
Todo lo generó a través de una computadora NEXT.
Escribió las 3 tecnologías fundamentales para el desarrollo Web:
HTML: Lenguaje de marcado para la Web.
URL: Dirección a la que nos conectamos.
HTTP: Forma para comunicarnos a través de peticiones
Construyó el primer servidor Web.
Construyó el primer navegador.

https://cio.com.mx/navegadores-mas-de-20-anos-de-historia/




## *-/-*/-*/-/-/Web Browser*-/-*/-/-/-/-/
Han existido muchos navegadores, por ejemplo:

MOSAIC: Implementó lo primeros gráficos en los navegadores, este navegador ya no existe.
NetScape: Gracias a este navegador tenemos ahora JavaScript.
Google Chrome: Mejoró las interacciones con las páginas e inició con el desarrollo de las aplicaciones Web.

Mosaic fue el primer navegador en implementar gráficos, Netscape fue el primer navegador comercial que dominó y creo Java Script en 1994, sale internet explorer en 1995. En 1997 es la guerra de navegadores entre Netscape, Internet Explorer y Opera.

Firefox aparece en 2004, en 2008 Google revoluciona Google por su velocidad y diseño


## -*/-*/-*/-*/-*/El Protocolo de transferencia de hipertexto( Hypertext Transfer Protocol- HTTP) es el protocolo de comunicación que permite las transferencias de información en la World Wide Web.
■HTTP fue desarrollado por el World Wide Web Consortium y la Internet Engineering Task Force, 
■HTTP es un protocolo sin estado, es decir, no guarda ninguna información sobre conexiones anteriores.
El desarrollo de aplicaciones web necesita frecuentemente mantener estado. Para esto se usan las cookies, que es información que un servidor puede almacenar en el sistema cliente.
Esto le permite a las aplicaciones web instituir la noción de sesión, y también permite rastrear usuarios ya que las cookies pueden guardarse en el cliente por tiempo indeterminado.

HTTP (Hypertext Transfer Protocol)
HTTP son reglas de comunicación.
Para este protocolo existen HTTP Request y HTTP Response, los cuales se encarga del procesamiento de las solicitudes.
⠀
## Existen métodos dentro de HTTP:

GET: Solicita datos
POST: Envía datos.
PUT: Crea o reemplaza datos.
DELETE: Borra datos específicos.
⠀
HTTPS (Hypertext Transfer Protocol Secure).- Es la parte de seguridad en la conexión, las peticiones van encriptadas.

Estándares Web
Nacen a causa de la “Guerra de los Navegadores”, no existía una regla sobre a que dirección iba la Web, los navegadores implementaban sus propios estándares.

Estándares:

HTML: Arquitectura de la información, texto, actualmente HTML5.

CSS: Manejo de estilos, colores, diseño.

JavaScript: Interactividad, aplicaciones Web.

WebAssembly: Es un estándar que nació en diciembre del 2019, es un compilador.

## -*/-*/-*/-*/-/¿Dónde estamos ahora?*-/-*/-*/-*/-*/-*/
Hay 4000 millones de dispositivos conectados a la Web, estos dispositivos no solo son computadoras, ahora cualquier equipo puede llegar a conectarse a la Web.
Actualmente existen patrones de diseño para la Web para diversos dispositivos, como buenas prácticas se debería empezar por el diseño mobile first.
Internet of Things (Internet de las cosas).- Son objetos inteligentes conectados a internet, ej. un refrigerador, automovil, etc.
Machine Learning y Artificial Intelligence (Aprendizaje Automático e Inteligencia Artificial).- Son tecnologías que están creciendo actualmente y ambas están siendo aplicadas en muchos proyectos.
5G.- Gracias a esta tecnología incrementaremos el número de dispositivos conectados.

## *-/-*/-/-*/-/-*/*-/DOM*/-*/-*/-*/-*/-*/-
Todas páginas web están formadas por html, css y Javascript e independienemente de la cantidad de cada uno de ellos, los navegadores siempre siguen el mismo proceso para conseguir tanto el contenido como la manera en que éste se ha de mostrar al usuario:

|
🔸 Generar el árbol DOM a partir del html.
🔸 Generar el CSSOM Tree a partir del css.
🔸 Generar el Render Tree con la combinación del DOM y 🔸 CSSOM
🔸 Calcular la disposición o layout de todos los nodos.
🔸 Pintar los nodos del Render Tree.

|
5-pasos-que-siguen-los-navegadores-para-pintar-el-contenido-1.png

|
## **El DOM **
Es el árbol de nodos que representa los contenidos de la página o aplicación web. Estos contenidos están determinados por el HTML y, aunque se parezca bastante al DOM, no són lo mismo.
DOM (Document Object Model)
DOM es un árbol que se genera con la información de las etiquetas HTML.
Proporciona una representación estructural del documento, permitiendo la modificación de su contenido o su presentación visual.
Con JS ya podremos generar interactividad a través del DOM.

## ¿QUÉ ES UN NODO?

Un nodo es cada uno de los recuadros de las estructuras que vimos en la clase. Los nodos son los elementos básicos de la estructura del DOM. Estos se relacionan unos con otros en una estructura jerárquica, de modo que cada nodo tiene un nodo superior del que depende, que es el nodo padre. Cada nodo puede tener 0, 1, ó varios nodos dependientes de él, éstos serán los nodos hijos. Los nodos que están a un mismo nivel, dependiendo todos ellos del mismo nodo padre, son nodos hermanos. Todo el arbol del DOM depende de un nodo principal a partir del cual se generan todos los demás. Es el nodo Document.

También descubrí que hay tipos de NODOS. Se los dejo aquí:

Tipos de nodos
Aunque existen 12 tipos de nodos en realidad en las páginas web sólo tenemos los 5 siguientes:

Document: nodo raiz del que derivan todos los demas.
Element: Cada una de las etiquetas HTML. Es el unico nodo que puede contener atributos y del que pueden derivar otros nodos.
Attr; Cada atributo de una etiqueta genera un nodo Attr, el cual contiene también su valor (como una propiedad). Es hijo del nodo element (etiqueta) que lo contiene.
Text: Contiene el texto encerrado por una etiqueta HTML (hijo del nodo Element).
Comment: Los comentarios incluidos en la pagina HTML también generan sus nodos.
Los demás tipos de nodos son: CDATASection, EntityReference, Entity, ProcessingInstruction, DocumentType, DocumentFragment, Notation. Estos se usan en el lenguaje XML, pero en HTML, si se emplean, suelen ser elementos fijos bastante definidos (etiqueta Doctype, caracteres de escape, etc). Veamos cuáles son estos nodos:

CDatasection : Nodo que puede contener caracteres de escape escritos normalmente.
DocumentType : Declaración o etiqueta Doctype.
DocumentFragment : Fragmento o porción del arbol del DOM: Aunque no aparece en el documento HTML permite a Javascript (mediante los métodos del DOM) seleccionar un trozo del documento.
Entity : Caracter de escape o Entidad en XML.
EntityReference : Referencia a entidad XML.
ProcessingInstrution : Instrucciones de procesamiento.
Notation Anotaciones: parecido a “comment”, pero puede salir en pantalla en XML.

|
## ¿Cómo se genera el árbol DOM?
El DOM se genera a partir del fichero con extensión .html y sigue distintos pasos para generarse:

|
🔹 Convertir los bytes a carácteres.
🔹 Pasar de carácteres a tokens.
🔹 Generar los nodos.
🔹 Construir el árbol DOM.

|
En caso de que el navegador detecte un <script> no declarado como asíncrono en el <head> de la página, la creación del DOM será bloqueada hasta que el Javascript sea descargado y ejecutado. Por eso es importante declarar los scripts como asíncronos.

CSSOM (CSS Object Model)
CSSOM genera algo similar al DOM, genera un árbol con los estilos.
Permite leer y modificar el estilo de CSS de forma dinámica.


Pasos que hace el navegador

Procesa el HTML y construye el DOM
Procesa CSS y construye el CSSOM
Junta el DOM y el CSSOM en el render tree
Ejecuta el diseño en el render tree
Pinta el nodo en la pantalla
RENDER TREE

Es un árbol que une el DOM y CSSOM para renderizarlos, creando un código que pueda interpretar el navegador.

Proceso de renderizado

1. Bytes: El navegador coge todo el código y lo transforma en bytes.

2. Characters: El navegador transforma estos bytes en caracteres dependiendo de la codificación que le hemos pasado. Por ejemplo UTF-8.

3. Tokens: Ahora transforma dichos caracteres en tokens, identificando el significado de los caracteres relacionándolo a etiquetas que generan cierto tipo de contenido. W3C documenta todas la etiquetas.

4. Nodos: Después de saber el dicho orden de los tokens hará una transformación a los nodos, estos nodos son objetos. Dichos objetos son lo que el navegador sabe interpretar (Los elementos).

5. DOM: Ya cuando el navegador tiene todos los nodos los ordena en un árbol jerárquico donde cada objeto tendrá una posición dependiendo su etiqueta.

6. CSSROM: Transforma el CSS y une con el DOM. Asignando los estilos a cada elemento dentro del DOM.


## -*/-*/-*/-*/-*/Layout-/-*/-*/-*/-*-*
Es un esquema de la distribución de los elementos dentro de una página web. 
Se compone de una serie de bloques de ciertas dimensiones en los que se colocará el contenido. 
Estos bloques suelen trazarse a través de etiquetas HTML comunes, como div, o semánticas, como header, nav, 
section, article, aside y footer, incorporadas en HTML5.


## /-*/-*/-/-*/-/-*/Pintar*-/-*/-*/-*/-*/-*-/
En esta fase el navegador convierte al árbol de representación o Render Tree en píxeles en la pantalla.
|
Es curioso saber que las distintas propiedades de CSS cuestan más o menos de pintar dependiendo de como estén combinadas.
|
Supongamos el hipotético caso que se tardara 1 segundo en pintar un box-shadow. Si éste es combinado con una propiedad border, ésta, haría que tardase 1.5 segundos en vez de 1 segundo.



## PRINCIPALES MOTORES JS Y SUS DIFERENCIAS
El motor V8 javascript es el que usan los navegadores basados en chromium como chrome, el nuevo edge, brave etc, está escrito en C++ y compila todo el JS a código máquina directamente.
El motor SpiderMonkey está escrito en C y C++ es el que usa FireFox sin embargo, no es tan rápido como el motor V8 porque compila a un byte-code intermedio y no a código máquina.
El motor Rhino compila JS a clases de Java. 
JavaScriptCorepara Safari y Quantumpara Firefox.


Cuando llega un script al navegador el JS Engine inicia un proceso el cual consta de:
.

Recibir el código como un flujo de bytes UTF-16 y pasarlo a un decodificador de flujo de bytes (el cual hace parte del motor).

El parser toma el código y lo descompone en tokens (los tokens son elementos de js como: let, new, símbolos de operaciones, functions, promises).

Gracias a el anterior parseo se genera una estructura de datos en forma de árbol, o Abstract Syntax Tree (AST).

El intérprete recorre el AST y va generando el bytecode.

El optimizing compiler optimiza el código bytecode a machine code y se reemplaza el código base.

.
> Nota: El optimizing compiler encuentra los puntos donde el código se puede optimizar, no lo hace con todo el código. Normalmente optimiza el código que se repite varias veces, como por ejemplo un ciclo for muy largo.


## Writing process:

What do you want to communicate?
Why is it important?
Who is your audience?
.

Prewriting: Explore topics and ideas
Drafting: Put all the ideas on paper
Revising: Put only the main idea
Editing: Fix grammar, capitalization, and punctuation errors.
Publishing: Share the writing with your audience
.
I think (for me) the most difficult step of writing is prewriting because I´m not very creative