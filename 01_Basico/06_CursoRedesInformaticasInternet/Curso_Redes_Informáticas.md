-*/-*/-/-/-*/-*/-*/-/Curso de Redes Informáticas de Internet-*/-*/-*/-*/-*/-*/-*/-*

/-/-/-/-/-*/-Antecedentes de las redes computacionales/--/-/--/-/-/-/-/-/-/-

“Los humanos tenemos la necesidad de comunicarnos”, por eso se crearon los teléfonos, las cartas, se utiliza el arte, etc.

Señales de humo/fuego/luz : Un inicio rudimentario por el cuál se hacían comunicaciones a larga distancia. Era inefectivo.

Servicio postal o correo : Un mensaje más detallado, enviando gracias al buzón y al servicio de un punto a otro. Su mayor defecto era cuando las comunicaciones requerían ser urgentes, como en casos de enfermedad o asuntos diplomáticos, ya que este medio podía demorar días en transmitir un mensaje.

Telégrafo : En sus inicios, al rededor de 1800, era conocido como telégrafo óptico. Tenía aspas de madera cuyas posiciones indicaba una letra o número. Esto evolucionó hasta llegar al telégrafo moderno, el cuál utilizaba el código Morse (que realizaba combinaciones de pulsaciones). Se utilizó principalmente para mensajes cortos, y esto era su problema, a pesar de solucionar la transmisión rápida de mensajes.

Teléfono : Se logra transmitir voz de un punto a otro. Al inicio pocos tenían acceso a esta tecnología pero poco a poco se volvió accesible.
Teléfono de disco - Teléfono fijo - Teléfono inalámbrico - Teléfono móvil (1G, 2G, 3G, 4G y pronto 5G)

Radio : Utiliza señales de radio para transmitir, desde un nodo central a varios nodos receptores. A medida que nos alejamos se pierde la comunicación, ya que existe un limitante.

Televisión : Por cable o por antena satelital.

Las señales pueden ser transmitidas por cable o de manera inalámbrica.
En USA, ARPA conduce le proyecto ARPANET al rededor de 1973 junto con unas universidades donde crearon protocolos de comunicación para que pudieran comunicarse computadoras de un punto a otro, inicialmente eran 4 nodos. Son antecesores del internet, por eso se dice que “fue la primera versión del internet”.



-*/*//-*/*-/-*/-*/-*/-*/-*/-¿Qué son las redes computacionales?-*/-*/-*/-*/-*/-*/-*/-*

Respuesta formal: “Computadoras autónomas interconectadas mediante una sola tecnología”

¿Cómo se ven las redes?

Pueden verse de diferentes formas puesto que hay varios tipos de computadoras y tecnologías, por ejemplo una raspberry, telefonos inteligentes, laptop, etc.

Medios de transmisión

*Cables de cobre
*Cables de fibra óptica
*Cables coaxiales

*Microondas
*Satelite
*Radio Frecuencia(Bluetooth)
*Wifi

Existen los rangos de frecuencia que son señales que se encuentran mas alla de la luz visible y hay señales que no podemos ver como la señales infrarrojo, las señales microonda y las señales de radio.




-*/-*/-*/-*/-*/-*/-*/-/-/-*/-/-¿Por qué son importantes las redes de datos? Hoy en día las utilizamos más que nunca para estar conectados y se puede ver su uso en los siguientes escenarios:-*/-*/-*/-*/-*/-/-/-/-/-

Militar, sistemas gubernamentales y diversas instituciones: En este tipo de instituciones se maneja información confidencial que hay que cuidar, por lo tanto, las redes que manejan en estas instituciones
son mas robustas que las que manejas en tu casa.

Hogar: se tiene solo un dispositivo para conectarte a internet de alguna manera o a través de los datos de tu celular y la protección es relativamente baja, por lo regular ninguna cuenta con un firewall que le ayude a las personas a proteger sus datos

Centros de datos: son lugares donde se almacenan grandes cantidades de datos que son
relevantes y es importante que esta información tenga alta disponibilidad, que sea guardada de forma segura
para que solo puedan tener acceso a ella las personas autorizadas.

Escuelas y oficinas: Hoy en día es muy raro ver que no hagan uso de las redes y el internet,
quizas en las escuelas primarias aun no se ha masificado su uso.
En las oficinas de trabajo está en juego la información sensible de la empresa por lo que las redes de estos sitios deben contar con niveles de acceso para los usuarios y determinar el acceso a internet.

-*/-/-*/-*/Clasificación de las redes computacionales-*/-*/-*/-*/-/-/-/

Existen 2 divisiones principales:

Por la tecnología de transmisión

Por la escala o tamaño a la que pueda llegar a tener

Para la tecnología de transmisión existen 3 maneras de clasificarlo:

Conexiones 1 a 1 (Unicast)

Conexiones 1 a varios (Multicast)

Conexiones 1 a todos (Broadcast)

Enlaces de difusión (Broadcast)

Todas las máquinas en la red comparten el canal de comunicación

Los paquetes que envía una máquina la reciben todas las demás

Se usa un campo verificador para saber a quién pertenece o si enviar a todos los destinos

Multicast (Uno a varios)

Algunos sistemas permiten enviar sólo a un subconjunto
Unicast (Enlaces punto apunto)

Conecta pares individuales de máquinas

Puede visitar máquinas intermedias entre su origen y destino

Clasificación por escala (PAN, LAN, WAN, MAN)

PAN: Redes de uso personal (celular, smartwatch, audifonos…)

LAN: Redes de área local (redes de una cas, escuela, oficina…)

MAN: redes de área metropolitana(ciudades, espacio entre locales …)

WAN: Red de área amplia (paises o zonas similarmente amplias)
Resumen: Clasificación de las redes computacionales


-/-*/-*/-*/-*/-*/-*/-*/-*/-/-/-*/Protocolos De Red*/-/-/-/-/-/-/-/-/

La mayoría de las redes utilizan una pila de capas para organizarse, cada una se construye a partir de la que tiene debajo.
Capa capa proporciona servicios a la capa superior y oculta detalles de cómo implementa sus propios servicios en la capa inferior.
Protocolo De Red

Son las reglas que permiten la comunicación y transmisión de información
Existen dos modelos de comunicación principales divididos en capas y cada capa cuenta con ciertos protocolos

Jerarquía de Protocolos

La jerarquía de los protocolos y su organización en capas reduce la complejidad del diseño de una red y permite la correcta transmisión de los datos.

-*/-*/-/-/*/-/-/-/-/--*/*-Niveles de las capas:-*/-/-*/-*/-*/-*/-*/-*/-*/-*/

Capa 1 (Interfaz de red): La primera capa es el nivel más bajo de comunicación que está conformado por pulsaciones eléctricas o trasporte físico. Solo transmite la información por medio físico.
Capa 2 (internet): Se encarga de comunicar dos host para que transmitir los datos, estable la ruta para que llegue la información al punto deseado.
Capa 3 (Transporte): Se encarga de transferir los archivos entre los dos host, para esto existen varios protocolos, por ejemplo el protocolo “TCP” que se encarga de transmitir los datos priorizando la fiabilidad de los mismos (que no se pierda información en el camino) y el protocolo “UDP” que se encarga de la velocidad de transmisión de datos antes que la fiabilidad del mismo (prefiere mandar los datos lo más rápido posible aun que pierda algo de información en el camino).
Capa 4 (Aplicación): Ofrece a las aplicaciones (de usuario o no) la posibilidad de acceder a los servicios de las demás capas y define los protocolos que utilizan las aplicaciones para intercambiar datos, como correo electrónico (POP y SMTP), gestores de bases de datos y protocolos de transferencia de archivos (FTP).

-/-/-*/-/-/-/-/-/*El protocolo IP-*/-*/-*/-*/-/-/-*/-*/-*/

El protocolo IP se encarga principalmente del ruteo.

Es la manera en la que se va a transmitir la informacion o los caminos que van a tomar

Este protocolo tiene ciertos rangos para asignar lasIP

Dentro de tu red tambien puedes establecer una mascara de sub-red, que es una manera de establecer limites entre los hosts que se pueden tomar

*/-*/-*/-*/-*/*-/*-/-*/-*/-*/*-/-ORGANISMOS-*/-*/-*/-*/-/-*/-/-/-*/

Información de cada uno en los siguientes links:

ICANN: Internet Corporation for Assigned Names and Numbers

IANA: Internet Assigned Numbers Authority



*/-*-*/-*/-*/-*/-*/-*/-*/-*/-*/-*/-*/Modelo OSI-*/-*/-/-/-/-*/-*/-*/-*/-*/-*/-

Resumen: Modelo OSI (Open System Interconection )

Lo utilizamos para explicar y entender una comunicación entre un host y su destino en una red LAN,MAN o WAN

Además ayuda a categorizar los protocolos

1ra Capa: Fisica

Se encarga de los medios de comunicación (Cableado, electricidad … )
2da capa: Enlace de datos

Se le añade un nivel logico

La capa que convertia la información a bits le pasa l informacion a la capa 2 del enlace de datos

en esta capa:

Se envian los datos que se convirtieron a bits

se le añade informacion sobre el direccionamiento fisico

llega a la capa de red

3ra capa: Red

Se hace la definición de ruta y el direccionamiento de información
(Ruta: Camino que va a tomar la información a través de la red )

4ta capa: Transporte

Se añade la información de la conexión punto a punto y la confiabilidad (Se encuentran protocolos como TCP)
5ta capa: sesión

Se establece la comunicación entre dos host
6ta capa: presentación

Formatea los datos (para transferirlos a la capa 7)
7ma capa: Aplicación

Con la que tiene contacto directo el usuario

Adicional:

Se dice no oficialmente que la capa 8 somos los usuarios por lo que al decir “error de la capa 8” se quiere decir “error del usuario”



-*/-*/-*/-*//Resumen : Capa física-*/-*/-*//-*/

Como su nobre lo indica se refiere a aspectos fisicos (Hardware)
Tipo de cableado
Confiabilidad
3.Transmicion
…
Se trata de transmitir electricidad
**- Nos debemos preocupar por: **

Los medios de comunicación

la señalización

transmisión binaria a través de un canal

Encontramos protocolos como:

RS-232

RJ45


-/*-/-*/-*/-*/-*/-*Resumen: Capa de enlace de datos-*/*-/-*/-/-*/-*/

*Su principal propósito es el direccionamiento (aquí se encuentran protocolos como MAC)

*Para evitar que la información que pasa de la capa 1 a la capa 3 tenga errores es que se divide la información en tramos (Si es confiable mandara un mensaje de confirmación )

La capa de enlace de datos también se tiene que preocupar por el control de acceso

*Esta capa al tener por ejemplo un emisor que envía mucha información y un receptor que recibe muy poca información evita que el receptor se inunde de información.
(Se encuentran protocolos como: Ethernet, 802.11, MAC …)


En clases anteriores aprendiste cómo se pueden identificar dispositivos dentro de una red a través de la dirección IP, sin embargo, esta no es la única forma.

Cuando queremos mandar información a través de una red que comparte recursos se envía a través de un paquete. Este paquete tiene definido un receptor específico, y solo este receptor debe procesar el paquete para que el envío de información no se vea comprometido.

Para recuperar los paquetes que se envían a través de la red se debe realizar un proceso conocido como demultiplexación, que consiste en separar los diferentes paquetes que viajan en la red para que los procese el receptor. Este proceso de demultiplexación requiere una dirección para llevarse a cabo.

La IEEE desarrolló un esquema de direccionamiento, donde a cada dirección se le asignan 48 bits, denominado como dirección de control de acceso al medio (dirección MAC). La razón por la que las direcciones tienen 48 bits es debido a que se originó junto con la tecnología Ethernet. Esta dirección MAC o también conocida como dirección Ethernet, es asignada por la IEEE a cada pieza de hardware de interfaz de red que existe, es decir, a cada dispositivo que se puede conectar a una red.

Lo mejor de tener un identificador de red para cada dispositivo de manera física es que la IEEE en vez de asignar de manera individual una dirección MAC a cada dispositivo, lo que hizo fue dividir la dirección en dos bloques.

El primer bloque de la dirección consta de 24 bits (3 bytes) que son el identificador único de la organización (OUI). En pocas palabras este identificador sirve para conocer quién es el fabricante de la tarjeta de red.

El segundo bloque cuenta igual con 24 bits que corresponde al controlador de interfaz de red (NIC), mejor conocido como tarjeta o interfaz de red. Este último bloque es asignado por la IEEE cuando se fabrica el dispositivo.

La forma en la que está constituida esta dirección puede verse en el siguiente diagrama:

imagen-mac
Al contrario de las direcciones IP que son representadas a través de una notación decimal en un conjunto de 4 bytes. Las direcciones MAC se representan a través de 6 bloques de 8 bits cada uno en el sistema hexadecimal. Por ejemplo AA:AA:AA:BB:BB:BB, donde los bloques con la letra “A” representan el espacio del OUI y los bloques con “B” identifican al NIC.

Con esto tienes los conocimientos necesarios para describir lo que es una dirección MAC y cómo es que está asociada a todos los dispositivos conectados de manera única a una red. ¡Nos vemos en la siguiente clase

/*-*/-*/-*/-*/-*/-*/-*/-/-/-Capa de RED:-*/-/-*/-*/-/-*/-/-*/-*/-*/-*

Encargada de enrutar los datos a traves de diferentes redes
Direccionamiento de paquetes
Encapsular/Desencapsular paquetes
TTL Time To Live: Cantidad maxima de saltos por los que debe pasar un mensaje hasta que es rechazado (default 64)



*-/-*/-*/-*/-*/-*/*/-*/-Capa de transporte-*/-*/-*/-/-*/-*/-*/-/-/-*

Se tienen verdaderas conexiones de extremo a extremo (de un host a otro)

Tiene como objetivo las conexiones punto a punto y la confiabilidad

La confiabilidad tiene 2 protocolos principales:

TCP
UDP
Uno esta orientado a la confiabilidad y el otro no
++**TCP: **++Hace una confirmación al enviar archivos

++**UDP: **++solo envía los datos

Una de las tareas principales es que la capa de arriba envía la información y busca que la misma se transmita correctamente a la capa de abajo.
-Se encuentran los siguientes protocolos: SSL y TLS

Hablan de la seguridad de la conexion (Encriptado, viajar por un canal seguro …)

-*/-*/-*/-*/-*/-/-/*Resumen : Capa de sesión-/-*/-*/-*/-*/-*/-*/-*/-/

Su objetivo es la comunicación entre hosts

Establece una sesión de un punto a otro

Al diseñarla se tiene que tomar en cuenta el control de la transmisión (¿Quién envía? ¿Quién recibe? )

Tokens:

Solo se usan una vez

Se utilizan para acceder

Solo tu la puedes conocer

Es única para ti

Sincronización:

Esto se refiere a que esta capa tiene que ser diseñada de tal manera de que al enviar un mensaje, y este sea interrumpido, pueda recuperarse de esta interrupción y continuar desde donde se quedo.

*/-*/-*/-*/-*/-*/Resumen: Capa de presentación.-*/-*/-/-/-*/-/-/-*/

Su objetivo es la representación de datos

Se tienen protocolos como:

HTML

DOC

JPEG

MP3

…

En esta capa se formatean los unos y ceros (deacuerdo al protocolo que corresponde al formato del archivo) y se acumulan de una forma que sea entendible para nosotros como humanos


-*/-*/-*/-*/-/Wireshark -*/-*-*/-/*/-

es un programa que nos sirve para capturar el tráfico de nuestra red y poder inspeccionar los diferentes paquetes que viajan por ella. Su instalación es bastante sencilla por lo que a continuación te explico cómo puedes instalarlo en cada uno de los diferentes sistemas operativos.

-*/-/-*/-/CAPA DE APLICACIÓN-/-/-*/-/-*/
Ofrece a las aplicaciones (de usuario o no) la posibilidad de acceder a los servicios de las demás capas y define los protocolos que utilizan las aplicaciones para intercambiar datos.


-*/-*/-*/-/-/Conoce los dispositivos de redes y cómo funcionan-/-/-/-/-/-*/-*/-*/-*/-*/

- Hub y switch

Se inventaron hace muchos años (desde los inicios de las redes computacionales)

Solo funcionaba como repetidor o distribuidor de una red

Aquí llegaban todos los paquetes y luego se distribuían a las maquinas

- Modem:

Provee internet

Convierte señales análogas a eléctricas y viceversa

Puede ser acompañado de repetidores de señal

- Firewall:

Puede ser lógico

protege el modem o subida de internet

Con señales externas este puede decidir si pueden pasar, debe ser bloqueada o alguna acción correspondiente

- Balanceador de trafico.

Distribuye todo el trafico de red que se esta recibiendo mediante ciertas técnicas.
(Se tienen dos esquemas: activo-activo y activo-pasivo)

- Activo-activo:

Tienen “n” numero de servidores y distribuyen el trafico por igual en estos servidores
-** Activo-pasivo:**

Tiene un clúster activo (el que esta trabajando) y un clúster pasivo.
Cuando el clúster principal se sobrecarga se lleva la carga al clúster pasivo