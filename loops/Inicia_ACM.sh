$JRT_HOME/bin/jrtstart -i $INSTANCIA -s jlib -m start registry 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s algosec -m start server 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s ac -m start server 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s ac -m start index-server 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s web -m start server -secure 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start validation-engine 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start limit-matrix-engine 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start pc-engine 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start consolidation-engine 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start calculation-engine 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m start group 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m activate group 1>&2

$JRT_HOME/bin/jrtstart -i $INSTANCIA -s acce -m makeReadyForUse group 1>&2
