#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Error: Debes pasar un número como parámetro"
    echo "Ejemplo: ./script3.sh 5"
    exit 1
fi

numero=$1

if [ $((numero % 2)) -eq 0 ]
then
    echo "El número $numero es PAR"
else
    echo "El número $numero es IMPAR"
fi