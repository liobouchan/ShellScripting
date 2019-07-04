#!/bin/bash
declare -a COMANDOS
COMANDOS[1]="cp 1.txt 2.txt"
COMANDOS[2]="cat 2.txt"
COMANDOS[3]="cp 2.txt 3.txt"

recividor=./receiveArray.sh
$recividor "${COMANDOS[@]}"