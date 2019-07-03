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

  if [[ "$exit_comando" -ne 0 ]]; then
    echo "  Ocurrió un error -- Reintentando $executed_comando"
    $executed_comando

    exit_comando=$?
    if [["$exit_comando" == 0]]; then
      echo "    El error fué solucionado al reintentar"
      else
        echo "    El error sigue persistiendo"
        echo "    Último comando ejecutado: $executed_comando"
        echo "    Último código de salida: $exit_comando"

        echo "    Insertar aquí comando para reestablecer todo"
        
        exit 1
    fi
  fi
done