#!/bin/bash
numberOfArguments=$#
y=$(($numberOfArguments))

echo " ARGUMENTOS $numberOfArguments"

if [ $numberOfArguments -ne 0 ]; then
  for comando in "$@"; do
    i=$(($i+1))
    if [ $i -lt $numberOfArguments ]; then
      
      #echo $i
      echo "Este comandito $comando"
      echo "numero ${!y}"
      executed_comando=${comando}
        echo "Ejecutando $executed_comando"
        $executed_comando

        exit_comando=$?
        echo "Salida $exit_comando"

        if [ "$exit_comando" -ne 0 ]; then
          echo "  Ocurrió un error -- Reintentando $executed_comando"
          $executed_comando

          exit_comando=$?
          if [ "$exit_comando" -eq 0 ]; then
            echo "    El error fué solucionado al reintentar"
            else
              echo "    El error sigue persistiendo"
              echo "    Último comando ejecutado: $executed_comando"
              echo "    Último código de salida: $exit_comando"

              echo "    Insertar aquí comando para reestablecer todo"
              
              exit 1
          fi
        fi
    fi
  done
  else
    echo "No se han recibido los parámetros"
    exit
fi