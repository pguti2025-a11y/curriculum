#!/bin/bash

for num in 7 8 9
do
    echo "=== Tabla de multiplicar del $num ==="
    for i in $(seq 1 10)
    do
        resultado=$((num * i))
        echo "$num x $i = $resultado"
    done
    echo ""
done