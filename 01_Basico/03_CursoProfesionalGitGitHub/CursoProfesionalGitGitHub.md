# CursoProfesionalGitGitHub.md

 ## Caso Para agregarme remote 
 
 - Paso 1: podemos iniciar nuestro git , git ini-> crear nuestras ramas y todo lo demas 
 - Paso 2: Usamos este comando para anexarnos a un git remoto-> git remote add origin "http"
 - Paso 3: git pull origin master (main) -> Si te da conflicto es porque el detecta que tiene diferentes historias (fatal_refusing to merge unreletes histories)
 - Paso 4: Opcional: si nos ocurre el error anterior debemos fusionar nuestras historias con este comando ->git pull origin master(main) --allow-unrelated-histories -> nos hace un merge
 - Paso 5: git push origin master (main) 
 
 
 ## ---- Comandos Basicos para Git  ---- 
- git init   -> Permite generar un repositorio e iniciar tu versiones 
- git add    ->  Agrega tus cambios a la rama 
- git sttaus -> valida el estatus 
- git rm nombreArchivo --cached  -> " git rm .env --cached " ->  elimina y lo pone en memoria RAM, luego hay que ejecutar git add nombreArchivo ó --all ó git add . 
- git commit -m"Autor: Leonard, Descripcion: Aqui lo que pasa con ese archivo" -> realiza el commit 
- git commit -am "Autor: Leonard, Descripcion: Aqui lo que pasa con ese archivo" -> realiza el add y el commit pero para archivo agregados previamente. 
- git branch --list : Lista las ramas 
- git branch -v: Lista las ramas y los commit y el numero del log 
- git branch -M main -> Mueve cambios masivos de ramas, -M nos ayudará a mover todo el historial que tengamos (en caso de que los haya) en master a la nueva rama que estamos creando que se llama main
- git remote set-url origin url_del_repositorio
 
 
##   ****************-Configurar GIT -****************************
- git config        -> Muestra una lista de los comando para laconfiguracion
- git config --list -> Muestra el listado de la configuración por defecto  
- git config --list --show-origin -> Muestra un listado mas especifico 
- git config --global user.name  "LeoSan" -> Permite cambiar el name de la cuenta  
- git config --global user.email "email"  -> Permite cambiar el email
- git log nombreArchivo  -> Indica la historia del archivo y sus commit
- git log --stat         -> Visualiza el ultimo cambio y lista los commit 
- git log --oneline  -> Te muestra el id commit y el título del commit.
- git log --decorate -> Te muestra donde se encuentra el head point en el log.
- git log --graph -- -> Lista las ramas 
- git log --graph --decorate --online -> Lista las ramas de forma de raiz y mas corta 
- git config --global alias.superlog "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
- alias arbol ="git log --graph --decorate --online" = Usamos alias en linux y esto se ejecuta con arbol
 

- git show nombreArchivo -> Indica de manera detallada los cambios del archivo o los ultimos cambios si no consultas por archivo 
- git diff CodigoVersionMasResiente CodigoVersionMasVieja -> Nos muestra la diferencia entre versiones de commit este  Codigo se saca usando git log nombre Archivo  
- git log Archivo.txt // mostrara los ID de los commits realizados al archivo

- git checkout (idcommit) // nos regresara  los cambios commit deseado
- git reset (idcommit) -- soft /*Mantiene los cambios en staging para que 			podamos aplicar los cambios en un commit anterior.*/
- git reset (idcommit) --hard /*Borra toda la anterior incluyendo la que esta en staging*/


## ************************************* RESET ************************************** 
Hay dos tipos de reset duros y suaves 
- $git reset CodigoVersionObtieneconLOG --hard -> Resetea y borra todo loque hicimos antes 
- $git reset --soft: Elimina las versiones posteriores a la que queremos volver, sin embargo, los archivos staging siguen intactos.
- $git reset --hard: Elimina las versiones posteriores a la que queremos volver, incluyendo los archivos staging.
- $git reset HEAD: Hace que los archivos staging se vuelvan unstaged.
- $git checkout: Al contrario de los $git reset, este es solo darle un vistazo a como era el archivo, ya que no elimina los comits, hay dos formas de usarlo:
1)$git checkout ID DEL COMMIT NOMBRE DEL ARCHIVO: vuelves a la versión anterior, puedes hacer que esa versión sea la última usando $git add.
2)$git checkout master: Hace que volvamos a la versión del último commit.

## ************************************* Ramas Branch ************************************** 

- git branch --all -> Muestra detalle de las ramas 
- gitk -> Muestra la interfaz para ver el historial 
- git branch -v : Lista las ramas 
- git log --graph --abbrev-commit --decorate : Este para que se vean las lineas 
- git config --global alias.slog "git log --graph --abbrev-commit --decorate" :: Este para que se vean las lineas 

### Conceptos: 

> Directorio: Es la carpeta del proyecto que está en tu disco duro
Staging: Es donde se guardan las modificaciones del archivo antes de enviar la versión final al repositorio (staging es como tener la milanesa empanizada pero no freída).
Repositorio: Es la carpeta donde se guardan las versiones finales de los archivos, todos los que trabajen en el mismo proyecto tienen acceso a esta carpeta y pueden ver qué se ha modificado de un archivo y quién lo realizó.

### Estados de un archivo

- Untracked: Son todos aquellos archivos que están en el disco duro que no conoce Git. cuando no se ejecutó $git add.
- Staged: Son los archivos que se encuentran en Staging.
- Tracked: Son archivos que están en el repositorio o en staging. cuando se ejecutó $git add.
- Unstaged: Son archivos tracked que han sido modificados, pero no han sido guardados los cambios en staging.
    
	
## ******************************Generar una nueva llave SSH: (Cualquier sistema operativo)**************************************

- git config --list --show-origin -> hay que validar si el correo es el correcto para generar tu llave asociada al correo 
- git config --global user.email "email"  -> Permite cambiar el email
- ssh-keygen -t rsa -b 4096 -C "youremail@example.com"

Comprobar proceso y agregarlo (Windows)

eval $(ssh-agent - s)

ssh-add ~/.ssh/id_rsa -> debemos agregar nuestra llave privada recordando el lugar donde guardaste la llavae 

Pasamos al github setting/crear nuestra llave y pegamos nuestra llave pulica 
Pasamos al repositorio que estamos trabajando y al lado del boton clone buscamos ssh 
Pasamos a consola y cambiamos nuestra URL siguiente comando: 
git remote set-url origin pegamosNewUrldelRepo 
git remote -v : Lista las url asociadas 


## ****************************** COMO CREAR TAG **************************************
- git tag -a v0.1 -m "Autor:Leonard, Descripcion: Version 0" 972bf91   --- : Crear un tag y el has lo encuentras usando git log --graph 
- git tag -d nombreTag   -> Elimina un tag 
- git tag                -> Lista los tag 
- git tag -l             -> Lista los tag 
- git show v0.1          -> Lista los tag 
- git show-ref --tags    -> Muestra el listado de los tag ya con su has de referencia  
- git push origin --tags -> Con este comando subimos los tags al repositorio  
- git push origin :refs/tags/nombreTags 
- git config --global alias.superlog "log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"


### Pull request:
Es una funcionalidad de github (en gitlab llamada merge request y en bitbucket push request), en 
la que un colaborador pide que revisen sus cambios antes de hacer merge a una rama, normalmente master.

Al hacer un pull request se genera una conversación que pueden seguir los demás usuarios del repositorio, 
así como autorizar y rechazar los cambios.

## El flujo del pull request es el siguiente

- Se trabaja en una rama paralela los cambios que se desean (git checkout -b <rama>)
- Se hace un commit a la rama (git commit -am '<Comentario>')
- Se suben al remoto los cambios (git push origin <rama>)
- En GitHub se hace el pull request comparando la rama master con la rama del fix.
- Uno, o varios colaboradores revisan que el código sea correcto y dan feedback (en el chat del pull request)
- El colaborador hace los cambios que desea en la rama y lo vuelve a subir al remoto (automáticamente jala la historia de los cambios que se hagan en la rama, en remoto)
- Se aceptan los cambios en GitHub
- Se hace merge a master desde GitHub
- Importante: Cuando se modifica una rama, también se modifica el pull request.


## *****************************Forks o Bifurcaciones*********************************
Es una característica única de GitHub en la que se crea una copia exacta del estado actual de un repositorio directamente en GitHub, éste repositorio podrá servir como otro origen y se podrá clonar (como cualquier otro repositorio), en pocas palabras, lo podremos utilizar como un git cualquiera

- git remote add <nombre_del_remoto> <url_del_remoto> 
- git remote upstream https://github.com/freddier/hyperblog
- git pull <remoto> <rama>
- git pull upstream master
- git pull upstream master
- git push origin master

## Para hacer una contribución a un proyecto de Github hay que seguir los siguientes pasos:

1.- Darle al botón de Fork en Github
2.- Hacer los cambios y darle push a ellos en mi repositorio
3.- Hacer un pull request con mis cambios en alguna de las ramas del proyecto original y esperar
4.- Una vez aprueben o rechacen mis cambios seré notificado en la cuenta de github
Pero también pasa algo muy interesante y es que cuando yo he hecho un fork, el proyecto original sigue avanzando y el mio se va quedando atras, así que para traer los cambios del proyecto original eso se hace de la siguiente manera:

1.-Crear una nueva fuente para hacer pull desde el repositorio forkeado. Por ejemplo:
2.- git remote add upstream git@github.com:freddier/hyperblog.git
Nota: la palabra upstream es opcional pero es lo que normalmente se usa en la industria.
Verificamos que hay una nueva fuente de datos con
3.- git remote -v
4.- Hacer pull de upstream/master
5.- git pull upstream master
 Hacer un commit para fusionar los cambios que hemos traído
6.- git commit -am “Fusion”
Hacer un push para mandar los cambios a nuestro repositorio original
7.- git push origin master


## *****************************Rebase*********************************
Rebase sirve también para cambiar la historia de nuestros commits en la misma rama, 
si tienen muchos commits con cambios pequeños estos se pueden unificar para hacer que su log se vea mas limpio.

Debo practicar este metodo 

Paso 1: Si estamos en la rama del cambio o la que queremos fusionar con master 
No pasamos a dicha rama 
git checkout experimento 
git rebase master 

Paso 2: pasamos los cambios totales a master 

git checkout master 
git rebase experimento 

Paso 3: Borra la rama 

git checkout -D experimento 


## *****************************stash *********************************
El stashed nos sirve para guardar cambios para después, Es una lista de estados que nos guarda algunos cambios que hicimos en Staging para poder cambiar de rama sin perder el trabajo que todavía no guardamos en un commit

Ésto es especialmente útil porque hay veces que no se permite cambiar de rama, ésto porque porque tenemos cambios sin guardar, no siempre es un cambio lo suficientemente bueno como para hacer un commit, pero no queremos perder ese código en el que estuvimos trabajando.

El stashed nos permite cambiar de ramas, hacer cambios, trabajar en otras cosas y, más adelante, retomar el trabajo con los archivos que teníamos en Staging pero que podemos recuperar ya que los guardamos en el Stash.

- git stash
El comando git stash guarda el trabajo actual del Staging en una lista diseñada para ser temporal llamada Stash, para que pueda ser recuperado en el futuro.

Para agregar los cambios al stash se utiliza el comando:

- git stash
Podemos poner un mensaje en el stash, para asi diferenciarlos en git stash list por si tenemos varios elementos en el stash. Ésto con:

- git stash save "mensaje identificador del elemento del stashed"
Obtener elelmentos del stash
El stashed se comporta como una Stack de datos comportándose de manera tipo LIFO (del inglés Last In, First Out, «último en entrar, primero en salir»), así podemos acceder al método pop.

El método pop recuperará y sacará de la lista el último estado del stashed y lo insertará en el staging area, por lo que es importante saber en qué branch te encuentras para poder recuperarlo, ya que el stash será agnóstico a la rama o estado en el que te encuentres, siempre recuperará los cambios que hiciste en el lugar que lo llamas.

Para recuperar los últimos cambios desde el stash a tu staging area utiliza el comando:

git stash pop
Para aplicar los cambios de un stash específico y eliminarlo del stash:

git stash pop stash@{<num_stash>}
Para retomar los cambios de una posición específica del Stash puedes utilizar el comando:

git stash apply stash@{<num_stash>}
Donde el <num_stash> lo obtienes desden el git stash list

Listado de elementos en el stash
Para ver la lista de cambios guardados en Stash y así poder recuperarlos o hacer algo con ellos podemos utilizar el comando:

git stash list
Retomar los cambios de una posición específica del Stash || Aplica los cambios de un stash específico

Crear una rama con el stash
Para crear una rama y aplicar el stash mas reciente podemos utilizar el comando

git stash branch <nombre_de_la_rama>
Si deseas crear una rama y aplicar un stash específico (obtenido desde git stash list) puedes utilizar el comando:

git stash branch nombre_de_rama stash@{<num_stash>}
Al utilizar estos comandos crearás una rama con el nombre <nombre_de_la_rama>, te pasarás a ella y tendrás el stash especificado en tu staging area.

Eliminar elementos del stash
Para eliminar los cambios más recientes dentro del stash (el elemento 0), podemos utilizar el comando:

git stash drop
Pero si en cambio conoces el índice del stash que quieres borrar (mediante git stash list) puedes utilizar el comando:

git stash drop stash@{<num_stash>}
Donde el <num_stash> es el índice del cambio guardado.

Si en cambio deseas eliminar todos los elementos del stash, puedes utilizar:

git stash clear
Consideraciones:

El cambio más reciente (al crear un stash) SIEMPRE recibe el valor 0 y los que estaban antes aumentan su valor.
Al crear un stash tomará los archivos que han sido modificados y eliminados. Para que tome un archivo creado es necesario agregarlo al Staging Area con git add [nombre_archivo] con la intención de que git tenga un seguimiento de ese archivo, o también utilizando el comando git stash -u (que guardará en el stash los archivos que no estén en el staging).
Al aplicar un stash este no se elimina, es buena práctica eliminarlo.

git stash
git stash list
git stash pop
git stash branch english-version
git stash drop


## *****************************Cherry Pick *********************************

Cherry Pick
Este comando permite coger uno o varios commits de otra rama sin tener que hacer un merge completo. Así, gracias a cherry-pick, podríamos aplicar los commits relacionados con nuestra funcionalidad de Facebook en nuestra rama master sin necesidad de hacer un merge.

Para demostrar cómo utilizar git cherry-pick, supongamos que tenemos un repositorio con el siguiente estado de rama:

a - b - c - d   Master
         \
           e - f - g Feature
El uso de git cherry-pick es sencillo y se puede ejecutar de la siguiente manera:

git checkout master
En este ejemplo, commitSha es una referencia de confirmación. Puedes encontrar una referencia de confirmación utilizando el comando git log. En este caso, imaginemos que queremos utilizar la confirmación ‘f’ en la rama master. Para ello, primero debemos asegurarnos de que estamos trabajando con esa rama master.

git cherry-pick f
Una vez ejecutado, el historial de Git se verá así:

a - b - c - d - f   Master
         \
           e - f - g Feature
La confirmación f se ha sido introducido con éxito en la rama de funcionalidad
# Ahora me piden traer el primer commit de readme-mejorado
# copio el codigo del commit que quiero traer
$ git log --oneline

# cambio a master y hago el cherry-pick
$ git checkout master
$ git cherry-pick [codigo del commit]

Freddy: usar git rebase y git cherry-pick son malas prácticas

El pibe en las oficinas de git que los programó:

## *****************************Remendar un commit *********************************

Remendar un commit
Puede modificar el commit más reciente (enmendar) en la misma rama ejecutando:

git add -A # Para hacer uso de ammend los archivos deben de estar en staging
git commit --amend # Remendar último commit
Este comando sirve para agregar archivos nuevos o actualizar el commit anterior y no generar commits innecesarios.

## ***************************** git reflog *********************************

Git nunca olvida, git reflog
Git guarda todos los cambios aunque decidas borrarlos, al borrar un cambio lo que estás haciendo sólo es actualizar la punta del branch, para gestionar éstas puntas existe un mecanismo llamado registros de referencia o reflogs.
.
La gestión de estos cambios es mediante los hash’es de referencia (o ref) que son apuntadores a los commits.
.
Los recoges registran cuándo se actualizaron las referencias de Git en el repositorio local (sólo en el local), por lo que si deseas ver cómo has modificado la historia puedes utilizar el comando:

git reflog
Muchos comandos de Git aceptan un parámetro para especificar una referencia o “ref”, que es un puntero a una confirmación sobre todo los comandos:

git checkout Puedes moverte sin realizar ningún cambio al commit exacto de la ref

git checkout eff544f
git reset: Hará que el último commit sea el pasado por la ref, usar este comando sólo si sabes exactamente qué estás haciendo

git reset --hard eff544f # Perderá todo lo que se encuentra en staging y en el Working directory y se moverá el head al commit eff544f
git reset --soft eff544f # Te recuperará todos los cambios que tengas diferentes al commit eff544f, los agregará al staging area y moverá el head al commit eff544f
git merge: Puedes hacer merge de un commit en específico, funciona igual que con una branch, pero te hace el merge del estado específico del commit mandado

git checkout master
git merge eff544f # Fusionará en un nuevo commit la historia de master con el momento específico en el que vive eff544f

## ***************************** Buscar Palabras *********************************

buscar palabras en los archivos en el branch actual

git grep "palabra a buscar"
mostrar la linea en la cual la pablara aparece en el archivo

git grep -n "palabra a buscar"
mostrar cuantas veces aparce la palabra en cada archivo

git grep -c "palabra a buscar"
buscar los commits en los cuales sale una palabra

git log -S "palabra a buscar"

## ***************************** shortlog o Blame *********************************
- git shortlog: Ver cuantos commits a hecho los miembros del equipo
- git shortlog -sn: Las personas que han hecho ciertos commits
- git shortlog -sn --all: Todos los commits (también los borrados)
- git shortlog -sn --all --no-merges: muestra las estadisticas de los comigs del repositorio donde estoy
- git config --global alias.stats “shortlog -sn --all --no-merges”: configura el comando “shortlog -sn --all --no-merges” en un Alias en las configuraciones globales de git del pc
- git blame -c blogpost.html: Muestra quien ha hecho cambios en dicho archivo identado
- git blame --help: Muestra en el navegador el uso del comando
- git blame archivo -L 35, 60 -c: Muestra quien escribio el codigo con informacion de la linea 35 a la 60, EJ: git blame css/estilos.css -L 35, 60 -c
- git branch -r: Muestra las Ramas remotas de GitHub
- git branch -a: Muestra todas las Ramas del repo y remotas de GitHub


## ********************************* Enlaces ****************************** 

 - https://ubicatucasilla.ine.mx/
 - https://platzi.com/clases/1220-marca-personal/9915-por-que-es-importante-tener-una-marca-personal/
 - https://learngitbranching.js.org/
 