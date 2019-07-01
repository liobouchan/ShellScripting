#!/bin/bash
for num in {1,2,3,4,5}; do
  if [ -f $num.txt ]; then
    echo "$num.txt ya existe perro"
    SALIDA=$num
    else   
      echo "$num.txt not exists"

  fi
  echo "$?"
  if [[ "$SALIDA" == 1 ]]; then
    echo "Error code $SALIDA"
  fi
  if [[ "$SALIDA" == 2 ]]; then
    echo "aError code $SALIDA"
  fi
done