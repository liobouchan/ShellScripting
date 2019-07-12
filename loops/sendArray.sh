#!/bin/bash
declare -a COMANDOS
COMANDOS[1]="cp 1.txt 2.txt"
COMANDOS[2]="cat 2.txt"
COMANDOS[3]="cp 2.txt 3.txt"
#COMANDOS[222]="NOMBRE"

declare -a COMANDOS2
COMANDOS2[1]="cp 1.txt 2.txt"
COMANDOS2[2]="cat 2.txt"
COMANDOS2[3]="cp 2.txt 3.txt"
#COMANDOS2[222]="NOMBRE"

recividor=./ManejoDeErrores.sh
$recividor "${COMANDOS[@]}" "${COMANDOS2[@]}"