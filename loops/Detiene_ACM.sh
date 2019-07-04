#!/bin/bash
declare -a COMANDOS
COMANDOS[0]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m revokeReadyForUse group 1>&2"
COMANDOS[1]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m stop group 1>&2"
COMANDOS[2]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m stop calculation-engine 1>&2"
COMANDOS[3]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m stop consolidation-engine 1>&2"
COMANDOS[4]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m stop pc-engine 1>&2"
COMANDOS[5]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m stop limit-matrix-engine 1>&2"
COMANDOS[6]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m stop validation-engine 1>&2"
COMANDOS[7]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s ac -m stop index-server 1>&2"
COMANDOS[8]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s ac -m stop server 1>&2"
COMANDOS[9]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s web -m  stop server 1>&2"
COMANDOS[10]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s algosec -m stop server 1>&2"
COMANDOS[11]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s jlib -m stop server 1>&2"

for comando in "${COMANDOS[@]}"; do
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
done