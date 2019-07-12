#!/bin/bash
NUM_DIFFERENTS_ARRAYS=3
numberOfArguments=$#
numberOfCommands=$((numberOfArguments/NUM_DIFFERENTS_ARRAYS))
x=1

echo " "
echo " Números de Argumentos recibidos $numberOfArguments"
echo " Comandos Recibidos $numberOfCommands"
echo " "

if [ $numberOfArguments -ne 0 ]; then
  y=$(($x+$numberOfCommands))
  z=$(($y+$numberOfCommands))
  while [ $x -le $numberOfCommands ]; do

    executed_comando=${!x}
    script_description=${!y}
    tolerance=${!z}

    echo " "
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
        echo "Ejecución exitosa del script [$script_description]"
      else
        if [ "$tolerance" != "y" ]; then
          echo "    El error sigue persistiendo"
          echo "    Último comando ejecutado: $executed_comando"
          echo "    Último código de salida: $exit_comando"
          if [ "$tolerance" == "ACM" ]; then
            echo "ACM DETER"
          fi
          exit 254
        fi
      fi
    else
      echo "Ejecución exitosa del script [$script_description]"
    fi

    x=$(($x+1))
    y=$(($y+1))
    z=$(($z+1))
  done
else
  echo "No se han recibido los parámetros"
  exit
fi