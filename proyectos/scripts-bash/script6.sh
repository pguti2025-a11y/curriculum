#!/bin/bash

suma_for=0
for i in $(seq 1 1000)
do
    suma_for=$((suma_for + i))
done
echo "Suma con FOR: $suma_for"

suma_while=0
contador=1
while [ $contador -le 1000 ]
do
    suma_while=$((suma_while + contador))
    contador=$((contador + 1))
done
echo "Suma con WHILE: $suma_while"

suma_until=0
contador=1
until [ $contador -gt 1000 ]
do
    suma_until=$((suma_until + contador))
    contador=$((contador + 1))
done
echo "Suma con UNTIL: $suma_until"