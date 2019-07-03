#!/bin/bash

declare -a COMANDOS
COMANDOS[1]="cp 1.txt 2.txt"
COMANDOS[2]="cat 2.txt"
COMANDOS[3]="cp 2.txt 3.txt"
COMANDOS[4]="touch 1.txt"
COMANDOS[5]="touch 1.txt"

for comando in "${COMANDOS[@]}"; do
  executed_comando=${comando}
  echo "Ejecutando $executed_comando"
  $executed_comando
  exit_comando=$?
  echo "Salida $exit_comando"

done