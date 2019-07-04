#!/bin/bash
declare -a COMANDOS
COMANDOS[0]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s jlib -m start registry 1>&2"
COMANDOS[1]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s algosec -m start server 1>&2"
COMANDOS[2]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s ac -m start server 1>&2"
COMANDOS[3]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s ac -m start index-server 1>&2"
COMANDOS[4]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s web -m start server -secure 1>&2"
COMANDOS[5]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start validation-engine 1>&2"
COMANDOS[6]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start limit-matrix-engine 1>&2"
COMANDOS[7]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start pc-engine 1>&2"
COMANDOS[8]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start consolidation-engine 1>&2"
COMANDOS[9]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start calculation-engine 1>&2"
COMANDOS[10]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start group 1>&2"
COMANDOS[11]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m activate group 1>&2"
COMANDOS[12]="$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m makeReadyForUse group 1>&2"

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