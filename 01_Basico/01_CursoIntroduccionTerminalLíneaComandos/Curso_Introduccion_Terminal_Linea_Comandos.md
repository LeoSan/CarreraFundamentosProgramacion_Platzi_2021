## ¿Qué es la terminal?

La terminal es una herramienta indispensable que cualquier persona en la tecnología debe conocer 👀. Es importante porque:
Te da flexibilidad 📏. Con unos pocos comandos, puedes hacer mucho.
Es mucho más veloz que una interfaz 💻.
Es tu única opción si no hay interfaz 😆, como para configurar un servidor remoto.
Puedes invocar demonios 👿. Hay que tener cuidado con los comandos.
Específicamente, la terminal es una interfaz gráfica muy sencilla que simula una línea de comandos:
Terminal: Ventana que muestra el promt.
Shell (línea de comandos): Programa que ejecuta los comandos. Hay varios tipos de shell, pero sirven para lo mismo. La más comunes son bash shell o Z shell. En este curso, usaremos la primera 🍎.
Es importante comenzar a usar Linux 😟.
Un comando es un programa que se puede ejecutar desde la terminal.


## ¿Qué es una distribución?

Un Sistema Operativo (SO, por siglas) son un software que nos permite operar un entorno digital el cual esta presente en diferentes dispositivos donde, más comúnmente, en un computador.

En contexto, un Sistema Operativo se es posible adquirir mediante una distribución o corriente, las cuales están categorizadas en UNIX o Linux.

La principal diferencia entre UNIX y Linux es mismo acceso a ellos, ya que UNIX es caro y Linux, como solución, es Open Source.


https://www.hostinger.com/tutorials/linux-commands
https://platzi.com/clases/terminal/

Un comando puede ser 4 cosas:

Un programa ejecutable: que se compilo en algun lenguaje de programación y se puede ejecutar

Un comando de utilidad de la shell.

Una función de shell

Un alias

Comandos

type nos permite saber que clase es un comando. Por ejemplo type cd (es una funcion de shell), ls (es un alias)

Para crear un alias: alias ‘nombreDelAlias’ = ‘comandoQueInvoca’. Por ejemploalias l=”ls -lh”. Temporales, por el momento.

Con –help o help, puedes tener una ayuda sobre los comandos.

man ‘comando’ : hace referencia al manual de usuario de un comando, otro similar es informático

whatis ‘comando’ : nos da una descripcion muy corta de que hace ese comando. Pero no funciona con todos.


***********************Comando Aprendidos ******************************************
-cd: 
-pwd: print working directory 
- ls, ls -lh, ls -la, ls -l, ls -lr: Permite listar los archivos de muchas maneras 
- ls *.txt : Busca todos los archivo por su extension 
- ls coincidencia* : Busca por nombre sin importar la extension 
- ls coinci?: busca con coincidencias 
- tree -l2: muestra el arbol 
- mkdir nombre: Genera directorios 
- touch nombre: Genera un archivo 
- cp file(Original) filebk(copia): Comando para copiar 
- mv filebk (Origen)  ../home/document/ (Destino) : Comando mueve archivo 
- rm -i filebk: Elimina y pregunta si se puede eliminar 
- head : Comando que muetra las primeras 10 lineas de un archivo 
- head -n 15: Comando que muetra las primeras 15 lineas de un archivo 
- tail -n 15: Comando que muetra las los 10 ultimos lineas de un archivo 
- less nombreArchivo: Muestra lo que tiene un archivo txt en consola 
- open NombreApp: Abre archivo o programas en MAC
- xdg-open NombreApp: Abre archivo o programas en Linux
- Nautilus NombrePrograma: abre interfaz dorectorio
- top: abre en consolas los procesos ejecutados en el computador
- history: Lista los comando ejecutados 
- !NumeroHistorial -> Te permite ejeutar el numero de comando del historial
- comando --help -> explica el comando. 


## Las wildcards 
Wildcard
💡Alternativamente llamado como wild character o wildcard character.
.
## Definición

Son un símbolo usado para remplazar o representar uno más caracteres donde comúnmente se utiliza el * .
nos sirven para realizar seccionamiento de archivos o directorios, ademas de ls los wildcards tambien pueden usarse con cualquier comando que realize la manipulacion de archivos como mv, cp y rm. En este ejemplo yo movi todos los archivo .py hacia una carpeta

como genear alias : 
alias c="clear"
alias s="cd .."
alias sgit='f(){ git add "$1"; git commit -m "$2"; git push; unset -f f; }; f'
alias gs="git status"
alias ch="chmod +100"
alias g="gcc -Wall -Wextra -Werror -pedantic"
alias p="pep8 *.py"
alias server1="ssh ubuntu@xx.xx.xxx.xx '$1'"
alias server2="ssh ubuntu@xx.xxx.xxx.xx '$1'"
alias LB="ssh ubuntu@xx.xx.xxx.xxx '$1'"
alias dock="sudo docker"


## Streams y redirecciones IO
https://linuxjourney.com/lesson/stdout-standard-out-redirect
💡 Los streams son flujos de información relacionadas con algún instrucción realizada, en proceso o terminada.
.
Definición

*Cuando se interactúa con la bash, hay tres flujos importantes:

stdin o standard input stream, el cual provee comandos de entrada, descritos con 0.
stdout o standard output stream, el cual muestra comandos de salida, descritos con 1.
stderr o standard error stream, el cual provee salidas de errores de los comandos, descritos con 2.*
.
Redirecciones de salida
Hay dos formas de redireccionar la salida a un archivo
n> Redirecciona la salida para con un archivo.
n>> Redirecciona la salida para con un archivo, concatenando contenido.
.
Considere que se deberá tener permisos de escritura en el destino del archivo.
.
Algunas veces, pudiera necesitar el redirigir el stdout y el stderr para con un archivo. Esto es a menudo hecho para automatizar procesos o trabajos en background, generando un log o registro. Por ello, usamos &> &>> donde indicamos el orden u el tipo de salida.

Cabe mencionar que el orden es importante, por ejemplo:

# 1
command 2> &1>output.txt
# 2
command >output.txt 2>&1

aws s3 ls s3://$BUCKET --recursive | awk '{print $4}' | awk -F/ '{print $NF}'





************************* VARIABLES DE ENTORNO **********************************

- LISTAR VARIABLES
	- printenv 

- ver variables de entorno 
	- echo $HOME
	- echo $PATH 

Como  modificar variables de entorno 
.bashrc ó en mac -> .zshrc 

Solo debemos editarlo con algun editor de texto y para generar variables solo es en mayuculas Ejemplo HOLA ="Hola Mundo", echo $HOLA => Hola Mundo 

Como Editar variable PATH 
Capitulo 12 
Podemos anexarla editando el .bashrc.Ejemplo-> creamos una varibale entorno llamada PATH = $PATH:/home/c guardamos luego cargamos el bashrc 
Podemos ejecutar el comando $bash para cargarlo 


*********************************COMANDO DE BUSQUEDAS **************************

-which cd -> Busca programas y nos muestra la ruta tambien de forma binaria 
-find ./home (dorectorio ) -name[filtrado] file(Nombre archivo)
-find ./home (dorectorio ) -name *.txt | less
-find ./home (dorectorio ) -type [file o direcotio]fd [filtrado] file(Nombre archivo)
-find ./home (dorectorio ) -type f *.log | less 
-find  ./home (dorectorio ) -size 20M  

-grep Tower[palabra a buscar] movies.csv[Nombre archivo donde se buscara] : Usando el comando grep busca textos en un archivo 
-grep -i The[palabra a buscar] movies.csv[Nombre archivo donde se buscara] | less: Busca y los muestra de mejor manera -i ignora si es mayusculas  o minisculas
-grep -c the movies.csv: Cuenta el total de palabras
-gtep -vi tower movies.csv > sintower.txt: Busca lo inverso es decir todas las conincidencias donde no tenga tower  


********************************* UTILIDADES DE COMANDOS **************************

-ifconfig              -> nos indica nuestra ip y mascara
-ping                  -> nos indica si una pagina esta activa 
-curl (www.google.com) -> Me muestra el string de una pagina  
-wget (www.google.com) -> Me muestra el string y descarga y genera un archivo 
-tarceroute            -> nos indica todos los servidores que estan conectadas para acceder a la web 
-netstat -i            -> nos muestra los dispositivos de red 

-tar -cvzf [ c=comrpimir archivo, v=ouput terminal, z=algoritm gitsip  f=compirmir file] nombreArchivo.tar.gz  /directorio -> Nos comprime los archivos dentro de un directorio -> comprimir 
-tar -xzvf [ x=descom comrpimir archivo, v=ouput terminal, z=algoritm gitsip  f=compirmir file] nombreArchivo.tar.gz  -> Descomprimir 
-zip -r nnombrePack .zip /directorio -> comprimir en zip 
-unzip NombreArchivo.zip


********************************* BÁSICO MANEJO DE PROCESO  **************************
-ps -> nos muestra los procesos o comando que estan corriendo en la consola 
-kill NumeroPID-> mata el proceso 
-top->

********************************* PERSONALIZAR LA TERMINAL tilis para linux  **************************

https://www.edevars.com/blog/personalizar-terminal

chsh -s $(which zsh)  -> comando permite cambiar shell

**********************Libros ********************

https://nostarch.com/linuxbasicsforhackers
https://nostarch.com/tlcl2
https://www.oreilly.com/library/view/grep-pocket-reference/9780596157005/
https://www.oreilly.com/library/view/learning-the-vi/9780596529833/
https://www.oreilly.com/library/view/linux-pocket-guide/9781491927557/
https://www.oreilly.com/library/view/regular-expression-pocket/9780596514273/
https://www.vim.org/docs.php
  



 

 

 