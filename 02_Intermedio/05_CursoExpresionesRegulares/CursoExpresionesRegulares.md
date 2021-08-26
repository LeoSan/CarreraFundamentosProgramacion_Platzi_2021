 ## 📖  Curso de Expresiones Regulares  📖  ## 
 
Son patrones en los que definimos que cadenas de caracteres entran o no entran en el patrón diseñado.
Además de ser útiles para quedarnos con parte de la información que necesitamos y descartamos la que no.

Al usar las expresiones regulares te ahorras la necesidad de traer una librería
 (que seguro tiene REGEX dentro para hacer la validación)
 
 Es simplemente ir creando patrones dónde cadenas de caracteres puedan ir 
 entrando o no, estos patrones nos sirven para atacar una línea o un input.
 
  ## 📜  Detalle de las de Expresiones Regulares  📜  ## 
 
 > Las expresiones regulares pueden llegar a ser muy raras por la forma en la 
 que se ven, pero son muy útiles. Aprender a usarlas nos ayuda en pocas palabras, 
 a buscar. Se diferencia del CTRL+F porque éste busca textos precisos y te arroja 
 el match. Con expresiones regulares es más complejo, por ejemplo se pueden buscar 
 patrones (buscar todas las palabras que estén entre dos espacios, palabras que 
 empiecen con mayúscula, encontrar la primer palabra de cada línea, etc)
 
> Se usa mucho en logs de servidores que son archivos enormes para analizarlos

>Las expresiones regulares son usadas tanto en frontend como en backend

  ## 📜 Introducción al lenguaje de expresiones regulares 📜  ## 

Las expresiones regulares intentan solucionar problemas del día a día. Se intenta buscar la forma en que ciertos datos son presentados, por ejemplo un número de teléfono dependiendo de país y zona, tiene determinada cantidad de números, a veces separados con guiones o puntos, pero la estructura siempre es la misma…
Otro ejemplo de uso de expresiones regulares sería intentar cambiar en un csv los precios de modo europeo a modo americano
Un dígito se puede expresar con /d
Caracter de palabra: /w


## 📙 ¿Qué es un archivo de texto, por ejemplo un CSV? 📙  ## 

¿Qué es una cadena de caracteres?

Es un carácter ASCII generalmente, seguido de otro carácter 
y de otro. No todos son visibles, el espacio por ejemplo. 

Cada carácter es un carácter.

Cada espacio en una cadena de texto se llena con un caracter, 
esto lo necesitamos tener perfectamente claro para comenzar a 
trabajar con expresiones regulares




Las clases predefinidas y construidas

El caracter (.): Encuentrame todo lo que sea un carácter


## 📙  Las clases predefinidas y construidas 📙  ##

- Dígitos: \d

Encuentra todos los dígitos de 0 a 9.
\d es equivalente a poner [0-9].
Si en vez de \d, usamos por ejemplo [0-2] nos encontrará solamente los dígitos de 0 a 2.

Podemos usar “\D” para encontrar justo lo contrario, todo lo que no son dígitos.

- Palabras: \w

Encuentra todo lo que puede ser parte de una palabra, tanto letras (minúsculas o mayúsculas) como números.
\w es equivalente a poner [a-zA-Z0-9_].
Si en vez de \w, usamos por ejemplo [a-zA-Z] nos encontrará solamente las letras.
Podemos usar “\W” para encontrar justo lo contrario, todos los caracteres que no son parte de palabras.

- Espacios: \s

Encuentra todos los espacios (los saltos de línea también son espacios).
Podemos usar “\S” para encontrar justo lo contrario, todo lo que no son espacios.

//Solo permite colores hexadecimales 
#[a-fA-F0-9]{3,6}


Alt+92 = \
Alt+91 = [
Alt+93 = ]
Alt+62 = >
Alt+60 = <
Alt+125 = }
Alt+123 = {

## 📙   Los delimitadores: +, *, ?   📙  ##

- (*) : Cero o más veces
- (?): Cero o una sola vez
- (+): una o más veces.
- Aplican al carácter o sentencia que preceden

## Ejemplos 
- [a-z]? : Esto es que puede estar una sola vez o no estar una letra minuscula de la (a) a la (z).
- \d*: Esto es que puede estar muchas veces o no estar un digito.
- \d+: Esto es que puede estar muchas veces o una sola vez un digito.

## Herramientas Online
- https://regex101.com/ 
- https://jex.im/regulex/#!flags=&re=%5E(a%7Cb)*%3F%24 -> De manera grafica 
- https://www.debuggex.com/

## 📙    Los contadores {1,4}  📙  ##


> Aplicando a un carácter que lo preceda se puede colocar entre llaves de esta 
forma, para indicarle que busque la cantidad deseada de caracteres. {Cota inferiror, Cota superior}

### Ejemplo:

- \d{0,2}: Esto buscara 0, 1, 2 dígitos
- \d{2,2}: Esto buscara 2 dígitos
- \d{2}: Esto buscara 2 dígitos
- \d{2,}: Esto buscara 2 o más dígitos.
- \d{2,4}: Esto buscara 2, 3, 4 dígitos.

- "\d{5}" -> 5 dígitos.
- "\d{2,5}" -> Entre 2 y 5 dígitos.
- "\d{4,}" -> De 4 a infinito dígitos.

> mi expresion regular para buscar numero argentinos:
+54 388 5377055 -> [+]54?(\d{2,4}){2,4}

> mi expresion regular para buscar numero Venezuela:
+52 0239 224-1272 -> [+]52?[ ]?(\d{4})+[ ]?(\d{3})\-(\d{4}) -- Mejorado -> ^[+]52?[-\s]?(\d{4})+[-]?(\d{3})\-(\d{4})$ 

> mi expresion regular para buscar numero México:
+58 55 1234-1234 -> [+]58?(\d{2}){4}\-{4}


[0]?\d{2,4}[\-\. ]?\d{2,4}[\-\. ]?\d{2,4}[\-\. ]?\d{2,4}[\-\. ]?\d{2}
> Traducción: ** Puede o no empezar con cero, {luego lleva un grupo de dígitos que puede variar entre 2 y 4 números, luego puede o no tener “-”, “.” o “ ” } (x4) tiene un grupo de números de 2 dígitos.

> Otra forma de buscar telefonos queremos parejas de dos ó tres digitos, que continue que no sea numeros y letras  -> ^\+?(\d{2,3}\W?){3,4}([pe#]\d{1,3})?$


## 📙   El caso de (?) como delimitador 📙  ##


> *? Coincide con el elemento anterior cero o más veces, pero el menor número de veces que sea posible.
> +? Coincide con el elemento anterior una  o más veces, pero el menor número de veces que sea posible.
> ?? Coincide con el elemento anterior cero o una vez, pero el menor número de veces que sea posible.

## Notas 
> La función de (?) como delimitador conciste justamente en delimitar a la menor cantidad posible de los matches. **

> Solo como comentario…en el vídeo y luego en el examen mencionan el carácter ? Cómo “greedy” … 
	Y en verdad debe ser “lazy” …al principio del vídeo si se explica así, luego cambia de lazy a 
	greedy y en el examen queda como “greedy” pero el comportamiento correcto es “lazy” … Me gustó el curso
	
> el caracter ? es un delimitador cuando esta antecedido por el +, para encontrar la minima ocurrencia posible. 
	Si no tiene el mas, ya no es delimitador sino simbolo de ocurrencia de cero a una vez.	
## Ejemplos 
	
Usos de ?

- Para expresar que pueden o no haber cierto caracter ejemplo: \d[a-zA-z]? 
	(Indica busqueda de un digito y despues puede haber o no una letra)

- Como delimitador, es decir; busca los grupos más pequeños posibles segun 
la condicion dada ejemplo: \d\d+? (Busca subgrupos de dos numeros)	


## 📙   Not (^), su uso y sus peligros 📙  ##

> Este caracter nos permite negar una clase o construir “anticlases”, vamos a llamarlo así, que es: toda la serie de caracteres que no queremos que entren en nuestro resultado de búsqueda.

> Este caracter nos permite negar una clase o construir 
“anticlases”, vamos a llamarlo así, que es: toda la serie 
de caracteres que no queremos que entren en nuestro 
resultado de búsqueda.

## Ejemplo

- Para esto definimos una clase, por ejemplo: [ 0-9 ], y la negamos [ ^0-9 ] 
- Para buscar aquello que no tenga corchetes claro lo escapa  [^\[] 


### Notas

- Siempre hay que ponerlos al principio de la clase. -> [ ^0-9 ]
- Aclarar que el “gorrito” (^) solo funciona como negación cuando está dentro de los corchetes [ ] estando a fuera significa otra cosa jeje en dos vídeos siguiente nos damos cuenta
- Presiona la tecla "Alt" en tu teclado, y no la sueltes. 
- Sin dejar de presionar "Alt", presiona en el teclado numérico el número "94", que es el número de la letra o símbolo "^" en el código ASCII.
- El signo ^ es llamado: Acento circunflejo
- Este solo sirve como negación si se encuentra dentro de un [ ]
- \t — Representa un tabulador.
- \r — Representa el “retorno de carro” o “regreso al inicio” o sea el lugar en que la línea vuelve a iniciar.
- \n — Representa la “nueva línea” el carácter por medio del cual una línea da inicio. Es necesario recordar que en Windows es necesaria una combinación de \r\n para comenzar una nueva línea, mientras que en Unix solamente se usa \n y en Mac_OS clásico se usa solamente \r.
- \a — Representa una “campana” o “beep” que se produce al imprimir este carácter.
- \e — Representa la tecla “Esc” o “Escape”
- \f — Representa un salto de página
- \v — Representa un tabulador vertical
- \x — Se utiliza para representar caracteres ASCII o ANSI si conoce su código. De esta forma, si se busca el símbolo de derechos de autor y la fuente en la que se busca utiliza el conjunto de caracteres Latin-1 es posible encontrarlo utilizando “\xA9”.
- \u — Se utiliza para representar caracteres Unicode si se conoce su código. “\u00A2” representa el símbolo de centavos. No todos los motores de Expresiones Regulares soportan Unicode. El .Net Framework lo hace, pero el EditPad Pro no, por ejemplo.
- \d — Representa un dígito del 0 al 9.
- \w — Representa cualquier carácter alfanumérico.
- \s — Representa un espacio en blanco.
- \D — Representa cualquier carácter que no sea un dígito del 0 al 9.
- \W — Representa cualquier carácter no alfanumérico.
- \S — Representa cualquier carácter que no sea un espacio en blanco.
- \A — Representa el inicio de la cadena. No un carácter sino una posición.
- \Z — Representa el final de la cadena. No un carácter sino una posición.
- \b — Marca la posición de una palabra limitada por espacios en blanco, puntuación o el inicio/final de una cadena. -> “Me gusta aprender en Platzi”  -> /\bPl/ -> Estarías buscando las palabras que empiecen con “Pl” |||||   /tzi\b/ ->  Estarías buscando todas las palabras que terminen en “tzi” ->  https://www.w3schools.com/jsref/jsref_regexp_begin.asp
- \B — Marca la posición entre dos caracteres alfanuméricos o dos no-alfanuméricos..


## 📙   Principio (^) y final de linea ($) 📙  ##

Estos dos caracteres indican en qué posición de la línea debe hacerse la búsqueda:
el ^ se utiliza para indicar el principio de línea
el $ se utiliza para indicar final de línea

## Ejemplo

- Busca inicio palabras con plus cero o una vez y al final solo sea 3 veces ->^\w+,\w+,\w+$
- Busca inicio palabras con plus cero o una vez y al final solo sea 3 veces -> ^(\w+,?){3,3}$
- Hay una manera de no comenzar en el inicio, sino en una posicion x de la linea ^.{n}(tu-regex)$
- Numeros y letras (555658,56-58-11, 56.58.11,56.78-98  )-> ^(\d\d[^a-zA-Z]?){3}$
- Use esta expresión para encontrar las lineas del LOG que tenga IPs -> ^.*(\d{2,3}[.]?){4,4}.*$
- Buscar en un LOG ->  ^\[LOG.* \[ERROR\].*$ 
- Busar usuarios en log -> ^\[LOG.*\] \[LOG\].*user:@\w+?\] .*$
- Buscar Ips -> (\d{1,3}\.){3,3}(\d{1,3})
- Buscar Fechas con mes del nombre -> ^.*(\d{1,2}\/\w+\/\d{4,4}).*$

## 📙  URLs ($) 📙  ##
> Expresión para validar urls muy buena para cuando deseas permitir guardar enlaces en tus post 

## Ejemplos 

- Url Completa -> ```javascript  https?:\/\/[\w\-\.]+\.\w{2,5}\/?\S*   ```
- Otra forma -> ```javascript (https?://)?(www\.)?[A-z0-9_\.]+\.[A-z]{2,3}\/?.* ```
                   
- Url hasta el TLD -> https?:\/\/[\w\-\.]+\.\w{2,5}
- Lista top de los .com https://en.wikipedia.org/wiki/List_of_Internet_top-level_domains 
- 

## 📙  Expresion en Correos  ($) 📙  ##

Patron

```javascript
[\w\._]{5,30}\+?\w{0,10}@[\w\-\.]{3,}\.\w{2,5}
```
Explicación

- [\w\._]{5,30} => que contengan de 5 hasta 30 caracteres alfanuméricos incluyendo _ y el .
- \+? => puede contener un +
- \w{0,10} => que contengan de 0 hasta 10 caracteres alfanuméricos
- @ => que contenga una @
- [\w\-\.]{3,} => que contengan de 3 o mas caracteres alfanuméricos incluyendo _ y el .
- \. => que contenga un .
- \w{2,5} => que contengan de 2 hasta 5