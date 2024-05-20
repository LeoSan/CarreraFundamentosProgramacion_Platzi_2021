# 01 - Curso Definitivo de HTML y CSS

## Clase 1: Bienvenida 
- Profesor Diego De Granda

Software Engineering Manager en Platzi
```
Aprende HTML y CSS desde cero, sin conocimientos previos. Conoce todo sobre etiquetas HTML, semántica, CSS, como dar estilos a los elementos de tu sitio web, medidas EM/REM, modelo de caja y mucho más. Aprenderás todo lo que necesitas para empezar en el desarrollo web online y a construir sitios para internet de manera eficiente.
```

## Clase 2: ¿Que es el front?

> El Frontend es el desarrollador que va a manejar las cosas del lado del cliente.

**Las tecnologías que trabajan son:**

- HTML https://devdocs.io/html/
- CSS https://devdocs.io/css/
- JS https://devdocs.io/javascript/

**Los frameworks de CSS que suelen manejar son**

- Bootstrap https://getbootstrap.com/
- Foundation CSS https://get.foundation/
- Materialize CSS https://materializecss.com/

**Los frameworks de JS:**

- React JS https://es.reactjs.org/
- Angular JS https://angular.io/
- Vue JS https://vuejs.org/

**Preprocesadores de CSS:**

- stylus https://stylus-lang.com/
- SASS https://sass-lang.com/
- Compiladores / empaquetadores de JS:
- BABEL https://babeljs.io/
- Webpack https://webpack.js.org/


## Clase 3: ¿Que es el Back?

> Back-end trabaja en el lado del servidor mientras el Front-end en el lado del cliente.
**Caracteristícas**
- Es el responsable de manejar toda la lógica que hay detrás de una petición dada por el navegador.
- Una característica que lo diferencia del Front-end es que no tiene estándares, ya que tiene varios lenguajes de programación (Node.js, Python, PHP, Ruby, GO, Java, .NET entre otros).
- Los Lenguajes que se usan tienen propios frameworks como Django (Python), Lavarel (PHP), Rails (Ruby), Express (JS), Spring (Java).
- El Back-end tambien tiene que tener en cuenta la infraestructura, donde va a generar el deploy de su aplicación (esto tambien puede ser tarea de un DevOps, un perfil dedicado a la infraestructura).
- Con tecnologías como Google Cloud, DigitalOcean, AWS y Heroku.
- Tiene la responsabilidad de elegir que bases de datos se debe implementar teniendo las No relacionales (mongoDB) y las relacionales. (MySQL)

## Clase 4: ¿Que es el FullStack?

> Son aquellos que tienen la habilidad y la posibilidad de desarrollar ambos roles front y back, es un rol muy disciplinado, ya que amerita dedicar mucho tiempo en aprender y dominar ambos mundos.

**Caracteristícas**
- No es sano manejar el 100%  de las tecnologías debido al ritmo y evolución acelerada que tiende esta área.
- Tiene la habilidad de entender el funcionamiento de la aplicación de inicio a fin.
- Tiene la experiencia de comprender toda la arquitectura.
- Tiene un área de especialidad puede entender las tecnologias y los standares pero tiene un nivel mayor de expertis Ejemplo soy FullStack pero me especializo en mas en backend
  

**Nota**
Pero NUNCA trabajes como fullstack, muchas empresas creen que contratando a un fullstack tienen suficiente para que les hagan sus aplicaciones de inicio a fin, realmente esto es trabajo de todo un equipo especializado en cada área.


## Clase 5: Páginas Dinámicas  y Estáticas 

**Sitos Web Estáticos** 
- La información que contiene, se mantiene constante y estática.
- No se actualiza con la interacción del usuario.
- Conveniente para landing pages (Páginas informativas) o Blogs.
- Serán siempre iguales para todos los usuarios.

**Herramientas**
- Drupal
- Magento
- Joomla
- Express
- HTML

**Sitios Web Dinámicos (Aplicaciones Web)** 
- Actualizan su información con respecto a la interacción del usuario.
- Dependen de una base de datos, de donde extrae e ingresa información.
- Serán diferentes, dependiendo del usuario que la use.

- **Herramientas**
- PHP
- Laravel
- HTML 5
- JAVA
- RUBY on RAILS

## Clase 6: HTML: anatomía de una página web

**La web se conforma de tres conceptos**
- URL  => Uniform Resource Locator.
- HTTP => Protocolo de transferencia de hipertexto.
- HTML =>  es el código que se utiliza para estructurar el contenido de tu web, y darle sentido y propósito.

**Caracteristícas**

- HTML son siglas, Hyper Text Markup Language (Lenguaje de Marcado de Hipertexto).
- Hyper Text  significa que el texto tiene interactividad, conexión con otros documentos.
- Se le conoce como un lenguaje de etiquetas. 
- HTML es un lenguaje interpretado. 
- HTML es un estándar, así que no importa desde que navegador, que dispositivo se ejecute, es lo mismo en cualquier sitio. Sigue siendo el mismo código.


## Clase 7: Index y su estructura básica: head

**¿Por que el archivo principal de nuestro sitio web se llama index?** 
- Porque es la página que el servidor va a buscar por default para mandar al usuario en a primera carga.
- Y si no la encuentra vamos a tener que decirle al server cual es la que queremos que muestre.
- y si no le indicamos cual mandar primero y no encontró el index el server va a mandar la estructura de carpetas de nuestro sitio web.

**Estructura Básica del Header: **
```
<!DOCTYPE html> <!-- 1 -->
<html lang="en"> <!-- 2 -->
<head> <!-- 3 -->
  <meta charset="UTF-8"> <!-- 4 -->
  <meta name="description" content="descripción breve"> <!-- 5 -->
  <meta name="robots" content="index, follow"> <!-- 6 -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 7-->
  <title>Document</title> <!--8 -->
  <link rel="stylesheet" href="style.css"> <!-- 9 -->
</head>
<body> <!-- 10 -->
  
</body>
</html>
```
**Notas**
1. Esta línea le dice al navegador que nuestro sitio web usa el estándar HTML5
2. Es la etiqueta padre que va a contener todas las demás etiquetas de nuestro archivo. El atributo lang nos permite indicarle al navegador el idioma del contenido de esta página esto permite a al navegador saber cual es el contenido que puede que ocupemos traducir
3. Aquí va todo lo que es importante para el navegador, para poder mostrar nuestro sitio de la forma en la que nosotros lo construimos pero que no es visual para el usuario final.

    *Ej. nuestros archivos css, las fuentes, librerías etc.*

4. Esta es una etiqueta meta, nos permite indicar la codificación de caracteres utilizada
5. Nos permite describir brevemente el contenido de la página web máximo 150 caracteres (SEO)
6. Le indica a los robots que pueden ayudarnos a colocar en los resultados de búsqueda según nuestro contenido. (SEO) follow permite acceso unfollow no permite acceso al roboto 
7. Para controlar el tamaño y escala del viewport (toda el área del navegador donde se renderiza nuestro sitio).
8. Nos permite dar un título a nuestra pagina, el titulo se muestra en los tabs del navegador.
9. Nos permite cargar dependencias para el correcto funcionamiento de nuestro sitio ej. Archivos
10. *A*quí va toda la estructura de la parte visual es decir todo lo que el usuario si va a poder ver.

## Clase 8: Index y su estructura básica: body

> body es la parte visible de nuestro website :). Es muy importante usar HTML semántico y no llenar todo de <div> para que nuestro sitio sea mejor interpretado por el navegador y por lo tanto más accesible.

```
  <body>

    <header> <!--Sección superior de nuestro website--> 

      <nav></nav> <!--Sección de navegación de nuestro website, siempre dentro del header-->

    </header>

    <main> <!--Main es el contenido central de nuestro website, "la parte del medio"-->

      <section> 
        <!--Nuestro website puede estar divido por secciones, por ejemplo platzi tiene 3: El navegador de cursos y rutas, el feed y nuestras rutas de aprendizaje-->

        <article>
          <!--Contenido independiente de la página. Es reutilizable-->
        </article>

      </section>

      <ul> <!--Lista desordenada: Sin numerar-->

        <li><!--Item List. Elementos de la lista--></li>

      </ul>

      <ol></ol> <!--Lista ordenada: Numerada-->
      
    </main>

    <footer> <!--Sección final de nuestro website-->

    </footer>

    <p>Soy un texto</p> <!--Párrafo, texto-->

    <h1>Soy un titulo</h1> 
    <!--Títulos, muestran el texto más grande y con negrilla. Existen desde el h1 al h6-->

    <a href="#">Soy un link</a>
    <!--Enlaces/links que nos permitirán movernos entre páginas.-->

  </body>
```

## Clase 9: Reto: crea tu lista de compras del supermercado

```

Crear una receta con los diferentes enlaces al paso 

```
## Clase 10: Anatomía de una etiqueta de HTML

> Una etiqueta puede tener tantos atributos como desees, y cada atributo tiene su propia función, recomiendo mucho la documentación de Mozilla Developer porque están muy bien explicadas cada etiqueta HTML, y te dice desde qué atributos puede llevar hasta qué hijos puede tener



