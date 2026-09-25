#!/bin/bash

numero_escondido=$((RANDOM % 101))
intentos=0
acertado=false

echo "=== ADIVINA EL NÚMERO ESCONDIDO (0-100) ==="

while [ "$acertado" = false ]
do
    read -p "Introduce un número: " numero_usuario
    
    if [ "$numero_usuario" -lt "$numero_escondido" ]
    then
        echo "El número que buscas es mayor. Sigue intentándolo"
        intentos=$((intentos + 1))
    elif [ "$numero_usuario" -gt "$numero_escondido" ]
    then
        echo "El número que buscas es menor. Sigue intentándolo"
        intentos=$((intentos + 1))
    else
        intentos=$((intentos + 1))
        echo "Enhorabuena !. Has acertado el número escondido."
        echo "El número de intentos ha sido $intentos"
        acertado=true
    fi
done