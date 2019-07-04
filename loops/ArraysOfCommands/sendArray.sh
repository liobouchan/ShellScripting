#!/bin/bash
declare -a COMANDOS
#COMANDOS[1]="cp 1.txt 2.txt"
#COMANDOS[2]="cat 2.txt"
#COMANDOS[3]="cp 2.txt 3.txt"
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


recividor=./receiveArray.sh
$recividor "${COMANDOS[@]}"