#!/bin/bash
VARIABLE=$("./doScript.sh")
EXIT=$?
echo $EXIT
echo $VARIABLE
echo $EXIT
if [ $EXIT -eq 2 ]
  then
    echo "Si si"
fi
if [ $EXIT -eq 0 ]
  then
    echo "ManejoDeErrores"
fi