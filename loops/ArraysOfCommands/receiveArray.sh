#!/bin/bash
#declare -a COMANDOS=${1}
#echo "${COMANDOS[@]}"
numberOfArguments=$#
#allParameters="$@"

echo "Total de parametros recibidos: $numberOfArguments"

if [ $numberOfArguments -ne 0 ]; then
  for parameter in "$@"
    do
      echo $parameter
  done
  else
    echo "No se han recibido los parámetros"
    exit
fi