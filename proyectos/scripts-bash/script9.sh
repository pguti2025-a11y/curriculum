#!/bin/bash

read -p "Introduce una palabra: " palabra

palabra=$(echo $palabra | tr '[:upper:]' '[:lower:]')

vocales=0

for ((i=0; i<${#palabra}; i++))
do
    letra="${palabra:$i:1}"
    case $letra in
        a|e|i|o|u)
            vocales=$((vocales + 1))
            ;;
    esac
done

echo "La palabra '$palabra' tiene $vocales vocales"