# Notas_CursoProgramacionBashShell 



## Bash scripting

> La idea básica de generar programas en bash es poder ejecutar múltiples comandos de forma secuencial en muchas ocasiones para automatizar una tarea en especifico. Estos comandos son colocados en un archivo de textos de manera secuencial para poder ejecutarlos a posterioridad.

Un archivo .vimrc podremos configurar de mejor manera nuestro editor VIM.


set showmode 
set autoindent
set tabstop=4
set expandtab
syntax on
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
let mapleader=" "
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>

## Crear nuestro primer Script

#!/bin/bash => Se le conoce como Shebang

Cuando colocas la cabecera !/bin/bash a un archivo, que a su vez has dado permisos de ejecución --x--x, estás indicando al sistema operativo cuál será la aplicación que se encargará de hacer dicha ejecución … De esta manera pudieras colocarle incluso cualquier extensión al archivo ya que al ejecutarlo con la instrucción de la terminal >./archivo.ext, sería esta cabecera la que definirá su comportamiento.

#! /bin/bash
# PROGRAMA: U-POSG
echo "Programa Utilidades Postgres"
    <<"COMENTARIO 1"
    Programa para administrar las utilidades de la Base
    de Datos Postgres
   "COMENTARIO 1"
    
exit 0