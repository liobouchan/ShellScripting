#!/bin/bash
declare -a COMANDOS
COMANDOS[1]="cp 1.txt 2.txt"
COMANDOS[2]="cat 2.txt"
COMANDOS[3]="cp 2.txt 3.txt"
#COMANDOS[222]="NOMBRE"

declare -a DESCRIPCIONES
DESCRIPCIONES[1]="Copiado"
DESCRIPCIONES[2]="Leyendo"
DESCRIPCIONES[3]="Copiado"
#COMANDOS2[222]="NOMBRE"

declare -a TOLERANCIA
TOLERANCIA[1]="y"
TOLERANCIA[2]="y"
TOLERANCIA[3]="n"
#COMANDOS2[222]="NOMBRE"

recividor=./ManejoDeErrores.sh
$recividor "${COMANDOS[@]}" "${DESCRIPCIONES[@]}" "${TOLERANCIA[@]}"