/*-//-/-/-*/Curso de Tailwind Configuración-*/*-/*-/-

## Dependencias

- `npm init -y`
- `npm install tailwindcss autoprefixer postcss-cli`

### Inicializamos las herramientas instaladas:

<!-- Genera archivo configuracion vacio de nombre tailwind.config.js -->

- `npx tailwindcss init`
<!-- Genera archivo configuracion completo -->
- `npx tailwindcss init tailwind.config.full.js --full`

<!-- Plugin recomendado para VSCode: Tailwind CSS IntelliSense -->

### Creamos archivo de configuracion postcss.config.js

<!-- Instrucciones archivo postcss.config.js: -->

- `touch postcss.config.js`
- `module.exports = { plugins: [require('tailwindcss'), require('autoprefixer')], };`

### Creacion archivo html y origen CSS

- `mkdir css`
- `touch css/tailwind.css`

### Configuracion archivo css/tailwind.css

- `@tailwind base; @tailwind components; @tailwind utilities;`
@import 'tailwindcss/base';
@import 'tailwindcss/components';
@import 'tailwindcss/utilities';

### Instalamos un live server  
npm i live-server -g 


### Completamos script en package.json

"start": "live-server public",
"build": "npx tailwindcss-cli@latest build css/tailwind.css -o public/css/styles.css"
"dev": "live-server public postcss css/tailwind.css -o public/css/styles.css --watch",
"watch":" postcss css/tailwind.css -o public/css/styles.css -w"



<!-- Ejecutar para compilar -->
## nos crea el archivo css a partir de Taildwind

npm run build 
npm run dev


### Inicializamos script para crear el css

Nos abre en automático en el navegador. 



Mis apuntes de esta clase:

<h1>1.3 Directivas de Tailwind</h1>
Directiva es una instrucción que utiliza tailwind para insertar código en el archivo final de css que genera.
//Otra manera de importarlos 
@import 'tailwindcss/base';
@import 'tailwindcss/components';
@import 'tailwindcss/utilities';


@tailwind base
Esto inyecta los estilos base de Tailwind y cualquier estilo base registrado por plugins.

@tailwind components
Esto inyecta las clases de componentes de Tailwind y cualquier clase de componente registrado por los plugins.

@tailwind utilities
Esto inyecta las clases de utilidad de Tailwind y cualquier clase de utilidad registrada por los plugins.

@tailwind screens
Esta directiva sirve para controlar donde Tailwind inyecta las variaciones responsivas de cada utilidad. Si se omite, Tailwind añadirá estas clases al final de tu css, por defecto.




-*/-*/-/-/-/-/2.1 Personalización y configuración*-/-*/-*/-*/-/-*/
https://tailwindcss.com/docs/configuration/#app

tailwind.config.js
En este archivo podemos personalizar parámetros de estilos de nuestro proyecto como ser fontFamily, 
agregar más colores de los que tailwind trae por defecto.

En theme, podemos configurar por ejemplo el tipo de letra.
En extend podemos añadir cosas extras a tailwind, como colores.


-*/-*/-//-*/Responsive Web Design-/-*/*-/-*//*/
La web como la conocemos, hoy en día, no es una tecnología pensando en un UX o User Experience generando, 
desafortunadamente, que muchos de los sitio web no estén optimizados para los dispotivos móviles.

Definido por Ethan Marcotte, es una filosofía que responde a las necediades de los usuarios 
y a los dispositivos que estamos usando.

Mobile First
Como su nombre sugiere, significa que iniciaremos con el diseño de móviles y expandiendo 
éstas características para crear una verión en tableta o escritorio/web tradicional.

Cabe mencionar que esta filosofía no es sinónimo de limitación, 
por lo que tenemos que tener el mismo contenido tanto en escritorio como en móvil. 
Google describe las best practices en su sitio.

Utility first
CSS posee diferentes tipos de paradigmas para abstraer un diseño, como BEM descrito por Tailwind en ésta sección:

Sin embargo, llega a ser muy complicado establecer un armonía entre desarrolladores-diseñadores si no hay una concesión de sintaxis o linter. 
Por ello, Tailwind establece su propio orden con el objetivo:

- No invertir tiempo en inventar nombres para las clases
- Detener el crecimiento, sin fin, de CSS
- Simplificando y asegurando los cambios al CSS
- Herramienta para desarrollo 🚀
- Como desarrolladores necesitamos herramientas que nos permita exlotar nuestra creatividad 
al máximo por ellos exiten algunas DevTools:

Safari for Developers
https://chrome.google.com/webstore/detail/responsive-viewer/inmopeiepgfljkpkidclfgbgbmfcennb/related?hl=en
Chrome o Chrome for Developers
Y otras más … 🤯


Breakpoint -> Tamaño 
Default : Mayor a 0px 
sm : Mayor a 640px -> Mobil 
md : Mayor a 768px  -> Tablet 
lg : Mayor a 1024px -> Laptop  
xl : Mayor a 1280px -> Table grandes o computadora de escritorio 

-/-*/-*/-/Espacioado table comparativa de cuanto vale un rem -*/-*/-*/-/-/-
	  '0': '0',		= 0px
      '1': '0.25rem',	= 4px
      '2': '0.5rem',	= 0.8px
      '3': '0.75rem',	= 12px
      '4': '1rem',	= 	16px
      '5': '1.25rem',	= 20px
      '6': '1.5rem',	= 24px
      '8': '2rem',	= 	32px
      '10': '2.5rem',	= 40px
      '12': '3rem',	= 48px
      '16': '4rem',	= 64px
      '20': '5rem',	= 80px
      '24': '6rem',	= 96px
      '32': '8rem',	= 336px
      '40': '10rem',	= 640px
      '48': '12rem',	= 768px
      '56': '14rem',	= 896px
      '64': '16rem',	= 1024px
	  
	  
*/-/-*/-*/Ancho y Alto -*/-/-/
Tailwind maneja todo en fracciones 



<h1>3.3 Cambiando las propiedades de la tipografía</h1>
Se puede cambiar:

Tipo de letra.
Tamaño.
Cursiva y negrita.
Se aplican clases como:
text-3xl font-sans font-light

Se puede consultar la documentación en:
https://tailwindcss.com/docs/font-family/#app
https://tailwindcss.com/docs/font-weight/#app
https://tailwindcss.com/docs/font-size/#app

<h3>Margen entre letras
tracking-tight /Letras juntas
tracking-tighter /Letras muy juntas
tracking-wide /Letras separadas
tracking-widest /Letras muy separadas</h3>
<h3>Margen entre lineas
leading-tight /Lineas juntas
leading-snug /Lineas juntas (un poco mas separadas que leading-tight)
leading-relaxed /Lineas separadas
leading-loose /Lineas separadas (un poco mas que leading-relaxed)</h3>
<h3>Alineacion
text-left /Alineado a la Izquierda
text-right /Alineado a la Derecha
text-center /Alineación al centro
text-justify /Texto justificado</h3>
line-through /Tachar texto
underline /Subrayar texto
no-underline /Sin subrayar (quita el subrayado)
uppercase /Letras en mayusculas
capitalized /Primera letra de cada palabra en mayuscula
lowercase /Letras en minuscula


-*/-/-*/-*/-/Display-*/-*/-/-/-/-/-
Las propiedades de display son útiles para poder controlar las dimensiones o espacios. Las propiedades básicas de display son:

Block → Con esta configuración los bloques abarcan toda la pantalla.

<div class="text-center">
		<div class="block bg-blue-800">1</div>
    <div class="block bg-blue-500">2</div>
    <div class="block bg-blue-300">3</div>
</div>
Inline-block → Sólo ocupan el espacio necesario para mostrar lo que hay en su interior.

<div class="text-center">
		<div class="inline-block bg-blue-800">1</div>
    <div class="inline-block bg-blue-500">2</div>
    <div class="inline-block bg-blue-300">3</div>
</div>
Inline → Sólo ocupan el espacio necesario para mostrar lo que hay en su interior y la altura del elemento es indiferente.

<div class="text-center">
		<div class="inline bg-blue-800">1</div>
    <div class="inline bg-blue-500">2</div>
    <div class="inline bg-blue-300">3</div>
</div>
https://s3-us-west-2.amazonaws.com/secure.notion-static.com/713a0c5e-19ea-4908-923c-ef06931d475e/inline.png
Hidden → El elemento en cuestión no se muestra.

<div>
    <div class="inline-block bg-blue-800">1</div>
    <div class="inline-block bg-blue-500">2</div>
    <div class="hidden bg-blue-300">3</div>
    <div class="inline-block bg-blue-100">4</div>
</div>

----Fuerza el contenido hasta abajo 
absolute bottom-0

*-/-/*/- LIBRERIA PARA PURGAR CSS pASO FINAL DEL DESARROLLO-*/-///* 
PurgeCSS : Sirve en Tailwind para quitar el código CSS que no estemos usando.
NanoCSS: Minifica el código CSS para que pese lo menos posible.
Ambas librerías nos ahorran mucho almacenamiento.

https://purgecss.com/plugins/postcss.html

Paso 1: Ejecutamos el comando 
npm i -D @fullhuman/postcss-purgecss postcss
npm i cssnano --save-dev

Paso 2: Ubicamos el archivo postcss.config.js 
y modificamos hasta que sea vea asi 

-----
const purgecss = require('@fullhuman/postcss-purgecss')

module.exports = { 
    plugins: [
        require('tailwindcss'), 
        require('autoprefixer'),
        purgecss({
            content: ['./**/*.html']
        })

        ], 
};

----
Paso 3: Paramos la aplicación y si estamos usando watch volvemos a ejeuctar para este ejemplo usamos 
npm run build -> para generar todo 
npm run dev -> para correr de nuevo 

Paso 4: Inpeccionaos codigo fuente para y en el archivo css/styles.css deberia estar solo lo que usamos 


https://github.com/LeoSan/PracticaTailwind


PASOS PARA INSTALAR TAILWIND EN NEXT 


Ya el proyecto piloto tiene tailwind solo falta configurar los archivos css y el package.json 
https://tailwindcss.com/docs/guides/nextjs 
https://www.youtube.com/watch?v=o9DjWGp9HiE&list=PLPl81lqbj-4JdoHDiERR2ptkw9zRggXAL&index=6&t=5s

