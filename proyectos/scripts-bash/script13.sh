#!/bin/bash

for i in $(seq 1 10)
do
    read -p "Introduce el número $i: " vector[$i]
done

echo ""
echo "=== Orden inverso ==="
for ((i=10; i>=1; i--))
do
    echo -n "${vector[$i]} "
done

echo ""
echo "=== Orden de mayor a menor ==="
ordenado=($(printf "%s\n" "${vector[@]}" | sort -nr))
for valor in "${ordenado[@]}"
do
    echo -n "$valor "
done

suma=0
for valor in "${vector[@]}"
do
    suma=$((suma + valor))
done
echo ""
echo "=== Suma total ==="
echo "Suma: $suma"

media=$((suma / 10))
echo "=== Media aritmética ==="
echo "Media: $media"